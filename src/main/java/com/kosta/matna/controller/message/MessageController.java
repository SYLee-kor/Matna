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
	
	@RequestMapping(value="", method=RequestMethod.GET)	//메시지 쓰기
    public String writeMessage()throws Exception{
		logger.info("메시지 쓰기 form 요청..");	
	   return "main/message/writeMessage";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
    public String message(Model model,HttpSession session,
    		String message, String page, String page2, String searches)throws Exception{
		logger.info("전체 메시지 list 요청...");
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// 받는페이지를 1page로 설정
		int pageNum2 = 1;// 보낸페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		String pageStr2 = page;
		if (pageStr2 != null) {
			pageNum2 = Integer.parseInt(pageStr2);
		}
		int end = pageNum * MAXRECORDCNT;		//받는
		int start = end - (MAXRECORDCNT - 1);
		int end2 = pageNum * MAXRECORDCNT;		//보낸
		int start2 = end - (MAXRECORDCNT - 1);
		
		int receiveTotalCount = messageService.selectReceiverCount(userNo); // 받는 메세지 수
		int sendTotalCount = messageService.selectSenderCount(userNo); // 보낸 메세지 수
		int totalPage = receiveTotalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		int totalPage2 = sendTotalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (receiveTotalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		if (sendTotalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage2++;
		}// totalPage는 페이지 수
		
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
		logger.info("보낸메시지 get list 요청...");
		int userNo = (int) session.getAttribute("userNo");
		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectSenderCount(userNo); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("제목")){
			totalCount = messageService.searchSenderTitleCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
			model.addAttribute("list", messageService.selectSenderPage(userNo, start, end));
			model.addAttribute("senderTotalPage", totalPage);
			model.addAttribute("senderPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectSenderTitle(searches, userNo, start, end));
			return "project/message/sendMessage";
		}
		if(messageSelect.equals("내용")){
			totalCount = messageService.searchSenderContentCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
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
		logger.info("보낸메시지 Post list 요청...");
		
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectSenderCount(userNo); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("제목")){
			totalCount = messageService.searchSenderTitleCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
			//model.addAttribute("list", messageService.selectSenderPage(userNo, start, end));
			model.addAttribute("senderTotalPage", totalPage);
			model.addAttribute("senderPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectSenderTitle(searches, userNo, start, end));
			return "project/message/sendMessage";
		}
		if(messageSelect.equals("내용")){
			totalCount = messageService.searchSenderContentCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
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
		logger.info("받은메시지 list 요청...");
		int userNo = (int) session.getAttribute("userNo");
		
		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectReceiverCount(userNo); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("제목")){
			totalCount = messageService.searchReceiverTitleCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			
			model.addAttribute("list", messageService.selectReceiverTitle(searches, userNo, start, end));
			return "project/message/receiveMessage";
		}
		if(messageSelect.equals("내용")){
			totalCount = messageService.searchReceiverContentCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
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
		logger.info("받은메시지 list 요청...");

		int userNo = (int) session.getAttribute("userNo");
		int pageNum = 1;// 목록출력의 기본페이지를 1page로 설정
		final int MAXRECORDCNT = 10;// 한 페이지에 보여줄 최대 레코드 수
		
		String pageStr = page;
		if (pageStr != null) {
			pageNum = Integer.parseInt(pageStr);
		}
		int end = pageNum * MAXRECORDCNT;
		int start = end - (MAXRECORDCNT - 1);
		
		int totalCount = messageService.selectReceiverCount(userNo); // 전체레코드
		int totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
		if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
			totalPage++;
		}// totalPage는 페이지 수
		
		if(messageSelect==null){
			messageSelect="all";
		}
		if(messageSelect.equals("제목")){
			totalCount = messageService.searchReceiverTitleCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
			model.addAttribute("receiverTotalPage", totalPage);
			model.addAttribute("receiverPage", pageNum);
			model.addAttribute("search",searches);
			model.addAttribute("messageSelect",messageSelect);
			model.addAttribute("list", messageService.selectReceiverTitle(searches, userNo, start, end));
			return "project/message/receiveMessage";
		}
		if(messageSelect.equals("내용")){
			totalCount = messageService.searchReceiverContentCount(searches, userNo); // 전체레코드
			totalPage = totalCount / MAXRECORDCNT;// 전체레코드/보여줄레코드
			if (totalCount % MAXRECORDCNT != 0) {// 잔여레코드가 있다면
				totalPage++;
			}// totalPage는 페이지 수
			
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
	@RequestMapping(value="/sendSuccess",  method=RequestMethod.POST)//메세지 보내기
    public String joinSuccess(MessageVO message, Model model, RedirectAttributes attr)throws Exception{
		
	   logger.info("messageSendSuccess 요청...");
	   boolean check = messageService.addMessage(message);
	   if(check){
		   //attr.addFlashAttribute("msg","SUCCESS");
	   }else{
		   attr.addFlashAttribute("msg","fail");
		   return "redirect:/message/listAll";
	   }
	   
       return "redirect:/message/listAll";//스프링에게 뷰정보 전달!!	
    }
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("check") int check, @RequestParam("message") String message,
			RedirectAttributes attr)throws Exception{
		logger.info("쪽지 삭제...["+ check +"]");
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
		logger.info("메세지 read 요청..");
		
		//model.addAttribute("searches",searches);
		//model.addAttribute("message",message);
		//model.addAttribute(messageService.readMessage(no));
		if(message.equals("receive")){
			messageService.updateState(no);
		}
	   return "redirect:/message/listAll";
	}
	
}





