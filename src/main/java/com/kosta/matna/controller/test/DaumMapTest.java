package com.kosta.matna.controller.test;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matna.domain.review.ReviewVO;
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
	
	@RequestMapping("jq")	//메시지 쓰기
    public String writeMessag(Model model)throws Exception{
		
		List<String> list = memberService.selectGbGender(1);
		int mcount=0;
		int wcount=0;
		for(int i=0;i<list.size();i++){
			if(list.get(i).equals("남")){
				mcount++;
			}else if(list.get(i).equals("여")){
				wcount++;
			}
		}
		
		if(mcount!=0 || wcount!=0){
			model.addAttribute("isCount", true);
		}else{
			model.addAttribute("isCount", false);
		}
		
		model.addAttribute("mcount", mcount);
		model.addAttribute("wcount", wcount);
		
	   return "/test/jqplot";
	}
}
