package com.kosta.matna.controller.community;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/community")
public class FreeController {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String inputTest()throws Exception{
	   
		return "SETest/editorTest";
	}
	
}


