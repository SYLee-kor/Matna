package com.kosta.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matna.controller.message.MessageController;

@Controller
@RequestMapping("/jq")
public class JqplotTest {
	
	private static final Logger logger
    = LoggerFactory.getLogger(JqplotTest.class);
	
	@RequestMapping(value="", method=RequestMethod.GET)	//�޽��� ����
    public String jqplot()throws Exception{
		logger.info("jqplot GET ��û..");	
	   return "test/jqplot";
	}
	
}
