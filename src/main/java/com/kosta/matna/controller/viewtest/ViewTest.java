package com.kosta.matna.controller.viewtest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;

@Controller
public class ViewTest {

	@Inject
	private MemberService memberService;
	
	@RequestMapping("/home")
	public String homeTest(HttpSession session)throws Exception{
		MemberVO member = new MemberVO();
		
		if(session.getAttribute("userId")!=null){
			member = memberService.selectID((String)session.getAttribute("userId"));
			session.setAttribute("userNickname", member.getNickname());
			session.setAttribute("userPoint", member.getPoint());
		}
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
