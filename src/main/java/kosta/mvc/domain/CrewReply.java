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

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "crewreply")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CrewReply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crew_reply_seq")
	@SequenceGenerator(sequenceName = "crew_reply_seq", allocationSize = 1, name = "crew_reply_seq")
	private Long crewReplyId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "crewboard_fk")
	private CrewBoard crewBoard;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	@JsonIgnore
	private Users user;
	
	@Column(length = 500)
	private String crewReplyContent;
	
	@CreationTimestamp
	private LocalDateTime crewReplyRegdate;

}
