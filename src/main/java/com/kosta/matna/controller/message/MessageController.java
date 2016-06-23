package com.kosta.matna.controller.message;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.message.MessageVO;
import com.kosta.matna.service.member.MemberService;
import com.kosta.matna.service.message.MessageService;
import com.kosta.test.JqplotTest;

@Controller
@RequestMapping("/message")
public class MessageController {

	private static final Logger logger
    = LoggerFactory.getLogger(MessageController.class);
	
	@Inject
	private MessageService messageService;
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="", method=RequestMethod.GET)	//�޽��� ����
    public String writeMessage()throws Exception{
		logger.info("�޽��� ���� form ��û..");	
	   return "main/message/writeMessage";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
    public String message(Model model,HttpSession session,
    		String message, String receivepage, String sendpage, String searches)throws Exception{
		logger.info("��ü �޽��� list ��û...");
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// �޴��������� 1page�� ����
		int pageNum2 = 1;// ������������ 1page�� ����
		final int MAXRECORDCNT = 10;// �� �������� ������ �ִ� ���ڵ� ��
		
		String pageStr = receivepage;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		String pageStr2 = sendpage;
		if (pageStr2 != null) {
			pageNum2 = Integer.parseInt(pageStr2);
		}
		int end = pageNum * MAXRECORDCNT;		//�޴�
		int start = end - (MAXRECORDCNT - 1);
		int end2 = pageNum2 * MAXRECORDCNT;		//����
		int start2 = end2 - (MAXRECORDCNT - 1);
		
		int receiveTotalCount = messageService.selectReceiverCount(userNo); // �޴� �޼��� ��
		int sendTotalCount = messageService.selectSenderCount(userNo); // ���� �޼��� ��
		int totalPage = receiveTotalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
		int totalPage2 = sendTotalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
		if (receiveTotalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
			totalPage++;
		}// totalPage�� ������ ��
		if (sendTotalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
			totalPage2++;
		}// totalPage�� ������ ��
		
			/*List<MessageVO> sendList= messageService.selectSenderPage(userNo, start2, end2);
			for (int i = 0; i < sendList.size(); i++) {
				
				System.out.println(sendList.get(i).getSenderNickname()+","+sendList.get(i).getReceiverNickname());
			}*/
			
			model.addAttribute("sendList", messageService.selectSenderPage(userNo, start2, end2));
			model.addAttribute("senderTotalPage", totalPage2);
			model.addAttribute("senderPage", pageNum2);
			model.addAttribute("search",searches);
		
			model.addAttribute("receiveList", messageService.selectReceiverPage(userNo, start, end));
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			
			return "main/message/message";

	}
	
	@RequestMapping(value="/sendSuccess",  method=RequestMethod.POST)//�޼��� ������
    public String joinSuccess(MessageVO message, Model model, RedirectAttributes attr)throws Exception{
		
	   logger.info("messageSendSuccess ��û...");
	   boolean check = messageService.addMessage(message);
	   if(check){
		   //attr.addFlashAttribute("msg","SUCCESS");
	   }else{
		   attr.addFlashAttribute("msg","fail");
		   return "redirect:/message/listAll";
	   }
	   
       return "redirect:/message/listAll";//���������� ������ ����!!	
    }
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("check") int check, @RequestParam("message") String message,
			RedirectAttributes attr)throws Exception{
		logger.info("���� ����...["+ check +"]");
		//System.out.println(message);
		if(message.equals("send")){
			messageService.updateSenderDelete(check);
			return "redirect:/message/listAll#tab-2";
		}
		if(message.equals("receive")){
			messageService.updateReceiverDelete(check);
			return "redirect:/message/listAll#tab-1";
		}
		return "redirect:/message/listAll#tab-1";
	}
	
	@RequestMapping(value="/read")
    public String readMessage(@RequestParam("no") int no,
    		@RequestParam("message") String message, Model model, String searches)throws Exception{
		logger.info("�޼��� read ��û..");
		
		//model.addAttribute("searches",searches);
		//model.addAttribute("message",message);
		//model.addAttribute(messageService.readMessage(no));
		if(message.equals("receive")){
			messageService.updateState(no);
		}
	   return "redirect:/message/listAll";
	}
	
	
	@RequestMapping(value="jq", method=RequestMethod.GET)	//�޽��� ����
    public String jqplot()throws Exception{
		logger.info("jqplot GET ��û..");	
		
		List<String> list = memberService.selectGbGender(1);
		int mcount=0;
		int wcount=0;
		for(int i=0;i<list.size();i++){
			if(list.get(i).equals("��")){
				mcount++;
			}else if(list.get(i).equals("��")){
				wcount++;
			}
		}
		
		System.out.println(mcount+","+wcount);
		
	   return "test/jqplot";
	}
	
}





