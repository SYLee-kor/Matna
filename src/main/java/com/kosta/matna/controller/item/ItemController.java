package com.kosta.matna.controller.item;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.service.item.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Inject
	private ItemService service;
	
	@RequestMapping("/itemlistall")//��ü ��ǰ�Ѹ���
	public String listall(Model model) { 
			try {
				model.addAttribute("list", service.listAll());
				System.out.println("1������");
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "test/list";
	}
	
	@RequestMapping("/itemdetail")//��ǰ Ŭ�� �󼼺���
	public String detail(Model model){//, int ino){ ���� �䰡��� no�� ������
		try {
			model.addAttribute("detailItem", service.readItem(3));//service.read(no));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/detail";
	}
	
	@RequestMapping(value="/itembuy", method=RequestMethod.GET)//��ǰ���� ������ //post�� urlȣ���� �ƴ� ������ ȣ��
	public String buypage(Model model){//, int no, int num, int ino){
		try{
			model.addAttribute("detailMember", service.readMember(3));//service.readMember(no)); ȸ�� �ѹ�
			model.addAttribute("detailItem", service.readItem(3));//service.readItem(ino));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/buy";
	}
	
	@RequestMapping("/buy")//��ǰ ����
	public String buy(Model model){// ,int ino, int num, int no, int price, String name(��ǰ��), ){
		try {
			
			System.out.println("���Ž���!@#");
			//model.addAttribute("buyItem",service.updateItem(3, -2));//service.update(ino, num));// ino:��ǰ ��ȣ num:��ǰ ���� //��ǰ���Ž� ������Ʈ
			//model.addAttribute("buyPoint", service.updatePoint(3, -1000));//service.updatePoint(no, price));// no:ȸ�� ��ȣ price:��ǰ��//��ǰ���Ž� ���ݸ�ŭ ����Ʈ ����
			service.updateItem(3, -1);
			service.updatePoint(3, -1000);
			
			MemberVO member = service.readMember(3); //service.readMember(int no);
			String addr = member.getAddr();
			
			Member_orderVO order = new Member_orderVO();
				order.setGiver(3); //order.setGiver(giver); / int giver
				order.setTaker(3); //order.setTaker(taker); / int taker
				order.setItem("��ǰ��"); //order.setItem(name);
				order.setCnt(1); // order.setCnt(��ǰ����);
				order.setAddr(addr);	
			service.insertOrder(order );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemlistall";
	}
	
	@RequestMapping("/gift")//��ǰ ����Ʈ ����
	public String gift(Model model){// ,int ino, int num, int no, int price, String name(��ǰ��),String nick(��ǰ���� �г���) ){
		try {
			
			System.out.println("��������!@#");
			//model.addAttribute("buyItem",service.updateItem(3, -2));//service.update(ino, num));// ino:��ǰ ��ȣ num:��ǰ ���� //��ǰ���Ž� ������Ʈ
			//model.addAttribute("buyPoint", service.updatePoint(3, -1000));//service.updatePoint(no, price));// no:ȸ�� ��ȣ price:��ǰ��//��ǰ���Ž� ���ݸ�ŭ ����Ʈ ����
			service.updateItem(3, -1);
			service.updatePoint(3, -1000);
			
			MemberVO member = service.readMember(3); //service.readMember(int no);
			String addr = member.getAddr();
			//�г����� ���� �˻��� ������ ����� ȸ����ȣ ���
			Member_orderVO order = new Member_orderVO();
			order.setGiver(3); //order.setGiver(giver); / int giver
			order.setTaker(2); //order.setTaker(taker); / int taker / �г���
			order.setItem("��ǰ��"); //order.setItem(name);
			order.setCnt(1); // order.setCnt(��ǰ����);
			order.setAddr(addr);	
			service.insertOrder(order );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemlistall";
	}
	
	@RequestMapping("/itemSeach")//��ǰ �˻� ����
	public String itemSeach(Model model){//, String ��ǰ��){ ���� �䰡��� no�� ������
		try {
			model.addAttribute("list", service.itemSeach("����")); //service.itemSeach(name));
			System.out.println("��ǰ�˻� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}
	return "test/list";
	}
}
