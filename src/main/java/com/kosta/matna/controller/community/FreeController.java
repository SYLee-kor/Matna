package com.kosta.matna.controller.community;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/community")
public class FreeController {
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String inputTest()throws Exception{
		return "SETest/editorTest";
	}
	
	@RequestMapping("/submit")
	public void submit(HttpServletRequest request, String editor){
	    System.out.println("¿¡µğÅÍ ÄÁÅÙÃ÷°ª:"+request.getParameter("editor"));
	    System.out.println("¿¡µğÅÍ ÄÁÅÙÃ÷°ª(String):"+editor);
	}
	
}


