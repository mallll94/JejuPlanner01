package kosta.mvc.controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Likes;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.LikesDTO;
import kosta.mvc.dto.PlanBoardDTO;
import kosta.mvc.service.PlanBoardService;
import kosta.mvc.service.PlannerService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PlanBoardController {

   private final PlanBoardService planBoardService;
   private final PlannerService plannerService;
   
   
   private final static int PAGE_COUNT=10;
   private final static int BLOCK_COUNT=5;
   


   /**전체검색 & 카테고리 & 페이징*/
   @RequestMapping("/board/PlanboardList")
   public void planList(Model model, @RequestParam(defaultValue="1") int nowPage, String pboardCategory) {
	   
      System.out.println("category????" + pboardCategory);

      Page<PlanBoard> pageList = planBoardService.selectByCate(pboardCategory , nowPage, PAGE_COUNT);
      
      int temp = (nowPage-1)%BLOCK_COUNT;
      int startPage = nowPage - temp;

      model.addAttribute("pageList", pageList);
      model.addAttribute("blockCount", BLOCK_COUNT);
      model.addAttribute("startPage", startPage);
      model.addAttribute("nowPage", nowPage);
      model.addAttribute("pboardCategory",pboardCategory);

   }

   /**전체검색 & 카테고리 & 페이징 - 관리자*/
   @RequestMapping("/admin/Planboard_Admin")
   public void planListAdmin(Model model, @RequestParam(defaultValue="1") int nowPage, String pboardCategory) {

      System.out.println("category????" + pboardCategory);

      Page<PlanBoard> pageList = planBoardService.selectByCate(pboardCategory , nowPage, PAGE_COUNT);

      int temp = (nowPage-1)%BLOCK_COUNT;
      int startPage = nowPage - temp;

      model.addAttribute("pageList", pageList);
      model.addAttribute("blockCount", BLOCK_COUNT);
      model.addAttribute("startPage", startPage);
      model.addAttribute("nowPage", nowPage);
      model.addAttribute("pboardCategory",pboardCategory);

   }


   /**상세보기 + 좋아요*/
   @RequestMapping("/board/Planboard_Detail/{pboardId}")
   public String read(@PathVariable Long pboardId , Model model) {

	  //Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
  
      PlanBoard p = planBoardService.selectById(pboardId);
      //boolean isChecked = planBoardService.selectByBoardId(pboardId, users.getUserId());

      //model.addAttribute("isChecked", isChecked); 
      
      //DTO변환
      DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
      PlanBoardDTO planBoard= new PlanBoardDTO(p.getPboardId(), p.getUserPlan().getPlannerId(),p.getUser().getUserId(), p.getUserPlan().getPlannerCount(),
   				   p.getPboardCategory(), p.getPboardTitle(), p.getPboardContent(), p.getPboardAttach(), p.getPboardRegdate().format(format), p.getLikesCount());
      
      model.addAttribute("planBoard" , planBoard);
      return "/board/Planboard_Detail";

   }
   @RequestMapping("/checkLike")
   @ResponseBody
   public int checkLike(Long pboardId ,String userId) {
	   if(userId==null) {
		   return 2; //비회원
	   }else {
		   boolean isChecked = planBoardService.selectByBoardId(pboardId, userId); 
		   if(isChecked) {
			   return 1; //좋아요 눌렀음
		   }else {
			   return 0; //좋아요 안눌렀음
		   }
	   }
   }

   /**좋아요*/
   @RequestMapping("/like")
   @ResponseBody
   public LikesDTO likes(Long pboardId, String userId) {
	   LikesDTO result = planBoardService.saveLikes(pboardId, userId);
      System.out.println(result);
      return result;
   }
   
   /**등록 폼*/
   @RequestMapping("/board/Planboard_Write")
   public void write() {
      System.out.println("write");
   }

   /**등록하기*/
   @RequestMapping(value= "/board/pinsert", method = RequestMethod.POST)
   public String insert(PlanBoard planBoard , HttpSession session, Long plannerId) {
	  Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	  planBoard.setUser(users);
	  
	  planBoard.setUserPlan(plannerService.selectBy(plannerId));
	      
      String uploadpath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/planboard/";
      planBoardService.insertPlanBoard(planBoard, uploadpath);

      System.out.println("pboardinsert");

      return "redirect:/board/PlanboardList";

   }

   /**수정 폼*/
   @RequestMapping("/board/pupdateForm")
   public ModelAndView updateForm (Long pboardId) {
	   
      PlanBoard planBoard = planBoardService.selectById(pboardId);

      System.out.println("update");

      return new ModelAndView("/board/Planboard_Update", "planBoard" , planBoard);
   }

   /**수정하기*/
   @RequestMapping(value = "/board/pupdate" , method = RequestMethod.POST)
   public String update(PlanBoard planBoard , HttpSession session ,Long plannerId) {
	  Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	  planBoard.setUser(users);
	  
	  planBoard.setUserPlan(plannerService.selectBy(plannerId));
	  
	  System.out.println("pboardupdate00");
      String uploadpath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/planboard/";
      PlanBoard dbBoard = planBoardService.updatePlanBoard(planBoard, uploadpath);
      
      System.out.println("pboardupdate");

      return "redirect:/board/Planboard_Detail/" + dbBoard.getPboardId();

   }

   /**삭제하기*/
   @RequestMapping("/board/pdelete")
   public String delete(Long pboardId) {

      System.out.println("삭제1");

      planBoardService.deletePlanBoard(pboardId);

      System.out.println("삭제2");

      return "redirect:/board/PlanboardList";      
   }


   /**삭제하기 - Admin*/
   @RequestMapping("/admin/deleteAdmin")
   public String deleteAdmin(Long pboardId) {

      System.out.println("삭제1");

      planBoardService.deletePlanBoard(pboardId);

      System.out.println("삭제2");

      return "redirect:/admin/Planboard_Admin";      
   }
   
   
   /**마이페이지에서 내가 쓴 글 목록 조회*/
   @RequestMapping("/mypage/myplanboard")
   public String myplan(Model model) {
	   
	   Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   List<PlanBoard> myplan = planBoardService.selectByUserId(users.getUserId());
   
	   model.addAttribute("myplan",myplan);
	   model.addAttribute("users",users);
	   
	   return "mypage/myplanboard";
   
   }


   @RequestMapping("/board/planSelect")
   @ResponseBody
   public List<Planner> planSelect(){
	   Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   System.out.println("Dsd");
	   return plannerService.selectByUserId(users.getUserId());
   }
   
   
   
}