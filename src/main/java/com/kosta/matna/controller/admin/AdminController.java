package com.kosta.matna.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;
	
	String uploadPath;
	
	@RequestMapping("/searchId") //������, ������ ���� �˻�
	public String searchId(String searchId,String search, Model model){
		System.out.println("������"+searchId);
		System.out.println("�˻���"+search);
		
		try {
			//List<Integer> memberno= service.orderSearch(search);
	
				
				Map<String, String> map = new HashMap<>();
					map.put("id", searchId);
					map.put("search",search);
				
				List<Member_orderVO> orders= service.orderSearchList(map);
				System.out.println("����Ʈ ������:"+orders.size());
				model.addAttribute("orders",orders);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/order/list";//�ֹ�����Ʈ ����̵�
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/cancelOrder") //������ �߼��� �ֹ���� 
	public void cancelOrder(int item, int ono, int giver, int cnt){
		int ino = item;
		int no = giver;
		try {
			ItemVO itemvo = service.readItem(ino);
				int amount = itemvo.getAmount();
				itemvo.setAmount(amount+cnt); 
			service.modifyItem(itemvo); //��������
			
				int price = itemvo.getPrice();
				Map<String, Integer> map = new HashMap<>();
					map.put("price", price);
					map.put("no", no);
			service.updatePoint(map); //����Ʈ ����
			
			service.deleteOrder(ono); // �ֹ�����
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping("/updateOrderState") //������ ��ۻ��� �Ϸ� ����
	public void updateOrderState(int ono, int state){
		try {
			Map<String, Integer> map = new HashMap<>();
				map.put("state", state);
				map.put("ono", ono);
			service.updateOrderState(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping("/deleteOrder") //������ Ư�� �ֹ� ����
	public void deleteOrder(int ono){
		try {
			service.deleteOrder(ono);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/orderlistall") //������ �ֹ� ��ü��ȸ
	public String orderList(Model model){
		try {
			List<Member_orderVO> orders= service.orderlistAll();
			model.addAttribute("orders",orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/order/list";//�ֹ�����Ʈ ����̵�
	}
	
	@ResponseBody
	@RequestMapping("/itemdelete") // ��ǰ ���� (�Ϸ�)
	public void itemDelete(int ino){
		try {
			service.deleteItem(ino);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/modifyitem") // ��ǰ����
	public String modifyItem(ItemVO item,MultipartFile file){
		try {
			
			String fileName = file.getOriginalFilename();
			fileName = (fileName == null || fileName.length()==0)? item.getPhoto() : uploadFile(fileName,file.getBytes());
			item.setPhoto(fileName);
			service.modifyItem(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/itemlistall";//��ǰ ��ü ȣ��� �̵�
	}
	
	@RequestMapping("/detailitem") //��ǰ �ϳ��� ȣ��
	public String detailItem(int ino, Model model){
		try {
			ItemVO detailitem = service.readItem(ino);
			model.addAttribute("items", detailitem);
			model.addAttribute("action","modifyitem");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/info";//������ ������ �󼼺��� ��� �̵�
	}
	
	@RequestMapping("/itemlistall") //��ǰ ��ü ȣ��
	public String listAll(Model model){
		try {
			List<ItemVO> items = service.listAll();
			model.addAttribute("items", items);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/list"; //��ǰ ����Ʈ ��� �̵�
	}
	
	@RequestMapping(value="/item", method=RequestMethod.GET) //��������� �ҷ�����
	public String upphoto(Model model){
		model.addAttribute("action", "item");
		return "/test/admin/info";//������ ������ �󼼺��� ��� �̵�
	}
	
	@RequestMapping(value="/item", method=RequestMethod.POST) //���� ��� ��ư Ŭ��
	public String upphoto(HttpSession session,MultipartFile file, String name, String price, String amount, String content, int state){
		//String uploadPath = request.getSession().getServletContext().getRealPath("/img");
		uploadPath = session.getServletContext().getRealPath("/resource/img");
		
		try {
			String imgName = file.getOriginalFilename();
			System.out.println("������: "+imgName);
			
			if(imgName.equals("")){
			ItemVO item = new ItemVO();
				item.setName(name);
				item.setPrice(Integer.parseInt(price));
				item.setAmount(Integer.parseInt(amount));
				item.setContent(content);
			service.insertItem(item);
			}else{
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				String fileName = file.getName();
				ItemVO item = new ItemVO();
				item.setName(name);
				item.setPrice(Integer.parseInt(price));
				item.setAmount(Integer.parseInt(amount));
				item.setContent(content);
				item.setState(state);
				item.setPhoto(savedName);
			//System.out.println("���� �����̸� : "+file.getOriginalFilename()); Ȯ����ó�� ����/jpg,png,gif
			//System.out.println("���� Ȯ���ڸ�: "+fileName.substring(fileName.lastIndexOf(".")+1));
			service.insertItem(item);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/itemlistall";//��ǰ ��ü ȣ��� �̵�
	}
	
	private String uploadFile(String photoName, byte[] fileData)throws Exception{ //��ǰ UID_��ǰ�� ����
		
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+photoName;
		File target = new File(uploadPath,savedName); 
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
