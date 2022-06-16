package kosta.mvc.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.ChatBoard;
import kosta.mvc.domain.QChatBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.ChatBoardRepository;
import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
	
	private final ChatBoardRepository chatBoardRep;
	
	private final UserRepository userRepository;
	
	@Override
	public List<ChatBoard> selectAll(Users user) {
		String userId = user.getUserId();
		QChatBoard chatBoard = QChatBoard.chatBoard;
		BooleanBuilder builder = new BooleanBuilder();
		
		//로그인된 유저의 모든 채팅내역을 가지고 오고 
		builder.and(chatBoard.senderUser.userId.equalsIgnoreCase(userId));
		builder.or(chatBoard.receiverUser.userId.equalsIgnoreCase(userId));
		List<ChatBoard> list=(List<ChatBoard>) chatBoardRep.findAll(builder);
		
		//방번호의 중복값을 정리해서 담아준다
		Set<Integer> chatRoom = new HashSet<Integer>();
		for(ChatBoard x : list) {
			chatRoom.add(x.getChatRoom());
		}
	
		List<Integer> chatRoomList = new ArrayList<Integer>();
		Iterator<Integer> iter = chatRoom.iterator();
		while(iter.hasNext()) {
			chatRoomList.add(iter.next());
		}
		//방번호는 다 가져왔고
		
		
		//방번호 + 마지막 메시지를 담아준다.
		List<ChatBoard> result = new ArrayList<ChatBoard>();
		
		
		
		//조건1 : 채티방번호를 정해준다
		//조건2 : 가장 마지막 날짜의 메시지를 찾는다Sort.by(Sort.chat.asc(filter))
		for(Integer i :chatRoomList) {
			BooleanBuilder selectBuilder = new BooleanBuilder();
			//조건1
			selectBuilder.and(chatBoard.chatRoom.eq(i));
			
			//조건2
			List<ChatBoard> t=(List<ChatBoard>) chatBoardRep.findAll(selectBuilder, Sort.by(Sort.Order.desc("chatSend")));
			result.add(t.get(0));
			System.out.println("시간 : "+t.get(0).getChatSend()+" | 보낸사람 :  "+ t.get(0).getSenderUser().getUserId()+" | 받는 사람 :  "+t.get(0).getReceiverUser().getUserId());
		}
		//날짜가 가장 높은값을 가져왔다
		
		
		
		return result;
	}

	@Override
	public List<ChatBoard> selectById(int chatRoom,Users users) {

		QChatBoard chatBoard = QChatBoard.chatBoard;
		BooleanBuilder builder = new BooleanBuilder();

		builder.and(chatBoard.chatRoom.eq(chatRoom));

		List<ChatBoard> receive= (List<ChatBoard>) chatBoardRep.findAll(builder,Sort.by(Sort.Order.asc("chatSend")));

		
		return receive;
	}

	@Override
	public void sendMessage(String msg,String userId,String receId,int chatRoom) {
		

		LocalDateTime now = LocalDateTime.now();
		Users sendUser=userRepository.findById(userId).orElse(null);

		Users receUser=userRepository.findById(receId).orElse(null);

		chatBoardRep.save(new ChatBoard(null, null, sendUser, receUser, chatRoom, now, null, msg, 0, null, null));

		
	
	}

	@Override
	public void changeType(int chatRoom,Users user) {
		QChatBoard chatBoard = QChatBoard.chatBoard;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(chatBoard.chatRoom.eq(chatRoom));
		
		
		List<ChatBoard> chat=(List<ChatBoard>) chatBoardRep.findAll(builder,Sort.by(Sort.Order.desc("chatSend")));
		
		
		System.out.println(chat.get(0).getChatId());
		
		Long id = chat.get(0).getChatId();
		

		ChatBoard db=chatBoardRep.findById(id).orElse(null);
		
		if(db.getSenderUser().getUserId().equals(user.getUserId())) {
			db.setChatCheck(1);
		}
		
		
		
		
		
		
		
	}

}
