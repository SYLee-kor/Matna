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
	
	@RequestMapping("/itemlistall")//��ü ��ǰ�Ѹ���
	public String listall(Model model) { 
			
		return "/main/body/item/finalOrder";
	}
	
	@RequestMapping("/itemdetail")//��ǰ Ŭ�� �󼼺���
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
	
	@RequestMapping("/itembuy")//��ǰ���� ������ //post�� urlȣ���� �ƴ� ������ ȣ��
	public String buypage(Model model, HttpSession session, int buyCount, int ino){
		try{
			int userno = (int) session.getAttribute("userNo");
			model.addAttribute("detailMember", service.readMember(userno));//service.readMember(no)); ȸ�� �ѹ�
			model.addAttribute("detailItem", service.readItem(ino));//service.readItem(ino));
			model.addAttribute("buyCount", buyCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/main/body/item/finalOrder";
	}
	
	@RequestMapping("/buy")//��ǰ ����
	public String buy(Model model,int ino, int buyCount,
			RedirectAttributes attr, int price, String name, HttpSession session ){
		try {
			
			System.out.println("���Ž���!@#");
			System.out.println("��� ����"+buyCount);
			int userno = (int) session.getAttribute("userNo");
			//model.addAttribute("buyItem",service.updateItem(3, -2));//service.update(ino, num));// ino:��ǰ ��ȣ num:��ǰ ���� //��ǰ���Ž� ������Ʈ
			//model.addAttribute("buyPoint", service.updatePoint(3, -1000));//service.updatePoint(no, price));// no:ȸ�� ��ȣ price:��ǰ��//��ǰ���Ž� ���ݸ�ŭ ����Ʈ ����
			
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
				order.setCnt(buyCount); // order.setCnt(��ǰ����);
				order.setAddr(addr);	
			service.insertOrder(order);
			
			MemberVO member2 = new MemberVO();//���Ž� ����Ʈ ����
			
			if(session.getAttribute("userId")!=null){
				member2 = memberService.selectID((String)session.getAttribute("userId"));
				session.setAttribute("userPoint", member2.getPoint());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemSearch";
	}
	
	@RequestMapping("/gift")//��ǰ ����Ʈ ����
	public String gift(Model model, String taker, int point, HttpServletResponse response,
			HttpSession session,HttpServletRequest request){// ,int ino, int num, int no, int price, String name(��ǰ��),String nick(��ǰ���� �г���) ){
		try {
			
			System.out.println("��������!@#");
			int userno = (int) session.getAttribute("userNo");
			String usernick = (String) session.getAttribute("userNickname");
			//int no = Integer.parseInt((String) (session.getAttribute("no"))); //���ǿ��� no�� �޾ƿ���
			MemberVO member = service.readMember(userno); //service.readMember(int no);
			
			MessageVO message = new MessageVO();
			message.setReceiverNickname(taker);
			message.setSenderNickname(usernick);
			message.setTitle("�����Դϴ�");
			message.setContent(point+"P �� ���� �����̽��ϴ�.");
			
			if(member.getPoint()>=point){//�����ϴ»�� ����Ʈ�� ������
				
			}else{
				//����Ʈ�� �����մϴ� ����
				response.setContentType("text/html;charset=UTF-8");   
			     PrintWriter writer = response.getWriter();
			     writer.println("<script type='text/javascript'>");
			     writer.println("alert('����Ʈ�� �����մϴ�.');");
			     writer.println("history.back();");
			     writer.println("</script>");
			     writer.flush();
			     return null;
			}
			
			
			boolean check = messageService.addMessage(message);
			
			if(check && service.countTaker(taker)!=0){ //���̵� ����
				int takerno = service.readTaker(taker);//�г����� ���� �˻��� ������ ����� ȸ����ȣ ���
				service.updatePoint(userno, -point); //�ڱ� ����Ʈ����
				service.updatePoint(takerno, point); // ���� ����Ʈ ���� 
			   }else{
				   response.setContentType("text/html;charset=UTF-8");   
				     PrintWriter writer = response.getWriter();
				     writer.println("<script type='text/javascript'>");
				     writer.println("alert('�������� �ʴ� ������Դϴ�.');");
				     writer.println("history.back();");
				     writer.println("</script>");
				     writer.flush();
				     return null;
			   }
			
			MemberVO member2 = new MemberVO();//������ ����Ʈ ����
			
			if(session.getAttribute("userId")!=null){
				member2 = memberService.selectID((String)session.getAttribute("userId"));
				session.setAttribute("userPoint", member2.getPoint());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/item/itemSearch";
	}
	
	@RequestMapping("/itemSearch")//��ǰ �˻� ����
	public String itemSeach(Model model, String search, Criteria cri){
		try {
			model.addAttribute("list", service.itemSeach(search, new RowBounds(cri.getPageStart(), cri.getPerPageNum()))); //service.itemSeach(name));
			
			//����¡
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
