package com.kosta.matna.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
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

@Controller
@RequestMapping("/mypage")//����URL����
public class MypageController {
	@Inject
	private MemberService memberService;
	
	private static final Logger logger
    = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//ȸ��������
    public String joinGET(HttpSession session, Model model)throws Exception{
	   logger.info("���������� �� GET��û...");
	   if(session.getAttribute("userNo")!=null){
		   int userNo=(int)session.getAttribute("userNo");
	   
	   		model.addAttribute("memberVO",memberService.selectNo(userNo));
	   }
	   
       return "main/mypage/mypage";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="/modifySuccess",  method=RequestMethod.POST)//ȸ��������
    public String modifySuccess(String confirmpass,HttpSession session,
    		RedirectAttributes attr, MemberVO member, Model model)throws Exception{
	   logger.info("modifySuccess ��û...");

	   int userNo=(int)session.getAttribute("userNo");
	   
	   boolean equalPw=(member.getPw()==confirmpass);	//�������� �� ����� ��ġ�ϴ���
	   
	   if(equalPw){
		   memberService.update(member);
		   model.addAttribute("memberVO",memberService.selectNo(userNo));
		   System.out.println("�����Ϸ�");
	   }else{
		   attr.addFlashAttribute("msg","notPw");
		   System.out.println("�� ����� ��ġ���� �ʽ��ϴ�.");
	   }
       return "redirect:/mypage";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="withdraw" , method=RequestMethod.POST)//ȸ��������
    public String withdraw(HttpSession session, Model model, RedirectAttributes attr)throws Exception{
	   logger.info("ȸ��Ż�� ��û..");
	   
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
		System.out.println("�α������� ȸ����ȣ:"+application.getAttribute("loginList"));
	   
	   int userNo=(int)session.getAttribute("userNo");
	
	   	session.setAttribute("userNo", null);
		session.setAttribute("userId", null);
		session.setAttribute("userNickname", null);
		session.setAttribute("userPoint", null);
		session.setAttribute("isLogin", null);
		
		model.addAttribute("isLogin", session.getAttribute("isLogin"));
		
		memberService.delete(userNo);
		
		attr.addFlashAttribute("msg","withdraw");
	   
		return "redirect:/mypage";
    }
}
