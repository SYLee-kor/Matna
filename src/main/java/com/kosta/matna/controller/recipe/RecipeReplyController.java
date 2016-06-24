package com.kosta.matna.controller.recipe;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.matna.domain.recipe.Criteria;
import com.kosta.matna.domain.recipe.PageMaker;
import com.kosta.matna.domain.recipe.ReplyVO;
import com.kosta.matna.service.recipe.ReplyService;

@RequestMapping("/recipeReply")
@Controller
public class RecipeReplyController {
	
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
	public String listReply(int rNo, Model model, Criteria cri) throws Exception{
		cri.setPerPageNum(5);
		RowBounds rowBounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		
		//# PageMaker 저장
		model.addAttribute("replyMaker", new PageMaker(cri, service.getTotalCount(rNo)));
		//# 댓글 리스트 저장
		model.addAttribute("replyList", service.listReply(rNo,rowBounds));
		return "/main/body/review/reply";
	}
}
