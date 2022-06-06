package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Likes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long likeId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "planboard_fk")
	private PlanBoard planBoard;

}
