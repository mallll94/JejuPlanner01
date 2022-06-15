package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AskBoardDTO {

	private Long askId;
	private String userId;
	private String askCategory;
	private String askTitle;
	private String askContent;
	private String askAttach;
	private String askComplete;
	private String askRegdate;
}
