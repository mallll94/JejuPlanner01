package kosta.mvc.controller;

import java.net.MalformedURLException;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/images")
@RequiredArgsConstructor
public class ImageController {
	
	private final FileStore fileStore;
	
	@ResponseBody
	@GetMapping("/{boardName}/{filename}")
	public Resource downloadImage(@PathVariable String boardName,
								  @PathVariable String filename,
								  HttpSession session) throws MalformedURLException {
		
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/" + boardName + "/";
		System.out.println(uploadPath);
		return new UrlResource("file:" + uploadPath + filename);
	}
	

}
