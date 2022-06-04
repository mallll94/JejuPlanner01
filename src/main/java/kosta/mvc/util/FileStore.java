package kosta.mvc.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileStore {
	
	
	/**
	 * 파일을 서버에 업로드하는 메서드
	 * 
	 * @param uploadFolder 업로드할 폴더 경로 ex) ~~~/WEB-INF/upload/notice/
	 * @param multipartFile 업로드할 파일
	 * @return uuidFilename 업로드 된 파일이름(uuid + filename)
	 * @throws IOException
	 */
	public String storeFile(String uploadFolder, MultipartFile multipartFile) throws IOException {
		
		String uuidFilename = getUUIDFIlename(multipartFile.getOriginalFilename());
		String storedFullPath = getFullPath(uploadFolder, uuidFilename);
		multipartFile.transferTo(new File(storedFullPath));
		return uuidFilename;
	}
	
	private String getFullPath(String uploadFolder, String filename) {
		return uploadFolder + "/" + filename;
	}
	
	private String getUUIDFIlename(String filename) {
		return UUID.randomUUID().toString() + filename;
	}
	
}