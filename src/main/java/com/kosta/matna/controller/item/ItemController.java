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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.domain.message.MessageVO;
import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.service.item.ItemService;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.message.MessageService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Inject
	private ItemService service;
	
	@Inject
	private MessageService messageService;
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping("/itemlistall")//전체 상품뿌리기
	public String listall(Model model) { 
			
		return "/main/body/item/finalOrder";
	}
	
	@RequestMapping("/itemdetail")//상품 클릭 상세보기
	public String detail(Model model, int ino, String toNickname){
		try {
			ItemVO item= service.readItem(ino);
			model.addAttribute("detailItem", item);
			model.addAttribute("toNickname", toNickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/main/body/item/itemDetail";
		//return "/main/body/item/detail";
	}
	
	@RequestMapping("/itembuy")//상품구매 페이지 //post는 url호출이 아닌 내부적 호출
	public String buypage(Model model, HttpSession session, int buyCount, int ino){
		try{
			int userno = (int) session.getAttribute("userNo");
			model.addAttribute("detailMember", service.readMember(userno));//service.readMember(no)); 회원 넘버
			model.addAttribute("detailItem", service.readItem(ino));//service.readItem(ino));
			model.addAttribute("buyCount", buyCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/main/body/item/finalOrder";
	}
	
	@RequestMapping("/buy")//상품 구매
	public String buy(Model model,int ino, int buyCount,
			RedirectAttributes attr, int price, String name, HttpSession session ){
		try {
			
			System.out.println("구매실행!@#");
			System.out.println("사는 갯수"+buyCount);
			int userno = (int) session.getAttribute("userNo");
			//model.addAttribute("buyItem",service.updateItem(3, -2));//service.update(ino, num));// ino:상품 번호 num:상품 수량 //상품구매시 업데이트
			//model.addAttribute("buyPoint", service.updatePoint(3, -1000));//service.updatePoint(no, price));// no:회원 번호 price:상품가//상품구매시 가격만큼 포인트 감소
			
			ItemVO item = service.readItem(ino);
			
			if(item.getAmount()-buyCount<0)
			{
				attr.addFlashAttribute("msg", "minusCnt");
				return "redirect:/item/itemSearch";
			}
			
			MemberVO member = service.readMember(userno); //service.readMember(int no);
			if(member.getPoint()-(price*buyCount)<0){
				attr.addFlashAttribute("msg", "minusPoint");
				return "redirect:/item/itemSearch";
			}
			
			service.updateItem(ino, -buyCount);
			//int no = Integer.parseInt((String) (session.getAttribute("no")));
			service.updatePoint(userno, -(price*buyCount));//service.updatePoint(no, -price);
			
			String addr = member.getAddr();
			
			Member_orderVO order = new Member_orderVO();
				order.setGiver(userno); //order.setGiver(giver); / int giver
				order.setTaker(userno); //order.setTaker(taker); / int taker
				order.setItem(ino); //order.setItem(name);
				order.setCnt(buyCount); // order.setCnt(상품갯수);
				order.setAddr(addr);	
			service.insertOrder(order);
			
			MemberVO member2 = new MemberVO();//구매시 포인트 변경
			
			if(session.getAttribute("userId")!=null){
				member2 = memberService.selectID((String)session.getAttribute("userId"));
				session.setAttribute("userPoint", member2.getPoint());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemSearch";
	}
	
	@RequestMapping("/gift")//상품 포인트 선물
	public String gift(Model model, String taker, int point, HttpServletResponse response,
			HttpSession session,HttpServletRequest request){// ,int ino, int num, int no, int price, String name(상품명),String nick(상품선물 닉네임) ){
		try {
			
			System.out.println("선물실행!@#");
			int userno = (int) session.getAttribute("userNo");
			String usernick = (String) session.getAttribute("userNickname");
			//int no = Integer.parseInt((String) (session.getAttribute("no"))); //세션에서 no값 받아오기
			MemberVO member = service.readMember(userno); //service.readMember(int no);
			
			MessageVO message = new MessageVO();
			message.setReceiverNickname(taker);
			message.setSenderNickname(usernick);
			message.setTitle("선물입니다");
			message.setContent(point+"P 를 선물 받으셨습니다.");
			
			if(member.getPoint()>=point){//선물하는사람 포인트가 많을때
				
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
			
			
			boolean check = messageService.addMessage(message);
			
			if(check && service.countTaker(taker)!=0){ //아이디 존재
				int takerno = service.readTaker(taker);//닉네임을 통한 검색후 선물할 사람의 회원번호 출력
				service.updatePoint(userno, -point); //자기 포인트감소
				service.updatePoint(takerno, point); // 상대방 포인트 증가 
			   }else{
				   response.setContentType("text/html;charset=UTF-8");   
				     PrintWriter writer = response.getWriter();
				     writer.println("<script type='text/javascript'>");
				     writer.println("alert('존재하지 않는 사용자입니다.');");
				     writer.println("history.back();");
				     writer.println("</script>");
				     writer.flush();
				     return null;
			   }
			
			MemberVO member2 = new MemberVO();//선물시 포인트 변경
			
			if(session.getAttribute("userId")!=null){
				member2 = memberService.selectID((String)session.getAttribute("userId"));
				session.setAttribute("userPoint", member2.getPoint());
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
	return "/main/body/item/list";
	}
}
