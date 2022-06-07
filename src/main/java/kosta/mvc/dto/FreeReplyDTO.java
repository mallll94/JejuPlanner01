package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FreeReplyDTO {
	
	private Long freeReplyId;
	private Long freeId;
	private String userId;
	private String freeReplyContent;

}
