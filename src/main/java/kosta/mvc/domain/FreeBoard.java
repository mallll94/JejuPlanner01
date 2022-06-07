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
import javax.transaction.Transactional;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "freeboard")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FreeBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "free_seq")
	@SequenceGenerator(sequenceName = "free_seq", allocationSize = 1, name = "free_seq")
	private Long freeId; //글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	private String freeCategory;
	private String freeTitle;
	
	@Column(length=2000)
	private String freeContent;
	
	private String freeAttach;
	private int freeReadnum;
	
	@CreationTimestamp
	private LocalDateTime freeRegdate;
	
	@UpdateTimestamp
	private LocalDateTime freeUpdate;
	
	@Transient
	private MultipartFile file;
	
	/** 댓글 */
	//@OneToMany(mappedBy = "freeBoard", cascade = CascadeType.ALL)
	//private List<FreeReply> freeReplyList;

	

}
