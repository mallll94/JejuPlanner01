package kosta.mvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "planner")
@Setter
@Getter
@DynamicInsert
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Planner {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "planner_seq")
	@SequenceGenerator(sequenceName = "planner_seq", allocationSize = 1, name = "planner_seq")
	private Long plannerId; //사용자플래너 번호
	
	@ManyToOne(fetch = FetchType.LAZY )
	@JoinColumn(name = "user_fk")
	@JsonIgnore
	@NonNull
	private Users user;
	
	@Column(columnDefinition = "varchar(20) default '제주도'")
	private String plannerName;
	private String plannerType; //나홀로, 연인, 친구, 가족/부모님
	private int plannerCount;
	private LocalDate plannerStart;
	private LocalDate plannerEnd;
	
	@Column(columnDefinition = "varchar(20) default 'Y'")
	private String plannerState; //삭제여부(플래너를 삭제해도 다이어리는 남음)
	                             //삭제된게 X , 남아있는게 Y

	//다이어리
	@Column(columnDefinition = "varchar(20) default '제주도'")
	private String diaryTitle; //다이어리 제목
	private String diaryPhoto; //다이어리 대표사진
	
	@CreationTimestamp
	private LocalDateTime insertDate;
	@UpdateTimestamp
	private LocalDateTime updateDate;
	
	/** 사용자 플래너 장소 */
	@OneToMany(fetch = FetchType.LAZY,  mappedBy = "planner" , cascade = CascadeType.REMOVE  , orphanRemoval = true   )
	@JsonIgnore
	private List<PlannerPlace> plannerPlaceList;
	
	/** 플래너 게시글 장소 */
	@OneToMany(fetch = FetchType.LAZY,  mappedBy = "userPlan" , cascade = CascadeType.REMOVE  , orphanRemoval = true   )
	@JsonIgnore
	private List<PlanBoard> pboardlist;
}
