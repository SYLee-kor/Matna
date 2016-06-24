package com.kosta.matna.controller.test;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.matna.service.member.MemberService;

@Controller
public class DaumMapTest {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping("/mapTest")
	public String showMap() { 
		return "test/daumMapTest";
	}
	@RequestMapping("/point")
	public String point() throws Exception { 
		memberService.updatePoint(6, 100);
		
		return "test/daumMapTest";
	}
	@RequestMapping("/allpoint")
	public String allpoint() throws Exception {
		memberService.updateAllPoint(6, 1000);
		
		return "test/daumMapTest";
	}
}
