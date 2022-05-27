package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
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
@Table(name = "askreply")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class AskReply {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ask_reply_seq")
	@SequenceGenerator(sequenceName = "ask_reply_seq", allocationSize = 1, name = "ask_reply_seq")
	private Long askReplyId; //댓글번호
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "ask_fk")
	private AskBoard askBoard; //부모 글번호
	
	@Column(length = 500)
	private String askReplyContent;
	
	@CreationTimestamp
	private LocalDateTime askReplyRegdate;
	
}
