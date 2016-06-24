package com.kosta.matna.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object userNo = session.getAttribute("userNo");
		HandlerMethod method = (HandlerMethod)handler;
		MethodParameter params[] = method.getMethodParameters();
		params[0].getParameterName();
		
		logger.info("���� �޼ҵ� : "+method.getMethod());
		logger.info("�α��� ������ȣ : "+userNo);
		if( userNo == null ){
			response.sendRedirect("/matna/home?login=fail");
			return false; // # �α��� ���� ����
		}
		return true; // # �α��� �� ����
	}
	
	
}
