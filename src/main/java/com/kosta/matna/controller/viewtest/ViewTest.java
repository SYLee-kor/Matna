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
	
	@RequestMapping("/test")
	public String testView(){
		return "test/review_tab";
	}
}
