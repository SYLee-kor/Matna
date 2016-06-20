package com.kosta.matna.controller.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewTest {

	@RequestMapping("/home")
	public String homeTest(){
		return "home";
	}
	
	@RequestMapping("/test/write")
	public String writeTest(){
		return "main/body/review/menu/all/write";
	}
	
	
	@RequestMapping("/test/review/list")
	public String reviewListTest(){
		return "/main/body/review/menu/all/list";
	}
	
	@RequestMapping("/test")
	public String testView(){
		return "test/review_tab";
	}
	
	@RequestMapping("/test/login")
	public String loginTest(){
		return "test/login/loginForm";
	}
	@RequestMapping("/test/finalOrder")
	public String orderTest(){
		return "main/body/item/finalOrder";
	}
	@RequestMapping("/test/itemDetail")
	public String ItemTest(){
		return "main/body/item/itemDetail";
	}
	
	@RequestMapping("/test/itemDetail2")
	public String ItemTest2(){
		return "main/body/item/itemDetail2";
	}
	
}
