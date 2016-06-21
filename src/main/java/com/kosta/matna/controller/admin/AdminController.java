package com.kosta.matna.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.service.admin.AdminService;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.message.MessageService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private MessageService messageService;
	
	private static final Logger logger
    = LoggerFactory.getLogger(AdminController.class);
	
	String uploadPath;
	
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
					map.put("price", price*cnt);
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
	
	@RequestMapping("/orderlistall") //관리자 주문 전체조회, 검색 주문 조회, 페이징, 검색페이징
	public String orderList(Model model, Criteria cri,String searchId, String search){
		try {
			//List<Member_orderVO> orders= service.orderlistAll( new RowBounds(cri.getPageStart(), cri.getPerPageNum()));			
			searchId = ( searchId == null || searchId.length()==0 ) ? "buyer" : searchId;
			search = ( search == null ) ? "" : search;
			
			//검색
			Map<String, String> map = new HashMap<>();
				map.put("id", searchId);
				map.put("search",search);
			
			List<Member_orderVO> orders= service.orderSearchList(map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
			model.addAttribute("orders",orders);
			
			//페이징
			int totalCount = service.orderListCount(map);
			int page = ( cri.getPage() <= 0 )? 1 : cri.getPage();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker(cri, totalCount);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("searchId", searchId);
			model.addAttribute("search",search);
			
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
	
	@RequestMapping("/itemlistall") //상품 전체 호출, 상품 검색 호출
	public String listAll(Model model, String search, Criteria cri){
		try {
			
			List<ItemVO> items = service.listAll(search, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
			model.addAttribute("items", items);
			
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
	
	
	
	
	
	//  -------------------------------------------------------------------member, message(창원)
	
	@RequestMapping("/memberList")//게시물 전체 목록 요청
	public String listAll(Model model, String page, String nickname)throws Exception{
		logger.info("전체 회원list 요청..."+ model);	
		System.out.println(nickname);
		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = memberService.selectAllCount(); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		if(nickname!=null){
			totalCount = memberService.selectSearchCount(nickname); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
			model.addAttribute("allTotalPage", totalPage);
			//model.addAttribute("receiverPage", pageNum);
			model.addAttribute("nickname",nickname);
			
			model.addAttribute("list", memberService.selectSearchList(nickname, start, end));
			
			//model.addAttribute("list", memberService.selectNickname(nickname));
			
			return "main/admin/member/listAll";//스프링에게 뷰정보 전달!!	
		}
		
		model.addAttribute("list", memberService.selectAllPage(start, end));
		model.addAttribute("allTotalPage", totalPage);
		//model.addAttribute("senderPage", pageNum);
		//model.addAttribute("list", memberService.listAll());
	   return "main/admin/member/listAll";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("check") int check, 
			RedirectAttributes attr)throws Exception{
		int memberNo = check;
		logger.info("["+memberNo +"] 회원 삭제.");
		memberService.delete(memberNo);
		attr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/admin/memberList";
	}
	
	@RequestMapping("/toUpdateForm")
	public String toUpdateForm(@RequestParam("check") int check, Model model)throws Exception{
		int memberNo = check;
		logger.info("["+memberNo+"]회원의 updateForm 으로...");
		model.addAttribute("memberVO",memberService.selectNo(memberNo));
		return "main/admin/member/updateForm";
	}
	
	@RequestMapping(value="/updateSuccess",  method=RequestMethod.POST)//회원가입폼
    public String updateSuccess(MemberVO member, Model model)throws Exception{
	   logger.info("updateSuccess 요청...");
	   
	   memberService.update(member);
	   
	   model.addAttribute("list", memberService.listAll());
       return "main/admin/member/listAll";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="/search",  method=RequestMethod.POST)//회원가입폼
	public String search(String nickname, Model model, String page)throws Exception{
		logger.info("닉네임 '"+nickname+"' 검색 요청...");
		
		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = memberService.selectSearchCount(nickname); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		model.addAttribute("allTotalPage", totalPage);
		//model.addAttribute("receiverPage", pageNum);
		model.addAttribute("nickname",nickname);
		
		model.addAttribute("list", memberService.selectSearchList(nickname, start, end));
		
		//model.addAttribute("list", memberService.selectNickname(nickname));
		
		return "main/admin/member/listAll";//스프링에게 뷰정보 전달!!	
	}
	
	@RequestMapping(value="/messageList", method=RequestMethod.GET)
    public String message(Model model, String message, String page, String searches)throws Exception{
		logger.info("전체 메시지 list 요청...");

		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectAllCount(); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		model.addAttribute("list", messageService.selectAllPage(start, end));
		model.addAttribute("allTotalPage", totalPage);
		model.addAttribute("senderPage", pageNum);
		
		//model.addAttribute("list", messageService.listAll());
	   return "main/admin/message/messageList";
	}
	
	@RequestMapping("/messageDelete")
	public String messageDelete(@RequestParam("check") int check,
			RedirectAttributes attr)throws Exception{
		logger.info("쪽지 삭제...["+ check +"]");
		//System.out.println(message);
		
		messageService.delete(check);
		attr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/admin/messageList";
	}
	
	@RequestMapping("/messageLastDelete")
	public String messageLastDelete(RedirectAttributes attr)throws Exception{
		logger.info("기간 지난 쪽지 삭제...");
		//System.out.println(message);
		
		messageService.deleteSevenDays();
		attr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/admin/messageList";
	}
	
	//  ------------------------------------------------------------------member, message(창원) 끝
}
