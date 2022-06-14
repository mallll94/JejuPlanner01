package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.CrewReply;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.CrewReplyDTO;
import kosta.mvc.service.CrewReplyService;
import kosta.mvc.service.CrewService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CrewReplyController {
	
	private final CrewReplyService crewReplyService;
	private final CrewService crewService;
	private final UserService userService;
	
	/**댓글조회*/
	@RequestMapping("/reply/crew_Detail")
	@ResponseBody
	public List<CrewReplyDTO> crewReplyList(String crewId){
		CrewBoard crewboard = crewService.selectById(Long.valueOf(crewId));
		
		List<CrewReply> dblist = crewboard.getCrewReply();
		
		System.out.println("개수" + dblist.size());
		
		List<CrewReplyDTO> list = new ArrayList<CrewReplyDTO>();
		for(CrewReply x : dblist) {
			list.add(new CrewReplyDTO(x.getCrewReplyId(), x.getCrewBoard().getCrewId(), 
					x.getUser().getUserId() , x.getCrewReplyContent()) );
		}
		
		return list;
	
	}
	
		
	/**댓글등록*/
	@RequestMapping("/reply/cinsert")
	@ResponseBody
	public void insert(String replyContent, String crewId) {
		//Users user = userService.selectById("aaa");
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		CrewReply reply = new CrewReply(null, null, users, replyContent, null);
		crewReplyService.insert(Long.valueOf(crewId) , reply);
		
		System.out.println("크루댓글등록");
				
				
	}
	
		
	/**댓글삭제*/
	@RequestMapping("/reply/cdelete")
	@ResponseBody
	public void delete(String crewReplyId) {
		crewReplyService.delete(Long.valueOf(crewReplyId));
	}

}
