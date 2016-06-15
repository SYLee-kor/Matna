package com.kosta.matna.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.service.member.MemberService;

@Controller
@RequestMapping("/join")//����URL����
public class JoinController {
	
	@Inject
	private MemberService memberService;
	
	//@Autowired
	//private MemberValidator validator;
	
	private static final Logger logger
    = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="" , method=RequestMethod.GET)//ȸ��������
    public String joinGET()throws Exception{
	   logger.info("ȸ�������� join GET��û...");	
		
       return "main/join/joinForm";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="/confirmNick",  method=RequestMethod.POST)//�г��� �ߺ�Ȯ��
    public String nickConfirmid(@RequestParam("action2") String action2,
    		@RequestParam("nickname") String nickname, 
    		Model model)throws Exception{
		
	   logger.info("confirmNick ��û...");
	   
	   if(action2.equals("confirmNick")){
		   System.out.println("�г��� �ߺ� Ȯ�� : "+ nickname);
		   int key=0;
		   if (memberService.checkNickname(nickname)) {
			   key = 1;
			   model.addAttribute("result", "��� �� �� ���� �г��� �Դϴ�");// ��� �Ҽ� ���� �г���
			   model.addAttribute("resultKey", key);
		   } else {
			   model.addAttribute("result", "��� �� �� �ִ� �г��� �Դϴ�");
			   model.addAttribute("resultKey", key);
		   }
		   return "main/join/confirmID";
	   }
	   
	   return "main/join/confirmID";
	}
	
	@RequestMapping(value="/confirmId",  method=RequestMethod.POST)//id �ߺ�Ȯ��
	public String idConfirmid(@RequestParam("action2") String action2,
			@RequestParam("id") String id, Model model)throws Exception{
		
		logger.info("confirmId ��û...");
		
		if(action2.equals("confirmid")){
			System.out.println("���̵� �ߺ� Ȯ�� : "+ id);
			int key=0;
			if (memberService.checkID(id)) {
				key = 1;
				model.addAttribute("result", "��� �� �� ���� ���̵� �Դϴ�");// ��� �Ҽ� ���� ���̵�
				model.addAttribute("resultKey", key);
			} else {
				model.addAttribute("result", "��� �� �� �ִ� ���̵� �Դϴ�");
				model.addAttribute("resultKey", key);
			}
			return "main/join/confirmID";
		}
		
		return "main/join/confirmID";
	}
	
	@RequestMapping(value="/joinSuccess",  method=RequestMethod.POST)//ȸ��������
    public String joinSuccess(@RequestParam("action2") String action2,
    		@RequestParam("id") String id, 
    		@ModelAttribute("member") MemberVO member,
    		Model model, BindingResult bindingResult)throws Exception{
		
	   logger.info("joinSuccess ��û...");
	   
	   /*validator.validate(member, bindingResult);
	   if(bindingResult.hasErrors()){
		   model.addAttribute("member",member);
		   return "main/join/joinFrom";
	   }*/
	   
	   memberService.insertMember(member);
       return "main/join/joinSuccess";//���������� ������ ����!!	
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

