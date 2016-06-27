package com.kosta.matna.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.validator.MatnaValidator;

@Controller
@RequestMapping("/join")//공통URL정의
public class JoinController {
	
	@Inject
	private MemberService memberService;
	
	//@Autowired
	//private MemberValidator validator;
	
	private static final Logger logger
    = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//회원가입폼
    public String joinGET()throws Exception{
	   logger.info("회원가입폼 join GET요청...");	
		
       return "main/join/joinForm";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="/confirmNick",  method=RequestMethod.POST)//닉네임 중복확인
    public String nickConfirmid(@RequestParam("action2") String action2,
    		@RequestParam("nickname") String nickname, 
    		Model model)throws Exception{
		
	   logger.info("confirmNick 요청...");
	   
	   if(action2.equals("confirmNick")){
		   System.out.println("닉네임 중복 확인 : "+ nickname);
		   int key=0;
		   if (memberService.checkNickname(nickname) || nickname.equals("") 
				   || !nickname.matches("[a-zA-Zㄱ-힣0-9]{2,8}")) {
			   key = 1;
			   model.addAttribute("result", "사용 할 수 없는 닉네임 입니다");// 사용 할수 없는 닉네임
			   model.addAttribute("resultKey", key);
		   } else {
			   model.addAttribute("result", "사용 할 수 있는 닉네임 입니다");
			   model.addAttribute("resultKey", key);
		   }
		   return "main/join/confirmID";
	   }
	   
	   return "main/join/confirmID";
	}
	
	@RequestMapping(value="/confirmId",  method=RequestMethod.POST)//id 중복확인
	public String idConfirmid(@RequestParam("action2") String action2,
			@RequestParam("id") String id, Model model)throws Exception{
		
		logger.info("confirmId 요청...");
		
		if(action2.equals("confirmid")){
			System.out.println("아이디 중복 확인 : "+ id);
			int key=0;
			if (memberService.checkID(id) || id.equals("") || !id.matches("[a-zA-Z]{1}[a-zA-Z0-9]{4,9}")) {
				key = 1;
				model.addAttribute("result", "사용 할 수 없는 아이디 입니다");// 사용 할수 없는 아이디
				model.addAttribute("resultKey", key);
			} else {
				model.addAttribute("result", "사용 할 수 있는 아이디 입니다");
				model.addAttribute("resultKey", key);
			}
			return "main/join/confirmID";
		}
		
		return "main/join/confirmID";
	}
	
	@RequestMapping(value="/joinSuccess",  method=RequestMethod.POST)//회원가입폼
    public String joinSuccess(@RequestParam("action2") String action2,
    		@RequestParam("id") String id, 
    		@ModelAttribute("member") MemberVO member,
    		Model model, BindingResult bindingResult)throws Exception{
		
		if(!MatnaValidator.isValid(member, "MemberVO") ) { 
			model.addAttribute("errMsgs", MatnaValidator.getErrMsgs());
			model.addAttribute("member", member);
			model.addAttribute("action2", action2);
			return "main/join/joinForm";
		}
		
	   logger.info("joinSuccess 요청...");
	   memberService.insertMember(member);
       return "main/join/joinSuccess";//스프링에게 뷰정보 전달!!	
    }
	
	
}

