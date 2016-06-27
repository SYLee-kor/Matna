package com.kosta.matna.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.admin.email.EmailSender;
import com.kosta.matna.domain.admin.Email;
import com.kosta.matna.domain.admin.RandomPassword;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.validator.MatnaValidator;

@Controller
@RequestMapping("/join")//°øÅëURLÁ¤ÀÇ
public class JoinController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private EmailSender emailSender;
	
	//@Autowired
	//private MemberValidator validator;
	
	private static final Logger logger
    = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//È¸¿ø°¡ÀÔÆû
    public String joinGET()throws Exception{
	   logger.info("È¸¿ø°¡ÀÔÆû join GET¿äÃ»...");	
		
       return "main/join/joinForm";//½ºÇÁ¸µ¿¡°Ô ºäÁ¤º¸ Àü´Þ!!	
    }
	
	@RequestMapping(value="/confirmNick",  method=RequestMethod.POST)//´Ð³×ÀÓ Áßº¹È®ÀÎ
    public String nickConfirmid(@RequestParam("action2") String action2,
    		@RequestParam("nickname") String nickname, 
    		Model model)throws Exception{
		
	   logger.info("confirmNick ¿äÃ»...");
	   
	   if(action2.equals("confirmNick")){
		   System.out.println("´Ð³×ÀÓ Áßº¹ È®ÀÎ : "+ nickname);
		   int key=0;
		   if (memberService.checkNickname(nickname) || nickname.equals("") 
				   || !nickname.matches("[a-zA-Z¤¡-ÆR0-9]{2,8}")) {
			   key = 1;
			   model.addAttribute("result", "»ç¿ë ÇÒ ¼ö ¾ø´Â ´Ð³×ÀÓ ÀÔ´Ï´Ù");// »ç¿ë ÇÒ¼ö ¾ø´Â ´Ð³×ÀÓ
			   model.addAttribute("resultKey", key);
		   } else {
			   model.addAttribute("result", "»ç¿ë ÇÒ ¼ö ÀÖ´Â ´Ð³×ÀÓ ÀÔ´Ï´Ù");
			   model.addAttribute("resultKey", key);
		   }
		   return "main/join/confirmID";
	   }
	   
	   return "main/join/confirmID";
	}
	
	@RequestMapping(value="/confirmId",  method=RequestMethod.POST)//id Áßº¹È®ÀÎ
	public String idConfirmid(@RequestParam("action2") String action2,
			@RequestParam("id") String id, Model model)throws Exception{
		
		logger.info("confirmId ¿äÃ»...");
		
		if(action2.equals("confirmid")){
			System.out.println("¾ÆÀÌµð Áßº¹ È®ÀÎ : "+ id);
			int key=0;
			if (memberService.checkID(id) || id.equals("") || !id.matches("[a-zA-Z]{1}[a-zA-Z0-9]{4,9}")) {
				key = 1;
				model.addAttribute("result", "»ç¿ë ÇÒ ¼ö ¾ø´Â ¾ÆÀÌµð ÀÔ´Ï´Ù");// »ç¿ë ÇÒ¼ö ¾ø´Â ¾ÆÀÌµð
				model.addAttribute("resultKey", key);
			} else {
				model.addAttribute("result", "»ç¿ë ÇÒ ¼ö ÀÖ´Â ¾ÆÀÌµð ÀÔ´Ï´Ù");
				model.addAttribute("resultKey", key);
			}
			return "main/join/confirmID";
		}
		
		return "main/join/confirmID";
	}
	
	@RequestMapping(value="/confirmEmail",  method=RequestMethod.POST)//id Áßº¹È®ÀÎ
	public String confirmEmail(HttpSession session,Model model, String email)throws Exception{
			RandomPassword Rpw = new RandomPassword();
			String emailKey = Rpw.randomPassword(6);
			session.setAttribute("confirmEmail", emailKey);
			session.setMaxInactiveInterval(180);
			logger.info("confirmEmail ¿äÃ»...");
			
			Email mail = new Email();
			mail.setContent(Rpw.makeConfirmEmail(emailKey));
			mail.setReceiver(email);
			mail.setSubject("ÀÌ¸ÞÀÏ ÀÎÁõ ¹øÈ£ ÀÔ´Ï´Ù.");
			
			emailSender.SendEmail(mail);
			
			model.addAttribute("result", "ÀÎÁõ¹øÈ£°¡ ¹ß¼ÛµÇ¾ú½À´Ï´Ù.");
			
			return "main/join/confirmEmail";
	}
	
	@RequestMapping(value="/tryConfirmEmail",  method=RequestMethod.POST)//id Áßº¹È®ÀÎ
	public @ResponseBody Map<String,String> tryConfirmEmail(HttpSession session,Model model,String confirmNum)throws Exception{
			Map resultMap = new HashMap();
			
			if(confirmNum.trim().equals(session.getAttribute("confirmEmail"))){
				resultMap.put("result", "ÀÎÁõµÇ¾ú½À´Ï´Ù.");
				resultMap.put("confirm", "success");			
			}else{
				resultMap.put("result", "ÀÎÁõ ½ÇÆÐÇÏ¿´½À´Ï´Ù.");
				resultMap.put("confirm", "fail");
			}
			return resultMap;
			
	}
	
	@RequestMapping(value="/joinSuccess",  method=RequestMethod.POST)//È¸¿ø°¡ÀÔÆû
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
		
	   logger.info("joinSuccess ¿äÃ»...");
	   memberService.insertMember(member);
       return "main/join/joinSuccess";//½ºÇÁ¸µ¿¡°Ô ºäÁ¤º¸ Àü´Þ!!	
    }
	
	
}

