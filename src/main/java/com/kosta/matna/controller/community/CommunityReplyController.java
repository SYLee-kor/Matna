package com.kosta.matna.controller.community;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.PageMaker;
import com.kosta.matna.domain.community.ReplyVO;
import com.kosta.matna.service.community.CommunityReplyService;


@RequestMapping("/communityReply")
@Controller
public class CommunityReplyController {
	
	@Inject
	CommunityReplyService service;
	
	@RequestMapping("/addReply")
	public @ResponseBody String addReply(ReplyVO vo,@ModelAttribute("type") String type) throws Exception{
		System.out.println("ReplyVO "+vo.getbNo()+","+vo.getType()+","+vo.getWriter()+",");
		return service.addReply(vo,new BoardTypeVO(type))+"";
	}
	
	@RequestMapping("/modifyReply")
	public @ResponseBody String modifyReply(ReplyVO vo) throws Exception{
		return service.modifyReply(vo)+"";
	}
	
	@RequestMapping("/removeReply")
	public @ResponseBody String removeReply(int no,@ModelAttribute("type") String type) throws Exception{
		return service.removeReply(no,new BoardTypeVO(type))+"";
	}
	
	@RequestMapping("/listReply")
	public String listReply(int bNo, Model model, Criteria cri,@ModelAttribute("type") String type) throws Exception{
		cri.setPerPageNum(5);
		RowBounds rowBounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.getTotalCount(bNo,new BoardTypeVO(type)));
		model.addAttribute("replyMaker",maker);
		model.addAttribute("replyList", service.listReply(bNo,rowBounds,new BoardTypeVO(type)));
		return "main/body/community/all/reply";
	}
}
