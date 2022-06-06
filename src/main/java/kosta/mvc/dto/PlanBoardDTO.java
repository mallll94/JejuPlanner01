package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PlanBoardDTO {
	
	private Long pboardId;
	private Long userPlanId;
	private Long userId;
	private String pboardCategory;
	private String pboardAttach;


}
