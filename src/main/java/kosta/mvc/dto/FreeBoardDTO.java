package kosta.mvc.dto;



import java.time.format.DateTimeFormatter;

import kosta.mvc.domain.FreeBoard;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class FreeBoardDTO {
	private Long freeId;
	private String userId;
	private String freeCategory;
	private String freeTitle;
	private String freeContent;
	
	private String freeAttach;
	private int freeReadnum;
	private String freeRegdate;
	private String freeUpdate;
	
	public static FreeBoardDTO of(FreeBoard freeBoard, DateTimeFormatter formatter) {
		
		return new FreeBoardDTO(
				freeBoard.getFreeId(),
				freeBoard.getUser().getUserId(),
				freeBoard.getFreeCategory(),
				freeBoard.getFreeTitle(),
				freeBoard.getFreeContent(),
				freeBoard.getFreeAttach(),
				freeBoard.getFreeReadnum(),
				freeBoard.getFreeRegdate().format(formatter),
				freeBoard.getFreeUpdate().format(formatter));
	}
}
