package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
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
import kosta.mvc.service.PlanBoardService;
import kosta.mvc.service.PlannerService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PlanBoardController {

   private final PlanBoardService planBoardService;
   private final UserService userService;
   private final PlannerService plannerService;
   
   
   private final static int PAGE_COUNT=6;
   private final static int BLOCK_COUNT=3;


   /**전체검색 & 카테고리 & 페이징*/
   @RequestMapping("/board/PlanboardList")
   public void planList(Model model, @RequestParam(defaultValue="1") int nowPage, String pboardCategory) {

	  Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	   
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

	  Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
  
      PlanBoard planBoard = planBoardService.selectById(pboardId);
      boolean isChecked = planBoardService.selectByBoardId(pboardId, users.getUserId());

      model.addAttribute("isChecked", isChecked);         

      model.addAttribute("planBoard" , planBoard);

      System.out.println("나와라");

      return "/board/Planboard_Detail";

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
   public String insert(PlanBoard planBoard , HttpSession session,Long plannerId) {
	  Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	  
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
   public String update(PlanBoard planBoard , HttpSession session) {
	  Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	  
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