package kosta.mvc.dto;

import java.time.LocalDateTime;
import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.Users;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ChatDTO {
	
	private Long chatId; //채팅번호
	private CrewBoard crewboard; //부모 글번호
	private String receiverUserId; //수신자 ----
	private String senderUserId; //발신자  
	private int chatRoom; //방번호 ----
	private LocalDateTime chatSend; //보낸시간
	private LocalDateTime chatRead; //읽은시간
	private String chatContent;
	private int chatCheck; //메세지읽기체크 , 읽으면 1 안읽으면 0
	
}
