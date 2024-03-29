package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "plannerplace")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlannerPlace {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "planner_place_seq")
	@SequenceGenerator(sequenceName = "planner_place_seq", allocationSize = 1, name = "planner_place_seq")
	private Long plannerPlaceId; //사용자플래너장소 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")	
	@JsonIgnore
	private Users user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "planner_fk")
	@JsonIgnore
	private Planner planner;  //사용자플래너 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "place_fk")
	@JsonIgnore
	private Place place; //장소데이터 번호
	
	private int plannerPlaceDate; //1DAY ,2DAY....1, 2,
	
	@Column(length = 2000)
	private String diaryLineContent;
	private String diaryLinePhoto;
	private int diaryLinePrice;
	
	@CreationTimestamp
	private LocalDateTime insertDate;
	@UpdateTimestamp
	private LocalDateTime updateDate;
	
	@Transient
	private MultipartFile file;
	
}
