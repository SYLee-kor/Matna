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
	
	@RequestMapping("/searchId") //수령인, 구매자 선택 검색
	public String searchId(String searchId,String search, Model model){
		System.out.println("구분자"+searchId);
		System.out.println("검색어"+search);
		
		try {
			//List<Integer> memberno= service.orderSearch(search);
	
				
				Map<String, String> map = new HashMap<>();
					map.put("id", searchId);
					map.put("search",search);
				
				List<Member_orderVO> orders= service.orderSearchList(map);
				System.out.println("리스트 사이즈:"+orders.size());
				model.addAttribute("orders",orders);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/order/list";//주문리스트 뷰로이동
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/cancelOrder") //관리자 발송전 주문취소 
	public void cancelOrder(int item, int ono, int giver, int cnt){
		int ino = item;
		int no = giver;
		try {
			ItemVO itemvo = service.readItem(ino);
				int amount = itemvo.getAmount();
				itemvo.setAmount(amount+cnt); 
			service.modifyItem(itemvo); //수량복구
			
				int price = itemvo.getPrice();
				Map<String, Integer> map = new HashMap<>();
					map.put("price", price);
					map.put("no", no);
			service.updatePoint(map); //포인트 복구
			
			service.deleteOrder(ono); // 주문삭제
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping("/updateOrderState") //관리자 배송상태 완료 변경
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
	@RequestMapping("/deleteOrder") //관리자 특정 주문 삭제
	public void deleteOrder(int ono){
		try {
			service.deleteOrder(ono);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/orderlistall") //관리자 주문 전체조회
	public String orderList(Model model){
		try {
			List<Member_orderVO> orders= service.orderlistAll();
			model.addAttribute("orders",orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/order/list";//주문리스트 뷰로이동
	}
	
	@ResponseBody
	@RequestMapping("/itemdelete") // 상품 삭제 (완료)
	public void itemDelete(int ino){
		try {
			service.deleteItem(ino);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/modifyitem") // 상품수정
	public String modifyItem(ItemVO item,MultipartFile file){
		try {
			
			String fileName = file.getOriginalFilename();
			fileName = (fileName == null || fileName.length()==0)? item.getPhoto() : uploadFile(fileName,file.getBytes());
			item.setPhoto(fileName);
			service.modifyItem(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/itemlistall";//상품 전체 호출로 이동
	}
	
	@RequestMapping("/detailitem") //상품 하나만 호출
	public String detailItem(int ino, Model model){
		try {
			ItemVO detailitem = service.readItem(ino);
			model.addAttribute("items", detailitem);
			model.addAttribute("action","modifyitem");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/info";//관리자 아이템 상세보기 뷰로 이동
	}
	
	@RequestMapping("/itemlistall") //상품 전체 호출
	public String listAll(Model model){
		try {
			List<ItemVO> items = service.listAll();
			model.addAttribute("items", items);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/test/admin/list"; //상품 리스트 뷰로 이동
	}
	
	@RequestMapping(value="/item", method=RequestMethod.GET) //사진등록전 불러오기
	public String upphoto(Model model){
		model.addAttribute("action", "item");
		return "/test/admin/info";//관리자 아이템 상세보기 뷰로 이동
	}
	
	@RequestMapping(value="/item", method=RequestMethod.POST) //사진 등록 버튼 클릭
	public String upphoto(HttpSession session,MultipartFile file, String name, String price, String amount, String content, int state){
		//String uploadPath = request.getSession().getServletContext().getRealPath("/img");
		uploadPath = session.getServletContext().getRealPath("/resource/img");
		
		try {
			String imgName = file.getOriginalFilename();
			System.out.println("사진값: "+imgName);
			
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
			//System.out.println("사진 원래이름 : "+file.getOriginalFilename()); 확장자처리 안함/jpg,png,gif
			//System.out.println("사진 확장자명: "+fileName.substring(fileName.lastIndexOf(".")+1));
			service.insertItem(item);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/itemlistall";//상품 전체 호출로 이동
	}
	
	private String uploadFile(String photoName, byte[] fileData)throws Exception{ //상품 UID_상품명 생성
		
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+photoName;
		File target = new File(uploadPath,savedName); 
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
