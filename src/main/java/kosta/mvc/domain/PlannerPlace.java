package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

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
	private Users user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "planner_fk")
	private Planner planner;  //사용자플래너 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "place_fk")
	private Place place; //장소데이터 번호
	
	private int plannerPlaceDate; //1DAY ,2DAY....
	
}
