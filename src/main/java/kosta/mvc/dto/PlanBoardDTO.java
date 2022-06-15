package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlanBoardDTO {

	private Long pboardId;
	private Long plannerId;
	private int plannerCount;
	private String pboardCategory;
	private String pboardTitle;
	private String pboardContent;
	private String pboardAttach;
	private String pboardRegdate;
	private int likesCount;
	
}
