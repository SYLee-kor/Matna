package com.kosta.matna.controller.community;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.PageMaker;
import com.kosta.matna.domain.community.SearchVO;
import com.kosta.matna.domain.review.ReviewVO;
import com.kosta.matna.service.community.CommunityService;
import com.kosta.matna.validator.MatnaValidator;


@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private static final Logger logger
    = LoggerFactory.getLogger(CommunityController.class);
 
	@Inject
	private CommunityService service;
	
	@RequestMapping(value="/test/list")
	public String list_t(){
		return "main/body/community/all/content_comm";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("cri") SearchVO cri,String type) throws Exception{
		System.out.println("검색어 : " + cri.getKeyword()+", 겁색 타입 : "+ cri.getSearchType());
		logger.info("전체list 요청..."+ model);	
		model.addAttribute("list", service.listSearchCriteria(cri,new BoardTypeVO(type)));
		PageMaker maker = new PageMaker();
		  maker.setCri(cri);
		  maker.setTotalCount(service.listSearchCount(cri,new BoardTypeVO(type)));
		model.addAttribute("pageMaker", maker);
		model.addAttribute("type", type);
		return "main/body/community/all/list";
	}
	@RequestMapping(value = "/miniListF", method = RequestMethod.POST)
	public String miniListF(Model model, @ModelAttribute("type1")String type1) throws Exception{
		logger.info("미니list 요청..."+ model);	
		
		model.addAttribute("list1", service.listAll(new BoardTypeVO(type1)));
		return "main/body/community/all/miniListFree";
	}
	@RequestMapping(value = "/miniListM", method = RequestMethod.POST)
	public String miniListM(Model model, @ModelAttribute("type2")String type2) throws Exception{
		logger.info("미니list 요청..."+ model);	
		model.addAttribute("list2", service.listAll(new BoardTypeVO(type2)));
		return "main/body/community/all/miniListMeeting";
	}
	
	
	@RequestMapping(value = "/listPage", method = RequestMethod.POST)
	public String listPage(Model model, @ModelAttribute("cri") SearchVO cri,String type) throws Exception{
		System.out.println("페이지 : " + cri.getPage());
		System.out.println("list page type : "+type);
		logger.info("특정 페이지 list 요청..."+ model);	
		model.addAttribute("list", service.listSearchCriteria(cri,new BoardTypeVO(type)));
		PageMaker maker = new PageMaker();
		  maker.setCri(cri);
		  maker.setTotalCount(service.listSearchCount(cri,new BoardTypeVO(type)));
		model.addAttribute("pageMaker", maker);
		model.addAttribute("type", type);
		return "main/body/community/all/list";
	}
	
	@RequestMapping(value = "/listOne", method = RequestMethod.GET)
	public String listOne(int no,String type,Model model,@ModelAttribute("cri") SearchVO cri) throws Exception{
		logger.info("list one :" + no);
		logger.info("type : " + type);
		System.out.println("검색어 : " + cri.getKeyword()+", "+cri.getSearchType());
		System.out.println("페이지 정보 : "+cri.getPage());
		model.addAttribute("board",service.read(no,new BoardTypeVO(type)));
		model.addAttribute("type", type);
		return "main/body/community/all/content";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet(@ModelAttribute("type") String type){
		
		return "main/body/community/all/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO board,RedirectAttributes attr,Model model) throws Exception{
		logger.info("register POST요청...");	
		logger.info("BoardVO::"+ board);
		if(!MatnaValidator.isValid(board, "BoardVO") ){
			model.addAttribute("errMsgs", MatnaValidator.getErrMsgs());
			model.addAttribute("board", board);
			model.addAttribute("type", board.getType());
			return "main/body/community/all/write";
		}
		
		// # 타이틀에 특수문자중 <> 를 변환
		board.setTitle(board.getTitle().replace("<", "&lt;"));
		board.setTitle(board.getTitle().replace(">", "&gt;"));
		
		service.regist(board);
		
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list?type="+board.getType();
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(int no,@ModelAttribute("type") String type,Model model,@ModelAttribute("cri") SearchVO cri) throws Exception{
		model.addAttribute("board",service.update(no,new BoardTypeVO(type)));
		
		return "main/body/community/all/update";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, BoardVO board,RedirectAttributes attr,@ModelAttribute("cri") SearchVO cri) throws Exception{
		logger.info("update POST요청...");	
		logger.info("BoardVO::"+ board);
		if(!MatnaValidator.isValid(board, "BoardVO") ){
			model.addAttribute("errMsgs", MatnaValidator.getErrMsgs());
			model.addAttribute("board", board);
			model.addAttribute("type", board.getType());
			return "main/body/community/all/update";
		}
		// # 타이틀에 특수문자중 <> 를 변환
		board.setTitle(board.getTitle().replace("<", "&lt;"));
		board.setTitle(board.getTitle().replace(">", "&gt;"));
		
		service.modify(board);
		
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&type="+board.getType()+"&SearchType="+cri.getSearchType()+"&Keyword="+cri.getKeyword();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(int no,String type,RedirectAttributes attr,@ModelAttribute("cri") SearchVO cri) throws Exception{
		logger.info("delete POST요청...");	
		service.remove(no, new BoardTypeVO(type));
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&type="+type+"&SearchType="+cri.getSearchType()+"&Keyword="+cri.getKeyword();
	}
	
}


