package com.kosta.matna.controller.main;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.domain.review.SearchKeyWord;
import com.kosta.matna.service.review.ReviewService;

@Controller
@RequestMapping("/main/review")
public class MainController {
	
	private static final Logger logger
    = LoggerFactory.getLogger(MainController.class);

	@Inject
	private ReviewService service;
	String uploadPath;
	
	@RequestMapping("/list") //������ �߼��� �ֹ���� 
	public String list(Model model, @ModelAttribute("cri") SearchKeyWord cri) throws Exception{
		System.out.println("��ü �˻�");
		logger.info("��ü ���� �˻� .."+cri);
		PageMaker maker = new PageMaker(cri, service.searchListTotal(cri));
		System.out.println("�˻� ��� ���� : "+service.searchList(cri).size());
		model.addAttribute("review", service.searchList(cri));
		model.addAttribute("pageMaker", maker);		
		
		return "/main/body/review/list2";
	}
}

