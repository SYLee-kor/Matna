package com.kosta.matna.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.message.MessageService;

public class MessageInterceptor extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(MessageInterceptor.class);
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private MessageService messageService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object userNo = session.getAttribute("userNo");
		
		MemberVO member = new MemberVO();
		
		if( userNo != null ){
			HandlerMethod method = (HandlerMethod)handler;
			member = memberService.selectID((String)session.getAttribute("userId"));
			//새로운 메세지가 있는가
			session.setAttribute("isNewMessage",messageService.IsNewMessage(member.getNo()));

		}
		return true; // # 로그인 한 상태
	}
}
