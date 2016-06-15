package com.kosta.matna.controller.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewTest {

	@RequestMapping("/home")
	public String homeTest(){
		return "home";
	}
	
	@RequestMapping("/write")
	public String writeTest(){
		return "review/menu/all/write";
	}
	
	@RequestMapping("/content")
	public String contentTest(){
		return "review/content";
	}
	
	@RequestMapping("/test/login")
	public String loginTest(){
		return "test/login/loginForm";
	}
	
}
