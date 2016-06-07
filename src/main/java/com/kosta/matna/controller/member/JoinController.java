package com.kosta.matna.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.persistence.member.MemberValidator;
import com.kosta.matna.service.member.MemberService;

@Controller
@RequestMapping("/join")//공통URL정의
public class JoinController {
	
	@Inject
	private MemberService memberService;
	
	@Autowired
	private MemberValidator validator;
	
	private static final Logger logger
    = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//회원가입폼
    public String joinGET()throws Exception{
	   logger.info("회원가입폼 join GET요청...");	
		
       return "project/joinForm";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="/joinSuccess",  method=RequestMethod.POST)//회원가입폼
    public String joinSuccess(@RequestParam("action2") String action2,
    		@RequestParam("id") String id, MemberVO member, Model model)throws Exception{
	   logger.info("joinSuccess 요청...");
	   System.out.println("action2: "+action2);
	   if(action2.equals("confirmid")){
		   System.out.println("아이디 중복 확인 : "+id);
		   int key=0;
		   if (memberService.checkID(id)) {
				key = 1;
				model.addAttribute("result", "사용 할 수 없는 아이디 입니다");// 사용 할수 없는 아이디
				model.addAttribute("resultKey", key);
			} else {
				model.addAttribute("result", "사용 할 수 있는 아이디 입니다");
				model.addAttribute("resultKey", key);
			}
		   return "project/confirmID";
	   }
	   memberService.insertMember(member);
       return "project/joinSuccess";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping("/listAll")//게시물 전체 목록 요청
	public String listAll(Model model)throws Exception{
		logger.info("전체 회원list 요청..."+ model);	
		model.addAttribute("list", memberService.listAll());
	   return "project/listAll";
	}
	
	@RequestMapping(value="/update" , method=RequestMethod.GET)//회원가입폼
    public String updateGET(Model model)throws Exception{
	   logger.info("회원가입 수정폼 update GET요청...");
	   model.addAttribute("memberVO", memberService.selectID("hong"));
		
       return "project/updateForm";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="/updateSuccess",  method=RequestMethod.POST)//회원가입폼
    public String updateSuccess(MemberVO member, Model model)throws Exception{
	   logger.info("updateSuccess 요청...");
	   
	   memberService.update(member);
	   
	   model.addAttribute("list", memberService.listAll());
       return "project/listAll";//스프링에게 뷰정보 전달!!	
    }

	@RequestMapping("/delete")
	public String delete(@RequestParam("no") int memberNo, 
			RedirectAttributes attr)throws Exception{
		logger.info("게시물 삭제...["+ memberNo +"]");
		memberService.delete(memberNo);
		attr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/join/listAll";
	}
}
