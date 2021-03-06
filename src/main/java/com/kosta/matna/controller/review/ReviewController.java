package com.kosta.matna.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewVO;
import com.kosta.matna.domain.review.SearchKeyWord;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.review.ReviewService;
import com.kosta.matna.validator.MatnaValidator;

@RequestMapping("/review/")
@Controller
public class ReviewController {
	
	@Inject
	ReviewService service;
	
	@Inject
	MemberService memberService;
	
	// # 뷰들의 위치 잡아주기.
	private String path = "/main/body/review/"; // # WEB-INF/views/ {path} 
	
	@RequestMapping(value="regist",method=RequestMethod.GET)
	public String registReview(@ModelAttribute("pageType") String pageType, Model model
			, @ModelAttribute("tabType") String tabType, @ModelAttribute("page") String page){
		model.addAttribute("action", "regist");
		return path+"regist";
	}

	@RequestMapping(value="regist",method=RequestMethod.POST)
	public String registReview(ReviewVO review, PreviewVO preview, RedirectAttributes rttr
			, String pageType, String page, Model model){
		// # 들어온 데이터에 대한 유효성 검사!!
		if(!MatnaValidator.isValid(review, "ReviewVO") 
				|| !MatnaValidator.isValid(preview, "PreviewVO")){
			model.addAttribute("errMsgs", MatnaValidator.getErrMsgs());
			model.addAttribute("review", review);
			model.addAttribute("preview", preview);
			model.addAttribute("action", "regist");
			return path+"regist";
		}
		// # 타이틀에 특수문자중 <> 를 변환
		review.setTitle(review.getTitle().replace("<", "&lt;"));
		review.setTitle(review.getTitle().replace(">", "&gt;"));
		
		try {
			// # 사진을 안 넣은 경우 디폴트 이미지 적용!!
			Pattern pattern = Pattern.compile(
					"<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*title=[\"']?([^>\"']+)[\"']?[^>]*");
			Matcher match = pattern.matcher(review.getContent());
			String imgTag = "";
			if (match.find())imgTag = match.group(0);
			String photo = imgTag+"id='review_photo'>";
//			 width=\"150\" height=\"90\"
			photo = (imgTag.equals("")) ? 
					"<img src='/matna/resource/images/matnaLogo.png' id='review_photo'>" : photo;
			review.setPhoto(photo);
			
			// # 주소값 입력안했을 경우...
			String addr = ( preview.getAddr().equals("") ) ? "  " : preview.getAddr();
			preview.setAddr(addr);
			
			if(service.registReview(review, preview))
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageType", pageType);
			rttr.addAttribute("tabType", preview.getMenu());
			rttr.addAttribute("page", 1);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/review/list";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modifyReview(int no, Model model
			, String pageType, String tabType, String page ){
		try {
			System.out.println("review_modify() GET page : "+page);
			Object reviews[] = service.readReview(no);
			model.addAttribute("review", (ReviewVO)reviews[0]);
			model.addAttribute("preview", (PreviewVO)reviews[1]);
			model.addAttribute("action", "modify");
			model.addAttribute("page", page);
			model.addAttribute("pageType", pageType);
			model.addAttribute("tabType",tabType);
			System.out.println("Modify GET_page: "+page);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"regist";
	}

	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modifyReview(ReviewVO review, PreviewVO preview, RedirectAttributes rttr
			, String pageType, String tabType, String page, Model model){
		if( !(MatnaValidator.isValid(review, "ReviewVO") 
				&& MatnaValidator.isValid(preview, "PreviewVO")) ){
			model.addAttribute("errMsgs", MatnaValidator.getErrMsgs());
			model.addAttribute("review", review);
			model.addAttribute("preview", preview);
			model.addAttribute("action", "modify");
			return path+"regist";
		}
		
		// # 타이틀에 특수문자중 <> 를 변환
		review.setTitle(review.getTitle().replace("<", "&lt;"));
		review.setTitle(review.getTitle().replace(">", "&gt;"));
		
		try {
			// # 사진을 안 넣은 경우 디폴트 이미지 적용!!
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*title=[\"']?([^>\"']+)[\"']?[^>]*");
			Matcher match = pattern.matcher(review.getContent());
			String imgTag = "";
			if (match.find())imgTag = match.group(0);
			String photo = imgTag+"id='review_photo'>";
//			 width=\"150\" height=\"90\"
			photo = (imgTag.equals("")) ? "<img src='/matna/resource/images/matnaLogo.png' id='review_photo'>" : photo;
			review.setPhoto(photo);
			
			System.out.println("review_modify POST page : "+page);
			if(service.modifyReview(review, preview))
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("tabType", preview.getMenu());
			rttr.addAttribute("pageType",pageType);
			rttr.addAttribute("page",page);
			System.out.println("Modify POST_page: "+page);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/review/list";
	}
	
	@RequestMapping("read")
	public String readReview(int no,Model model, @ModelAttribute("pageType") String pageType
			, @ModelAttribute("tabType") String tabType 
			, @ModelAttribute("cri") SearchKeyWord cri
			, String page ){
		Object reviews[];
		try {
			reviews = service.readReview(no);
			
			// # 가격 5천원 ~ 1만원 식으로 표현하기 위해
			PreviewVO preview = (PreviewVO) reviews[1] ;
			String prices[] = preview.getPrice().split(",");
			prices[0] = ( prices[0].length()<2 ) ? prices[0]+"천원" : prices[0].charAt(0)+"만원";
			if(prices[1].length()==1) prices[1] = prices[1]+"천원";
			else if(prices[1].length()==2) prices[1] = prices[1].charAt(0)+"만원";
			else if(prices[1].length()==3) prices[1] = "7만원 이상";
			
			String price = prices[0] + " ~ "+prices[1];
			price = (prices[0].equals("0천원")) ? "5천원 이하" : price;
			price = (prices[1].equals("7만원 이상")) ? prices[1] : price;
			preview.setPrice(price);
			
			// # 그래프 띄워주기
			List<String> list = memberService.selectGbGender(((ReviewVO)reviews[0]).getNo());
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
			model.addAttribute("review",reviews[0]);
			model.addAttribute("preview",preview);
			page = ( page == null ) ? "1" : page;
			model.addAttribute("page",page);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"content";
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String removeReview(int no, RedirectAttributes rttr
			, String pageType, String tabType,  String page, SearchKeyWord cri){
		System.out.println("ReviewController_remove("+no+")");
		try {
			if(service.removeReview(no))
				if(cri.getReviewType().equals("search")){
					rttr.addFlashAttribute("cri", cri);
					return "redirect:/main/review/list";
				}
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageType", pageType);
			rttr.addAttribute("tabType", tabType);
			rttr.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/review/list";
	}
	
	@RequestMapping("list") 
	public String listReview(Model model, String pageType
			, String tabType, String page){
		System.out.println("list 실행 page : "+page);
		int nowPage = ( page==null || page.trim().equals("")) ? 1 : Integer.parseInt(page);
		tabType = ( tabType == null || tabType.trim().equals("")) ? "food" : tabType;
		pageType = ( pageType == null || pageType.trim().equals("")) ? "review" : pageType;
		
		model.addAttribute("page", nowPage);
		model.addAttribute("tabType", tabType);
		model.addAttribute("pageType", pageType);
		return path+"list";
	} // # list페이지로 가기 위한 메소드
	
	@RequestMapping("tabPage")
	public String tabPage(String pageType, String tabType,
			Model model, Criteria cri) {
		System.out.println("listReview = [page : "+cri.getPage()+"/tabType : "+tabType
				+"/ pageType : "+pageType);
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
			
			List<ReviewVO> list = 
			service.readList(typeMap, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
			
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("tabType", typeMap.get("tabType"));
			model.addAttribute("pageType", typeMap.get("pageType"));
			model.addAttribute("listType", typeMap.get("listType"));
			model.addAttribute("page", page);
			System.out.println("tabPage list.size() : "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"tabPage";
	}
	@RequestMapping("mini")
	public String miniPage(String pageType, String tabType, String listType, 
			Model model) {
		try {
			pageType = (pageType==null)?"review":pageType;
			tabType = (tabType==null)?"food":tabType;
			
			// # 페이지 타입 review/ranking 과 탭타입 food/desert/drink
			Map<String,String> typeMap = new HashMap<>();
			typeMap.put("pageType", pageType);
			typeMap.put("tabType",tabType);
			
			// # 해당 탭의 총 리뷰 개수 구하기
			List<ReviewVO> list = 
					service.readList(typeMap, new RowBounds(0, 3));
			model.addAttribute("miniList", list);
			model.addAttribute("tabType", typeMap.get("tabType"));
			model.addAttribute("pageType", typeMap.get("pageType"));
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"miniTab";
	}
	
	@RequestMapping("guList")
	public @ResponseBody List<String> guList() throws Exception{
		return service.guList();
	}
	
	@RequestMapping("dongList")
	public @ResponseBody List<String> dongList(String gu) throws Exception{
		return service.dongList(gu);
	}
	
	@RequestMapping("gbCheck")
	public @ResponseBody Map<String,Object> gbCheck(int userNo, int rNo, String gbType) {
		Map resultMap = new HashMap();
		try {
			Map map = new HashMap();
			map.put("userNo", userNo);
			map.put("rNo", rNo);
			map.put("gbType", gbType);
			resultMap = service.gbCheck(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
