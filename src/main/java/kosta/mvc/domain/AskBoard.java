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
@Getter
@Setter
@Table(name = "askboard")
@NoArgsConstructor
@AllArgsConstructor
public class AskBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ask_seq")
	@SequenceGenerator(sequenceName = "ask_seq", allocationSize = 1, name = "ask_seq")
	private Long askId; //글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_fk")
	private Users user;
	
	private String askCategory;
	private String askTitle;
	
	@Column(length = 2000)
	private String askContent;
	
	private String askAttach;
	private String askComplete; //답변여부
	
	@CreationTimestamp
	private LocalDateTime askRegdate;
	
	/** 댓글 */
	@OneToMany(mappedBy = "askBoard", cascade = CascadeType.ALL)
	private List<AskReply> askReplyList;

}
