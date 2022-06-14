package kosta.mvc.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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
}
