package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "diaryline")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DiaryLine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "diary_line_seq")
	@SequenceGenerator(sequenceName = "diary_line_seq", allocationSize = 1, name = "diary_line_seq")
	private Long diaryLineId; //다이어리상세 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "diary_fk")
	private Diary diary; //다이어리 번호
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "planner_fk")
	private PlannerPlace plannerPlace; //사용자플래너장소 번호
	
	@Column(length = 2000)
	private String diaryLineContent;
	
	private String diaryLinePhoto;
	private int diaryLinePrice;
	
	
	

}
