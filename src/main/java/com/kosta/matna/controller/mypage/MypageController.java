package com.kosta.matna.controller.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.service.admin.AdminService;
import com.kosta.matna.service.member.MemberService;

@Controller
@RequestMapping("/mypage")//공통URL정의
public class MypageController {
	@Inject
	private MemberService memberService;
	
	@Inject
	private AdminService service;
	
	private static final Logger logger
    = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//회원가입폼
    public String joinGET(HttpSession session, Model model)throws Exception{
	   logger.info("마이페이지 폼 GET요청...");
	   if(session.getAttribute("userNo")!=null){
		   int userNo=(int)session.getAttribute("userNo");
		   
	   		model.addAttribute("memberVO",memberService.selectNo(userNo));//회원정보 전달
	   		
	   }
	   
       return "main/mypage/mypage";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="/modifySuccess",  method=RequestMethod.POST)//회원가입폼
    public String modifySuccess(String confirmpass,HttpSession session,
    		RedirectAttributes attr, MemberVO member, Model model)throws Exception{
	   logger.info("modifySuccess 요청...");

	   int userNo=(int)session.getAttribute("userNo");
	   
	   boolean equalPw=(member.getPw().equals(confirmpass));	//수정폼의 두 비번이 일치하는지
	   
	   if(equalPw){
		   memberService.update(member);
		   model.addAttribute("memberVO",memberService.selectNo(userNo));
		   System.out.println("수정완료");
	   }else{
		   attr.addFlashAttribute("msg","notPw");
		   System.out.println("두 비번이 일치하지 않습니다.");
	   }
       return "redirect:/mypage";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="withdraw" , method=RequestMethod.POST)//회원가입폼
    public String withdraw(HttpSession session, Model model, RedirectAttributes attr)throws Exception{
	   logger.info("회원탈퇴 요청..");
	   
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
	
	//-----------------------------------------마이페이지 상품리스트
	
	public String orderList(Model model, Criteria cri,String searchId, String search){
		try {
			//List<Member_orderVO> orders= service.orderlistAll( new RowBounds(cri.getPageStart(), cri.getPerPageNum()));			
			searchId = ( searchId == null || searchId.length()==0 ) ? "buyer" : searchId;
			search = ( search == null ) ? "" : search;
			
			//검색
			Map<String, String> map = new HashMap<>();
				map.put("id", searchId);
				map.put("search",search);
			
			List<Member_orderVO> orders= service.orderSearchList(map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
			model.addAttribute("orders",orders);
			
			//페이징
			int totalCount = service.orderListCount(map);
			int page = ( cri.getPage() <= 0 )? 1 : cri.getPage();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker(cri, totalCount);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("searchId", searchId);
			model.addAttribute("search",search);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage";
	}
	
	
	//-----------------------------------------마이페이지 상품리스트
	
}
