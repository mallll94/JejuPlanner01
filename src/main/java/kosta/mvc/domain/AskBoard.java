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
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@DynamicInsert
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
	
	@Column(columnDefinition = "varchar2(20) default 'N'")
	private String askComplete; //답변여부 Y는 답변완료 N은 미완료
	
	@CreationTimestamp
	@Column(updatable = false)
	private LocalDateTime askRegdate;
	
	@Transient
	private MultipartFile file;
	
	/** 댓글 */
	@OneToMany(mappedBy = "askBoard", cascade = CascadeType.ALL)
	private List<AskReply> askReplyList;

}
