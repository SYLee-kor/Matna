package com.kosta.matna.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewDTO;
import com.kosta.matna.domain.review.ReviewVO;
import com.kosta.matna.service.review.ReviewService;

@RequestMapping("/review/")
@Controller
public class ReviewController {
	
	@Inject
	ReviewService service;
	
	// # 뷰들의 위치 잡아주기.
	private String path = "review/"; // # WEB-INF/views/ {path} 
	
	@RequestMapping(value="regist",method=RequestMethod.GET)
	public String registReview(){
		return path+"regist";
	}

	@RequestMapping(value="regist",method=RequestMethod.POST)
	public String registReview(ReviewVO review, PreviewVO preview, RedirectAttributes rttr){
		try {
			// # 사진을 안 넣은 경우 디폴트 이미지 적용!!
			String photo = ( review.getPhoto()==null ) ? "nonPhoto.jpg":review.getPhoto(); 
			review.setPhoto(photo);
			if(service.registReview(review, preview))
			rttr.addFlashAttribute("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/review/list";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modifyReview(){
		return path+"modify";
	}

	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modifyReview(ReviewVO review, PreviewVO preview, RedirectAttributes rttr){
		try {
			if(service.modifyReview(review, preview))
			rttr.addFlashAttribute("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/review/list";
	}
	
	@RequestMapping("read")
	public String readReview(int no,Model model){
		Object reviews[];
		try {
			reviews = service.readReview(no);
			
			// # 가격 5000원 ~ 10000원 식으로 표현하기 위해
			PreviewVO preview = (PreviewVO) reviews[1] ;
			String prices[] = preview.getPrice().split(",");
			preview.setPrice(prices[0]+"000원"+" ~ "+prices[1]+"000원");
			
			model.addAttribute("review",reviews[0]);
			model.addAttribute("preview",preview);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"content";
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String removeReview(int no, RedirectAttributes rttr){
		try {
			if(service.removeReview(no))
			rttr.addAttribute("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/review/list";
	}
	
	@RequestMapping("list") 
	public String listReview(Model model, String pageType
			, String tabType, String page){
		int nowPage = ( page==null ) ? 1 : Integer.parseInt(page);
		tabType = ( tabType == null ) ? "food" : tabType;
		pageType = ( pageType == null ) ? "review" : pageType;
		
		model.addAttribute("page", nowPage);
		model.addAttribute("tabType", tabType);
		model.addAttribute("pageType", pageType);
		return path+"list";
	} // # list페이지로 가기 위한 메소드
	
	@RequestMapping("tabPage")
	public String resultPage(String pageType, String tabType,  
			Model model, Criteria cri) {
		try {
			pageType = (pageType==null)?"review":pageType;
			tabType = (tabType==null)?"food":tabType;
			
			// # 페이지 타입 review/ranking 과 탭타입 food/desert/drink
			Map<String,String> typeMap = new HashMap<>();
			typeMap.put("pageType", pageType);
			typeMap.put("tabType",tabType);
			
			// # 해당 탭의 총 리뷰 개수 구하기
			int totalCount = service.getTotalCount(typeMap.get("tabType"));
			int page = ( cri.getPage() <= 0 )? 1 : cri.getPage();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker(cri, totalCount);
			
			List<ReviewDTO> list = 
			service.readList(typeMap, new RowBounds(cri.getPageStart(), cri.getPageEnd()));
			
			System.out.println("list.size() : "+list.size());
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("tabType", typeMap.get("tabType"));
			model.addAttribute("pageType", typeMap.get("pageType"));
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"tabPage";
	}
	
	@RequestMapping("guList")
	public @ResponseBody List<String> guList() throws Exception{
		return service.guList();
	}
	
	@RequestMapping("dongList")
	public @ResponseBody List<String> dongList(String gu) throws Exception{
		return service.dongList(gu);
	}
}
