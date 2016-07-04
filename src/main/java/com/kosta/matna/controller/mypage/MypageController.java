package com.kosta.matna.controller.mypage;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.domain.review.Criteria;
import com.kosta.matna.domain.review.PageMaker;
import com.kosta.matna.service.admin.AdminService;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.validator.MatnaValidator;

@Controller
@RequestMapping("/mypage")//����URL����
public class MypageController {
	@Inject
	private MemberService memberService;
	
	@Inject
	private AdminService service;
	
	private static final Logger logger
    = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//ȸ��������
    public String joinGET(HttpSession session, Model model, Criteria cri)throws Exception{
	   logger.info("���������� �� GET��û...");
	   if(session.getAttribute("userNo")!=null){
		   int userNo=(int)session.getAttribute("userNo");
		   
	   		model.addAttribute("memberVO",memberService.selectNo(userNo));//ȸ������ ����
	   		
	   		List<Member_orderVO> orders = service.orderMyList(userNo, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	   		model.addAttribute("orders", orders);
	   		
			//����¡
	   		int totalCount = service.orderMyListCount(userNo);
			int page = ( cri.getPage() <= 0 )? 1 : cri.getPage();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker(cri, totalCount);
			model.addAttribute("pageMaker", pageMaker);
			//model.addAttribute("search",search);
	   		
	   }
	   Map<String,String> errMsgs = (Map<String,String>)session.getAttribute("errMsgs");
	   if(errMsgs != null && errMsgs.get("isValid") != null){
		   MemberVO member = (MemberVO)session.getAttribute("member_err");
		   model.addAttribute("memberVO", member);
		   model.addAttribute("errMsgs", errMsgs);
		   session.removeAttribute("errMsgs");
		   session.removeAttribute("member_err");
	   }
	   
       return "/main/mypage/mypage";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="/modifySuccess",  method=RequestMethod.POST)//ȸ��������
    public String modifySuccess(String confirmpass,HttpSession session,
    		RedirectAttributes attr, MemberVO member, Model model)throws Exception{
	   logger.info("modifySuccess ��û...");
	   System.out.println("point : " + member.getPoint()+", grade : " + member.getGrade());
	   
	   if(!MatnaValidator.isValid(member, "MemberVO") ) { 
			session.setAttribute("errMsgs", MatnaValidator.getErrMsgs());
			session.setAttribute("member_err", member);
			return "redirect:/mypage#tab-2";
		}
	   System.out.println("�����۾� �븮������ ���");
	   int userNo=(int)session.getAttribute("userNo");
	   
	   boolean equalPw=(member.getPw().equals(confirmpass));	//�������� �� ����� ��ġ�ϴ���
	   
	   if(equalPw){
		   memberService.update(member);
		   model.addAttribute("memberVO",memberService.selectNo(userNo));
		   System.out.println("�����Ϸ�");
		   attr.addFlashAttribute("msg","modifySuccess");
	   }else{
		   attr.addFlashAttribute("msg","notPw");
		   System.out.println("�� ����� ��ġ���� �ʽ��ϴ�.");
	   }
       return "redirect:/mypage#tab-2";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="withdraw" , method=RequestMethod.POST)//ȸ��������
    public String withdraw(HttpServletRequest request,HttpSession session, Model model, RedirectAttributes attr)throws Exception{
	   logger.info("ȸ��Ż�� ��û..");
	   
	   String defaultPath = request.getSession().getServletContext().getRealPath("/");
       String root = defaultPath + "resource" + File.separator + "user" + File.separator + session.getAttribute("userNo")+ File.separator;
	   deleteDirectory(new File(root));
	   
	   
	   ServletContext application = session.getServletContext();
		List<Integer> loginList = (List<Integer>)application.getAttribute("loginList");
		loginList = (loginList == null) ? new ArrayList<Integer>() : loginList;
		for (int i = 0; i < loginList.size(); i++) {
			//System.out.println(loginList.get(i)+","+session.getAttribute("userNo"));
			if( loginList.get(i) == session.getAttribute("userNo")) {
				loginList.remove(i);
			}
		}
		application.setAttribute("loginList",loginList );
		System.out.println("�α������� ȸ����ȣ:"+application.getAttribute("loginList"));
	   
	   int userNo=(int)session.getAttribute("userNo");
	
	   	session.setAttribute("userNo", null);
		session.setAttribute("userId", null);
		session.setAttribute("userNickname", null);
		session.setAttribute("userPoint", null);
		session.setAttribute("isLogin", null);
		
		model.addAttribute("isLogin", session.getAttribute("isLogin"));
		
		memberService.delete(userNo);
		
		attr.addFlashAttribute("msg","withdraw");
	   
		return "redirect:/mypage";
    }
	
	public static boolean deleteDirectory(File path) {
        if(!path.exists()) {
            return false;
        }
         
        File[] files = path.listFiles();
        for (File file : files) {
            if (file.isDirectory()) {
                deleteDirectory(file);
            } else {
                file.delete();
            }
        }
         
        return path.delete();
    }
	
	//-----------------------------------------���������� ��ǰ����Ʈ
	
	@Transactional
	@ResponseBody
	@RequestMapping("/ordercancel") //���������� �߼��� �ֹ���� 
	public void cancelOrder(int item, int ono, int giver, int cnt, HttpSession session){
		int ino = item;
		int no = giver;
	
		try {
			ItemVO itemvo = service.readItem(ino);
				int amount = itemvo.getAmount();
				itemvo.setAmount(amount+cnt); 
			service.modifyItem(itemvo); //��������
			
				int price = itemvo.getPrice();
				Map<String, Integer> map = new HashMap<>();
					map.put("price", price*cnt);
					map.put("no", no);
			service.updatePoint(map); //����Ʈ ����
			
			MemberVO member2 = new MemberVO();//���Ž� ����Ʈ ����
			
			if(session.getAttribute("userId")!=null){
				member2 = memberService.selectID((String)session.getAttribute("userId"));
				session.setAttribute("userPoint", member2.getPoint());
			}
			
			service.deleteOrder(ono); // �ֹ�����
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@ResponseBody
	@RequestMapping("/deleteOrder") //���������� Ư�� �ֹ� ����
	public void deleteOrder(int ono){
		try {
			service.deleteOrder(ono);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	//-----------------------------------------���������� ��ǰ����Ʈ
	
}
