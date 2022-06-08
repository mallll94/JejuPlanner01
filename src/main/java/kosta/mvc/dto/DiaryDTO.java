package kosta.mvc.dto;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DiaryDTO {

	private String diaryTitle;
	private String diaryPhoto; //대표사진
	private String diaryType;
	private int diaryCount;
	
	private Long plannerId;
	private String plannerStart;
	private String plannerEnd;
	private int planDays;
}
