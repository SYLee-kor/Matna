package com.kosta.matna.controller.item;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.service.item.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Inject
	private ItemService service;
	
/*	@RequestMapping("/itemlistall")//전체 상품뿌리기
	public String listall(Model model) { 
			try {
				model.addAttribute("list", service.listAll());
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "test/item/list";
	}
	*/
	@RequestMapping("/itemdetail")//상품 클릭 상세보기
	public String detail(Model model, int ino){
		try {
			ItemVO item= service.readItem(ino);
			model.addAttribute("detailItem", item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/item/detail";
	}
	
	@RequestMapping(value="/itembuy", method=RequestMethod.GET)//상품구매 페이지 //post는 url호출이 아닌 내부적 호출
	public String buypage(Model model, int no, int num, int ino){
		try{
			model.addAttribute("detailMember", service.readMember(3));//service.readMember(no)); 회원 넘버
			model.addAttribute("detailItem", service.readItem(ino));//service.readItem(ino));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/item/buy";
	}
	
	@RequestMapping("/buy")//상품 구매
	public String buy(Model model,int ino, int buyCount, int price, String name, HttpSession session ){
		try {
			
			System.out.println("구매실행!@#");
			System.out.println("사는 갯수"+buyCount);
			//model.addAttribute("buyItem",service.updateItem(3, -2));//service.update(ino, num));// ino:상품 번호 num:상품 수량 //상품구매시 업데이트
			//model.addAttribute("buyPoint", service.updatePoint(3, -1000));//service.updatePoint(no, price));// no:회원 번호 price:상품가//상품구매시 가격만큼 포인트 감소
			service.updateItem(ino, -buyCount);
			//int no = Integer.parseInt((String) (session.getAttribute("no")));
			service.updatePoint(3, -(price*buyCount));//service.updatePoint(no, -price);
			
			MemberVO member = service.readMember(3); //service.readMember(int no);
			String addr = member.getAddr();
			
			Member_orderVO order = new Member_orderVO();
				order.setGiver(3); //order.setGiver(giver); / int giver
				order.setTaker(3); //order.setTaker(taker); / int taker
				order.setItem(ino); //order.setItem(name);
				order.setCnt(buyCount); // order.setCnt(상품갯수);
				order.setAddr(addr);	
			service.insertOrder(order);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemSearch";
	}
	
	@RequestMapping("/gift")//상품 포인트 선물
	public String gift(Model model, String taker, int point, HttpServletResponse response, HttpServletRequest request){// ,int ino, int num, int no, int price, String name(상품명),String nick(상품선물 닉네임) ){
		try {
			
			System.out.println("선물실행!@#");
			//int no = Integer.parseInt((String) (session.getAttribute("no"))); //세션에서 no값 받아오기
			MemberVO member = service.readMember(3); //service.readMember(int no);
			int takerno = service.readTaker(taker); //닉네임을 통한 검색후 선물할 사람의 회원번호 출력
			System.out.println("뭐로나오니?"+takerno);
			
			if(member.getPoint()>=point){//선물하는사람 포인트가 많을때
				service.updatePoint(3, -point); //자기 포인트감소
				service.updatePoint(takerno, point); // 상대방 포인트 증가 
	
				/*
				 * 쪽지 보내기 여기
				 */
				
			}else{
				//포인트가 부족합니다 리턴
				response.setContentType("text/html;charset=UTF-8");   
			     PrintWriter writer = response.getWriter();
			     writer.println("<script type='text/javascript'>");
			     writer.println("alert('포인트가 부족합니다.');");
			     writer.println("history.back();");
			     writer.println("</script>");
			     writer.flush();
			     return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemSearch";
	}
	
	@RequestMapping("/itemSearch")//상품 검색 보기
	public String itemSeach(Model model, String search, Criteria cri){
		try {
			model.addAttribute("list", service.itemSeach(search, new RowBounds(cri.getPageStart(), cri.getPerPageNum()))); //service.itemSeach(name));
			
			//페이징
			int totalCount = service.listAllCnt(search);
			int page = ( cri.getPage() <= 0 )? 1 : cri.getPage();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker(cri, totalCount);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("search",search);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	return "test/item/list";
	}
}
