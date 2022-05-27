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

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "planreply")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlanReply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "plan_reply_seq")
	@SequenceGenerator(sequenceName = "plan_reply_seq", allocationSize = 1, name = "plan_reply_seq")
	private Long pboardReplyId; //댓글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "palnboard_fk")
	private PlanBoard planBoard; //플래너공유게시판 글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userplan_fk")
	private Planner userPlan; //사용자플래너 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	@Column(length = 500)
	private String pboardReplyContent; //댓글내용
	
	@CreationTimestamp
	private LocalDateTime pboardReplyRegdate; 

}
