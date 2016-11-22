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
		// # 내용에 특수문자를 허용하기 위해 > 또는 < 를 다른 문자로 변경!
		vo.setContent(vo.getContent().replace("&", "&amp;"));
		vo.setContent(vo.getContent().replace("<", "&lt;"));
		vo.setContent(vo.getContent().replace(">", "&gt;"));
		vo.setContent(vo.getContent().replace("'", "&#39;"));
		vo.setContent(vo.getContent().replace("(", "&#40;"));
		vo.setContent(vo.getContent().replace(")", "&#41;"));
		return service.addReply(vo,new BoardTypeVO(type))+"";
	}
	
	@RequestMapping("/modifyReply")
	public @ResponseBody String modifyReply(ReplyVO vo) throws Exception{
		// # 내용에 특수문자를 허용하기 위해 > 또는 < 를 다른 문자로 변경!
		vo.setContent(vo.getContent().replace("&", "&amp;"));
		vo.setContent(vo.getContent().replace("<", "&lt;"));
		vo.setContent(vo.getContent().replace(">", "&gt;"));
		vo.setContent(vo.getContent().replace("'", "&#39;"));
		vo.setContent(vo.getContent().replace("(", "&#40;"));
		vo.setContent(vo.getContent().replace(")", "&#41;"));
		return service.modifyReply(vo)+"";
	}
	
	@RequestMapping("/removeReply")
	public @ResponseBody String removeReply(int bNo,int no,@ModelAttribute("type") String type) throws Exception{
		System.out.println("bNo,No,type : " + bNo +","+ no +","+ type);
		return service.removeReply(bNo,no,new BoardTypeVO(type))+"";
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
