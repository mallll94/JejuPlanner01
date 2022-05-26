package kosta.mvc.domain;

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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "planboard")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class PlanBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "planboard_seq")
	@SequenceGenerator(sequenceName = "planboard_seq", allocationSize = 1, name = "planboard_seq")
	@NonNull
	private Long pboardId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userplan_fk")
	private Planner userPlan; //사용자플래너번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	private String pboardCategory;
	private String pboardTitle;
	
	@Column(length = 2000)
	private String pboardContent;
	private String pboardAttach;
	
	@CreationTimestamp
	private LocalDateTime pboardRegdate;
	
	private int pboardGood;
	
	/**댓글*/
	@OneToMany(mappedBy = "planBoard", cascade = CascadeType.ALL)
	private List<PlanReply> planReply;
	
	

}
