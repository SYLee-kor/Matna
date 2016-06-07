package com.kosta.matna.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.persistence.member.MemberValidator;
import com.kosta.matna.service.member.MemberService;

@Controller
@RequestMapping("/join")//����URL����
public class JoinController {
	
	@Inject
	private MemberService memberService;
	
	@Autowired
	private MemberValidator validator;
	
	private static final Logger logger
    = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//ȸ��������
    public String joinGET()throws Exception{
	   logger.info("ȸ�������� join GET��û...");	
		
       return "project/joinForm";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="/joinSuccess",  method=RequestMethod.POST)//ȸ��������
    public String joinSuccess(@RequestParam("action2") String action2,
    		@RequestParam("id") String id, MemberVO member, Model model)throws Exception{
	   logger.info("joinSuccess ��û...");
	   System.out.println("action2: "+action2);
	   if(action2.equals("confirmid")){
		   System.out.println("���̵� �ߺ� Ȯ�� : "+id);
		   int key=0;
		   if (memberService.checkID(id)) {
				key = 1;
				model.addAttribute("result", "��� �� �� ���� ���̵� �Դϴ�");// ��� �Ҽ� ���� ���̵�
				model.addAttribute("resultKey", key);
			} else {
				model.addAttribute("result", "��� �� �� �ִ� ���̵� �Դϴ�");
				model.addAttribute("resultKey", key);
			}
		   return "project/confirmID";
	   }
	   memberService.insertMember(member);
       return "project/joinSuccess";//���������� ������ ����!!	
    }
	
	@RequestMapping("/listAll")//�Խù� ��ü ��� ��û
	public String listAll(Model model)throws Exception{
		logger.info("��ü ȸ��list ��û..."+ model);	
		model.addAttribute("list", memberService.listAll());
	   return "project/listAll";
	}
	
	@RequestMapping(value="/update" , method=RequestMethod.GET)//ȸ��������
    public String updateGET(Model model)throws Exception{
	   logger.info("ȸ������ ������ update GET��û...");
	   model.addAttribute("memberVO", memberService.selectID("hong"));
		
       return "project/updateForm";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="/updateSuccess",  method=RequestMethod.POST)//ȸ��������
    public String updateSuccess(MemberVO member, Model model)throws Exception{
	   logger.info("updateSuccess ��û...");
	   
	   memberService.update(member);
	   
	   model.addAttribute("list", memberService.listAll());
       return "project/listAll";//���������� ������ ����!!	
    }

	@RequestMapping("/delete")
	public String delete(@RequestParam("no") int memberNo, 
			RedirectAttributes attr)throws Exception{
		logger.info("�Խù� ����...["+ memberNo +"]");
		memberService.delete(memberNo);
		attr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/join/listAll";
	}
}
