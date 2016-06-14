package com.kosta.matna.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.matna.admin.email.EmailSender;
import com.kosta.matna.domain.admin.Email;

@Controller
public class EmailTest {
	
	public EmailTest() {
	}
	
	 @Autowired
	   private EmailSender emailSender;
	   @Autowired
	   private Email email;
	    @RequestMapping("/sendpw.do")
	    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
	        ModelAndView mav;
	        
	            email.setContent("테스트는 완벽하지");
	            email.setReceiver("hsj1172@gmail.com");
	            email.setSubject("mail Test");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("redirect:/login.do");
	            return mav;
	    }


}
