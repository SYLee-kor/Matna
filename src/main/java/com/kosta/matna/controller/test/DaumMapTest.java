package com.kosta.matna.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DaumMapTest {
	
	@RequestMapping("/mapTest")
	public String showMap() { 
		return "test/daumMapTest";
	}
}
