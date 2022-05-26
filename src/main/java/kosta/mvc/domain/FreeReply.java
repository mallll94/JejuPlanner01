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
@Table(name = "freereply")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class FreeReply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "free_reply_seq")
	@SequenceGenerator(sequenceName = "free_reply_seq", allocationSize = 1, name = "free_reply_seq")
	@NonNull
	private Long freeReplyId; //댓글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name= "free_fk")
	private FreeBoard freeBoard; //부모 글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	@Column(length = 500)
	private String freeReplyContent;
	
	@CreationTimestamp
	private LocalDateTime freeReplyRegdate;

}
