package kosta.mvc.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name = "diary")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Diary {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "diary_seq")
	@SequenceGenerator(sequenceName = "diary_seq", allocationSize = 1, name = "diary_seq")
	@NonNull
	private Long diaryId; //다이어리 글 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	@OneToOne(fetch = FetchType.LAZY)
	private Planner planner; //사용자플래너번호
	
	private String diaryPhoto; //대표사진
	private String diaryTitle;
	private String diaryType;
	private int diaryCount;

	/** 다이어리 상세 */
	@OneToMany(mappedBy = "diary")
	private List<DiaryLine> diaryLineList;
}
