package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CrewReplyDTO {
	
	private Long crewReplyId;
	private Long crewBoardId;
	private String userId;
	private String crewReplyContent;

}
