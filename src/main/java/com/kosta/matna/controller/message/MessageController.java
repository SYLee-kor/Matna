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
import com.kosta.matna.service.message.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	private static final Logger logger
    = LoggerFactory.getLogger(MessageController.class);
	
	@Inject
	private MessageService messageService;
	
	@RequestMapping(value="", method=RequestMethod.GET)	//�޽��� ����
    public String writeMessage()throws Exception{
		logger.info("�޽��� ���� form ��û..");	
	   return "main/message/writeMessage";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
    public String message(Model model,HttpSession session,
    		String message, String page, String page2, String searches)throws Exception{
		logger.info("��ü �޽��� list ��û...");
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// �޴��������� 1page�� ����
		int pageNum2 = 1;// ������������ 1page�� ����
		final int MAXRECORDCNT = 10;// �� �������� ������ �ִ� ���ڵ� ��
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		String pageStr2 = page;
		if (pageStr2 != null) {
			pageNum2 = Integer.parseInt(pageStr2);
		}
		int end = pageNum * MAXRECORDCNT;		//�޴�
		int start = end - (MAXRECORDCNT - 1);
		int end2 = pageNum * MAXRECORDCNT;		//����
		int start2 = end - (MAXRECORDCNT - 1);
		
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
		/*}
		
		model.addAttribute("list", messageService.selectReceiverPage(userNo, start, end));
		model.addAttribute("receiverTotalPage", totalPage);
		model.addAttribute("receiverPage", pageNum);
		model.addAttribute("search",searches);
		
		return "project/message/message";*/
	}
	
	/*@RequestMapping(value="/sendList", method=RequestMethod.GET)
	public String sendMessage(HttpSession session,Model model,
			String messageSelect, String searches, String page)throws Exception{
		logger.info("�����޽��� get list ��û...");
		int userNo = (int) session.getAttribute("userNo");
		int pageNum = 1;// �������� �⺻�������� 1page�� ����
		final int MAXRECORDCNT = 10;// �� �������� ������ �ִ� ���ڵ� ��
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectSenderCount(userNo); // ��ü���ڵ�
		int totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
		if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
			totalPage++;
		}// totalPage�� ������ ��
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchSenderTitleCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("list", messageService.selectSenderPage(userNo, start, end));
			model.addAttribute("senderTotalPage", totalPage);
			model.addAttribute("senderPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectSenderTitle(searches, userNo, start, end));
			return "project/message/sendMessage";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchSenderContentCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("senderTotalPage", totalPage);
			model.addAttribute("senderPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);	
			
			model.addAttribute("list", messageService.selectSenderContent(searches, userNo, start, end));
			return "project/message/sendMessage";
		}
		
		model.addAttribute("list", messageService.selectSenderPage(userNo, start, end));
		model.addAttribute("senderTotalPage", totalPage);
		model.addAttribute("senderPage", pageNum);
		model.addAttribute("search","");
		
		//model.addAttribute("list", messageService.selectSenderMessage(2));
		
		return "project/message/sendMessage";
	}
	@RequestMapping(value="/sendList", method=RequestMethod.POST)
	public String sendMessagePOST(HttpSession session,Model model,
			String messageSelect, String searches, String page)throws Exception{
		logger.info("�����޽��� Post list ��û...");
		
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// �������� �⺻�������� 1page�� ����
		final int MAXRECORDCNT = 10;// �� �������� ������ �ִ� ���ڵ� ��
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectSenderCount(userNo); // ��ü���ڵ�
		int totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
		if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
			totalPage++;
		}// totalPage�� ������ ��
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchSenderTitleCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			//model.addAttribute("list", messageService.selectSenderPage(userNo, start, end));
			model.addAttribute("senderTotalPage", totalPage);
			model.addAttribute("senderPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectSenderTitle(searches, userNo, start, end));
			return "project/message/sendMessage";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchSenderContentCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("senderTotalPage", totalPage);
			model.addAttribute("senderPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);	
			
			model.addAttribute("list", messageService.selectSenderContent(searches, userNo, start, end));
			return "project/message/sendMessage";
		}
		
		model.addAttribute("list", messageService.selectSenderPage(userNo, start, end));
		model.addAttribute("senderTotalPage", totalPage);
		model.addAttribute("senderPage", pageNum);
		model.addAttribute("search","");
		
		return "project/message/sendMessage";
	}
	
	@RequestMapping(value="/receiveList", method=RequestMethod.GET)
	public String receiveMessage(HttpSession session,Model model,
			String messageSelect, String searches, String page)throws Exception{
		logger.info("�����޽��� list ��û...");
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// �������� �⺻�������� 1page�� ����
		final int MAXRECORDCNT = 10;// �� �������� ������ �ִ� ���ڵ� ��
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectReceiverCount(userNo); // ��ü���ڵ�
		int totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
		if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
			totalPage++;
		}// totalPage�� ������ ��
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchReceiverTitleCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectReceiverTitle(searches, userNo, start, end));
			return "project/message/receiveMessage";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchReceiverContentCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectReceiverContent(searches, userNo, start, end));
			return "project/message/receiveMessage";
		}
		
		model.addAttribute("list", messageService.selectReceiverPage(userNo, start, end));
		model.addAttribute("receiverTotalPage", totalPage);
		model.addAttribute("receiverPage", pageNum);
		model.addAttribute("search","");
		
		//model.addAttribute("list", messageService.selectReceiverMessage(4));
		
		return "project/message/receiveMessage";
	}
	@RequestMapping(value="/receiveList", method=RequestMethod.POST)
	public String receiveMessagePOST(HttpSession session,Model model,
			String messageSelect, String searches, String page)throws Exception{
		logger.info("�����޽��� list ��û...");

		int userNo = (int) session.getAttribute("userNo");
		int pageNum = 1;// �������� �⺻�������� 1page�� ����
		final int MAXRECORDCNT = 10;// �� �������� ������ �ִ� ���ڵ� ��
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectReceiverCount(userNo); // ��ü���ڵ�
		int totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
		if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
			totalPage++;
		}// totalPage�� ������ ��
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchReceiverTitleCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			model.addAttribute("list", messageService.selectReceiverTitle(searches, userNo, start, end));
			return "project/message/receiveMessage";
		}
		if(messageSelect.equals("����")){
			totalCount = messageService.searchReceiverContentCount(searches, userNo); // ��ü���ڵ�
			totalPage = totalCount / MAXRECORDCNT;// ��ü���ڵ�/�����ٷ��ڵ�
			if (totalCount % MAXRECORDCNT != 0) {// �ܿ����ڵ尡 �ִٸ�
				totalPage++;
			}// totalPage�� ������ ��
			
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectReceiverContent(searches, userNo, start, end));
			return "project/message/receiveMessage";
		}
		model.addAttribute("receiverTotalPage", totalPage);
		model.addAttribute("receiverPage", pageNum);
		model.addAttribute("search",searches);
		model.addAttribute("list", messageService.selectReceiverPage(userNo, start, end));
		return "project/message/receiveMessage";
	}
	*/
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
			return "redirect:/message/listAll";
		}
		if(message.equals("receive")){
			messageService.updateReceiverDelete(check);
			return "redirect:/message/listAll";
		}
		return "redirect:/message/listAll";
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
	
}





