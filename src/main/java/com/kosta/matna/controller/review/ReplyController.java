package com.kosta.matna.controller.review;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.ReplyVO;
import com.kosta.matna.service.review.ReplyService;

@Controller
@RequestMapping("/review_reply") // # review 부분.
public class ReplyController {
	
	@Inject
	ReplyService service;
	
	@RequestMapping("/add")
	public @ResponseBody String add(ReplyVO vo, int rno, 
			@ModelAttribute("page") int page) throws Exception{
		return ""+service.addReply(vo);
	}
	
	@RequestMapping("/modify")
	public @ResponseBody String modify(ReplyVO vo, int rno, 
			@ModelAttribute("page") int page) throws Exception{
		return ""+service.modifyReply(vo);
	}
	
	@RequestMapping("/remove")
	public @ResponseBody String remove(int no, @ModelAttribute("page") int page) throws Exception{
		return ""+service.removeReply(no);
	}
	
	@RequestMapping("/list")
	public String list(Criteria cri, int rno, Model model) throws Exception{
		cri.setPerPageNum(5);
		model.addAttribute("page",cri.getPage());
		model.addAttribute("reply", service.listReply(rno
				, new RowBounds(cri.getPageStart(),cri.getPageEnd())));
		return "/review/reply"; // # review 부분
	}
}
