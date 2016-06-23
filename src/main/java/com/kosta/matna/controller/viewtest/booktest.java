package com.kosta.matna.controller.viewtest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class booktest {

	
	@RequestMapping("/book")
	public String book(){
		return "/test/book";
	}
	
}
