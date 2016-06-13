package com.kosta.matna.controller.review;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.matna.domain.review.ReplyVO;
import com.kosta.matna.service.review.ReplyService;

@RequestMapping("/reviewReply")
@Controller
public class ReplyController {
	
	@Inject
	ReplyService service;
	
	@RequestMapping("/addReply")
	public @ResponseBody String addReply(ReplyVO vo) throws Exception{
		System.out.println("ReplyVO "+vo.getContent());
		return service.addReply(vo)+"";
	}
	
	@RequestMapping("/modifyReply")
	public @ResponseBody String modifyReply(ReplyVO vo) throws Exception{
		return service.modifyReply(vo)+"";
	}
	
	@RequestMapping("/removeReply")
	public @ResponseBody String removeReply(int no) throws Exception{
		return service.removeReply(no)+"";
	}
	
	@RequestMapping("/listReply")
	public String listReply(int rNo, Model model) throws Exception{
		model.addAttribute("replyList", service.listReply(rNo));
		return "review/reply";
	}
}
