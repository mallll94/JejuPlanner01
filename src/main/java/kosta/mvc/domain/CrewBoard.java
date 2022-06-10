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
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "crewboard")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CrewBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crew_seq")
	@SequenceGenerator(sequenceName = "crew_seq", allocationSize = 1, name = "crew_seq")
	private Long crewId; //동행구하기 글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	private String crewTitle;
	
	@Column(length = 2000)
	private String crewContent;
	
	@Column(columnDefinition = "varchar2(20) default 'N'")
	private String crewState; //완료여부 Y-완료 N-완료아님
	
	@CreationTimestamp
	private LocalDateTime crewRegdate;
	
	@UpdateTimestamp
	private LocalDateTime crewUpdate;
	
	/**댓글*/
	@OneToMany(mappedBy = "crewBoard" , cascade = CascadeType.ALL)
    private List<CrewReply> crewReply;
}
