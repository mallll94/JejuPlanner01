package kosta.mvc.dto;

import java.time.format.DateTimeFormatter;

import kosta.mvc.domain.CrewBoard;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class CrewDTO {

	private Long crewId;
	private String userId;
	private String crewTitle;
	private String crewContent;
	private String crewState;
	private String crewRegdate;
	private String crewUpdate;
	
	public static CrewDTO of(CrewBoard crewBoard, DateTimeFormatter formatter) {
		
		return new CrewDTO(
				crewBoard.getCrewId(),
				crewBoard.getUser().getUserId(),
				crewBoard.getCrewTitle(),
				crewBoard.getCrewContent(),
				crewBoard.getCrewState(),
				crewBoard.getCrewRegdate().format(formatter),
				crewBoard.getCrewUpdate().format(formatter));
		
	}
	
}
