package com.kosta.matna.controller.community;

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
import com.kosta.matna.service.community.CommunityService;


@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private static final Logger logger
    = LoggerFactory.getLogger(CommunityController.class);
 
	@Inject
	private CommunityService service;
	
	public CommunityController() {
	System.out.println("생성");
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String inputTest()throws Exception{
		return "SETest/editorTest";
	}
	
	@RequestMapping("/submit")
	public void submit(HttpServletRequest request, String editor){
	    System.out.println("에디터 컨텐츠값:"+request.getParameter("editor"));
	    System.out.println("에디터 컨텐츠값(String):"+editor);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri,HttpSession session) throws Exception{
		session.setAttribute("userID", "adminTester");
		logger.info("전체list 요청..."+ model);	
		model.addAttribute("list", service.listCriteria(cri,new BoardTypeVO("free")));
		PageMaker maker = new PageMaker();
		  maker.setCri(cri);
		  maker.setTotalCount(service.listCountCriteria(new BoardTypeVO("free")));
		model.addAttribute("pageMaker", maker);
		String type = "free";
		model.addAttribute("type", type);
		return "main/body/community/all/list";
	}
	
	@RequestMapping(value = "/listOne", method = RequestMethod.GET)
	public String listOne(int no,String type,Model model) throws Exception{
		logger.info("list one :" + no);
		logger.info("type : " + type);
		model.addAttribute("free",service.read(no,new BoardTypeVO(type)));
		
		return "main/body/community/all/content";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet(){
		
		return "main/body/community/all/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO board,RedirectAttributes attr) throws Exception{
		logger.info("register POST요청...");	
		logger.info("BoardVO::"+ board);
		board.setWriter("adminTester");
		service.regist(board);
		
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(int no,String type,Model model) throws Exception{
		model.addAttribute("free",service.read(no,new BoardTypeVO(type)));
		
		return "main/body/community/all/update";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVO board,RedirectAttributes attr) throws Exception{
		logger.info("update POST요청...");	
		logger.info("BoardVO::"+ board);
		board.setWriter("adminTester");
		service.modify(board);
		
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(int no,String type,RedirectAttributes attr) throws Exception{
		logger.info("delete POST요청...");	
		service.remove(no, new BoardTypeVO(type));
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list";
	}
	@RequestMapping(value="/slist", method=RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchVO key, Model model)throws Exception{
		 logger.info("검색리스트 요청: "+ key);
		 
		 model.addAttribute("list", service.listSearchCriteria(key,new BoardTypeVO("free")));
		 PageMaker maker = new PageMaker();
		 maker.setCri(key);
		 maker.setTotalCount(service.listSearchCount(key,new BoardTypeVO("free")));
		 model.addAttribute("pageMaker", maker);  
		 
		 return "main/body/community/all/list";
	}
	
}


