package com.kosta.matna.controller.item;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.item.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Inject
	private ItemService service;
	
	@RequestMapping("/itemlistall")//전체 상품뿌리기
	public String listall(Model model) { 
			try {
				model.addAttribute("list", service.listAll());
				System.out.println("1번떠라");
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "test/list";
	}
	
	@RequestMapping("/itemdetail")//상품상세보기
	public String detail(Model model){//, int ino){ 아직 뷰가없어서 no값 못받음
		try {
			model.addAttribute("detailItem", service.readItem(3));//service.read(no));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/detail";
	}
	
	@RequestMapping(value="/itembuy", method=RequestMethod.GET)//상품구매 페이지 //post는 url호출이 아닌 내부적 호출
	public String buypage(Model model){//, int no, int num, int ino){
		try{
			model.addAttribute("detailMember", service.readMember(3));//service.readMember(no)); 회원 넘버
			model.addAttribute("detailItem", service.readItem(3));//service.readItem(ino));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/buy";
	}
	
	@RequestMapping("/buy")
	public String buy(Model model){// ,int ino, int num, int no, int price){
		try {
			
			//System.out.println("실행!@#");
			//model.addAttribute("buyItem",service.updateItem(3, -2));//service.update(ino, num));// ino:상품 번호 num:상품 수량 //상품구매시 업데이트
			//model.addAttribute("buyPoint", service.updatePoint(3, -1000));//service.updatePoint(no, price));// no:회원 번호 price:상품가//상품구매시 가격만큼 포인트 감소
			service.updateItem(3, -1);
			service.updatePoint(3, -1000);
			MemberVO member = service.readMember(3);
			String addr = member.getAddr();
			//선물과 구매 /주문내역 생성부분
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemlistall";
	}
}
