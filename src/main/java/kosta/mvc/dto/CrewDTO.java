package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CrewDTO {

	private Long crewId;
	private String userId;
	private String crewTitle;
	private String crewContent;
	private String crewState;
	private String crewRegdate;
	private String crewUpdate;
	
}
