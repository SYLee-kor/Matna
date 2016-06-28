package com.kosta.matna.controller.viewtest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.message.MessageService;

@Controller
public class ViewTest {

	@Inject
	private MemberService memberService;
	
	@Inject
	private MessageService messageService;
	
	@RequestMapping("/home")
	public String homeTest(HttpSession session)throws Exception{
		MemberVO member = new MemberVO();
		
		if(session.getAttribute("userId")!=null){
			member = memberService.selectID((String)session.getAttribute("userId"));
			session.setAttribute("userNickname", member.getNickname());
			session.setAttribute("userPoint", member.getPoint());
			/*//새로운 메세지가 있는가
			session.setAttribute("isNewMessage",messageService.IsNewMessage(member.getNo()));*/
		}
		return "home";
	}
	
	@RequestMapping("/test/write")
	public String writeTest(){
		return "main/body/review/menu/all/write";
	}
	
	@RequestMapping("/test/content")
	public String contentTest(){
		return "main/body/review/content";
	}
	
	
	@RequestMapping("/test/review/list")
	public String reviewListTest(){
		return "/main/body/review/menu/all/list";
	}
	
	
	@RequestMapping("/test/comm/list")
	public String commuListTest(){
		return "/main/body/community/all/list_comm";
	}
	
	
	@RequestMapping("/test/comm/content")
	public String commuContentTest(){
		return "/main/body/community/all/content_comm";
	}
	
	
	@RequestMapping("/test/comm/write")
	public String commuWriteTest(){
		return "/main/body/community/all/write_comm";
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
	
	@RequestMapping("/test/item/list")
	public String itemListTest(){
		return "main/body/item/itemList";
	}
	
	@RequestMapping("/test/itemDetail2")
	public String ItemTest2(){
		return "main/body/item/itemDetail2";
	}
	
}
