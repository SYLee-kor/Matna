package com.kosta.matna.controller.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewTest {

	@RequestMapping("/home")
	public String viewTest(){
		return "home";
	}
}
