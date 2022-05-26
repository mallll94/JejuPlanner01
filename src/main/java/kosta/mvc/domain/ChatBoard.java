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

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "chatboard")
@Setter
@Getter
@DynamicInsert
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class ChatBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "chat_seq")
	@SequenceGenerator(sequenceName = "chat_seq", allocationSize = 1, name = "chat_seq")
	@NonNull
	private Long chatId; //채팅번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "crew_fk")
	private CrewBoard crewboard; //부모 글번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="receiver_fk")
	private Users receiverUser; //수신자
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="sender_fk")
	private Users senderUser; //발신자  
	
	private int chatRoom; //방번호
	
	@CreationTimestamp
	private LocalDateTime chatSend; //보낸시간
	
	private LocalDateTime chatRead; //읽은시간
	
	@Column(length = 2000)
	private String chatContent;
	
	@Column(columnDefinition = "varchar2(20) default 'N'")
	private int chatCheck; //메세지읽기체크 , 읽으면 R 안읽으면 N
}
