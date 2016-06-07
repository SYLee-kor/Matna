package com.kosta.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/matna")
public class MapTest {

	@RequestMapping("/mapTest")
	public void mapTest(){}
	
}
