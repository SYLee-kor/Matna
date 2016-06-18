package com.kosta.matna.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matna.admin.email.EmailSender;
import com.kosta.matna.domain.admin.Email;
import com.kosta.matna.domain.admin.RandomPassword;
import com.kosta.matna.service.member.MemberService;

@Controller
@RequestMapping("/find")//공통URL정의
public class FindIdPwController {
	@Inject
	private MemberService memberService;
	@Inject
	private EmailSender emailSender;
	
	private static final Logger logger
    = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//회원가입폼
    public String findForm()throws Exception{
	   logger.info("Find폼 GET요청...");	
		
       return "main/header/find/findIdPw";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	public String findPw(Model model, String name, String id, String email)throws Exception{
		logger.info("FindPw POST요청...");	
		
		System.out.println(id+","+name+","+email);
		
		model.addAttribute("pageType","findPw");
		
		if(memberService.findPw(id, email, name)==null)
			model.addAttribute("result","fail");
		else{			
			model.addAttribute("result", "success");
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			RandomPassword Rpw = new RandomPassword();
			Email mail = new Email();
			String pw = Rpw.randomPassword(10);
			
			mail.setContent(Rpw.makeContent(name, id, pw));
	        mail.setReceiver(email);
	        mail.setSubject(name+"님의 임시 비밀번호입니다.");
	        emailSender.SendEmail(mail);
			memberService.updatePW(id, email, pw);
		}
		
		return "main/header/find/findResult";
	}
//	@RequestMapping(value="findPw", method=RequestMethod.POST)
//	public String findPw(Model model, String name, String id, String email)throws Exception{
//		logger.info("FindPw POST요청...");	
//		
//		System.out.println(id+","+name+","+email);
//		
//		model.addAttribute("pageType","findPw");
//		
//		if(memberService.findPw(id, email, name)==null)
//			model.addAttribute("result","fail");
//		else{			
//			model.addAttribute("result", "success");
//			model.addAttribute("name", name);
//			model.addAttribute("pw", memberService.findPw(id, email, name));
//		}
//		
//		return "main/header/find/findResult";
//	}
	
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(Model model, String name2, String email2)throws Exception{
		logger.info("FindId POST요청...");	
		
		System.out.println(name2+","+email2);
		
		model.addAttribute("pageType","findId");
		
		if(memberService.findId(email2, name2)==null)
			model.addAttribute("result","fail");
		else{
			model.addAttribute("result", "success");
			model.addAttribute("name", name2);
			model.addAttribute("id", memberService.findId(email2, name2));
		}
		
		return "main/header/find/findResult";
	}
}
