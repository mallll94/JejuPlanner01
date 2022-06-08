package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlanReplyDTO {

	private Long pboardReplyId;
	private Long planBoardId;
	private String userId;
	private String pboardReplyContent;

}
