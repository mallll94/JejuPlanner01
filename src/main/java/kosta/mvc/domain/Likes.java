package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "likes_seq")
	@SequenceGenerator(sequenceName = "likes_seq", allocationSize = 1, name = "likes_seq")
	private Long likeId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "planboard_fk")
	private PlanBoard planBoard;
	
//	public static Likes toLikes(Users user , PlanBoard planBoard) {
//		Likes likes = new Likes();
//		likes.setUser(user);
//		likes.setPlanBoard(planBoard);
//		
//		return likes;
//		
//	}
//	
 
}
