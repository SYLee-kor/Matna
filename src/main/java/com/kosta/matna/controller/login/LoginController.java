package com.kosta.matna.controller.login;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.message.MessageService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Inject
	private MemberService memberService;
	
	@Inject
	private MessageService messageService;
	
	private static final Logger logger
    = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="", method=RequestMethod.GET)	//로그인폼
    public String loginForm(Model model,HttpSession session)throws Exception{
		logger.info("로그인 form 요청..");
		/*if(session.getAttribute("userNo")==null)
			return "project/login/login";
		else{
			
			return "redirect:/login/login";
		}*/
		
		//model.addAttribute("isLogin", session.getAttribute("isLogin"));
		
		return "main/header/login/login";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)	//로그인폼
    public String logout(HttpSession session, Model model)throws Exception{
		logger.info("로그아웃 요청..");
		
		ServletContext application = session.getServletContext();
		List<Integer> loginList = (List<Integer>)application.getAttribute("loginList");
		loginList = (loginList == null) ? new ArrayList<Integer>() : loginList;
		for (int i = 0; i < loginList.size(); i++) {
			//System.out.println(loginList.get(i)+","+session.getAttribute("userNo"));
			if( loginList.get(i) == session.getAttribute("userNo")) {
				loginList.remove(i);
			}
		}
		application.setAttribute("loginList",loginList );
		System.out.println("로그인중인 회원번호:"+application.getAttribute("loginList"));
		
		session.setAttribute("userNo", null);
		session.setAttribute("userId", null);
		session.setAttribute("userNickname", null);
		session.setAttribute("userPoint", null);
		session.setAttribute("isLogin", null);
		
		model.addAttribute("isLogin", session.getAttribute("isLogin"));
		
	   return "redirect:/home";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)	//로그인
	public String loginPost(Model model, String login_id, String login_pass, RedirectAttributes attr,
			HttpSession session, HttpServletRequest request)throws Exception{
		logger.info("로그인 Post 요청..");
		
		MemberVO member = new MemberVO();
		if(login_id!=null&&login_pass!=null)
			member = memberService.selectIsMember(login_id, login_pass);
		
		if(member==null){
			attr.addFlashAttribute("msg","fail");
			return "redirect:/home";
		}
		
		
		ServletContext application = session.getServletContext();
		List<Integer> loginList = (List<Integer>)application.getAttribute("loginList");
		loginList = (loginList == null) ? new ArrayList<Integer>() : loginList;
		for (int i = 0; i < loginList.size(); i++) {
			if( loginList.get(i) == member.getNo()) {
				attr.addFlashAttribute("msg", false);
				return "redirect:/home";
			}
		}
		
		loginList.add(member.getNo());
		application.setAttribute("loginList",loginList );
		System.out.println("로그인중인 회원번호:"+application.getAttribute("loginList"));
		
		String gradeNames[] = {"일반 회원","우수 회원","특별 회원","부 관리자","관리자"};
		
		
		if(member.getGrade()==1 && member.getAllpoint()>=500 && member.getAllpoint()<3000){
				memberService.updateGrade(member.getNo(), 2);
				member = memberService.selectIsMember(login_id, login_pass);
				attr.addFlashAttribute("msg", "upgrade");
		}else if(member.getGrade()==1&& member.getAllpoint()>=3000){
			memberService.updateGrade(member.getNo(), 3);
			member = memberService.selectIsMember(login_id, login_pass);
			attr.addFlashAttribute("msg", "upgrade");
		}else if(member.getGrade()==2 && member.getAllpoint()>=3000){
			memberService.updateGrade(member.getNo(), 3);
			member = memberService.selectIsMember(login_id, login_pass);
			attr.addFlashAttribute("msg", "upgrade");
		}
		
		//새로운 메세지가 있는가
		session.setAttribute("isNewMessage",messageService.IsNewMessage(member.getNo()));
		/*System.out.println(messageService.IsNewMessage(member.getNo()));
		System.out.println("LoginControler - userGrade : "+member.getGrade());*/
		session.setAttribute("userNo", member.getNo());
		session.setAttribute("userId", member.getId());
		session.setAttribute("userNickname", member.getNickname());
		session.setAttribute("userPoint", member.getPoint());
		session.setAttribute("isLogin", true);
		int userGrade = member.getGrade() < 1 ? 1 : member.getGrade();
		session.setAttribute("userGrade", userGrade);
		session.setAttribute("gradeName", gradeNames[userGrade-1]);
	   return "redirect:/home";
	}
	@RequestMapping(value="login", method=RequestMethod.GET)	//로그인
	public String loginGet(Model model, String login_id, String login_pass, RedirectAttributes attr,
			HttpSession session, HttpServletRequest request)throws Exception{
		logger.info("로그인 Get 요청..");
		MemberVO member = new MemberVO();
		if(login_id!=null&&login_pass!=null)
			member = memberService.selectIsMember(login_id, login_pass);
		
		if(member==null&&session.getAttribute("userNo")==null){
			attr.addFlashAttribute("msg","fail");
			return "redirect:/login";
		}

		model.addAttribute("nickname",session.getAttribute("userNickname"));
		model.addAttribute("point",session.getAttribute("userPoint"));
		
		return "main/header/login/loginSuccess";
	}


}
