package com.kosta.matna.service.message;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matna.domain.message.MessageVO;
import com.kosta.matna.persistence.message.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Inject
	private MessageDAO messageDAO;
	
	/*@Inject
	private PointDAO pointDAO;

	@Transactional*/
	@Override
	public boolean addMessage(MessageVO vo) throws Exception {
		if(messageDAO.create(vo))
			return true;
		return false;
		//pointDAO.updatePoint(vo.getSenderNo(), 10);
	}

	@Override
	public MessageVO readMessage(int no) throws Exception {
		messageDAO.updateState(no);
		//pointDAO.updatePoint(userid, 5);
		return messageDAO.readMessage(no);
	}

	@Override
	public List<MessageVO> listAll() throws Exception {
		return messageDAO.selectMessageAll();
	}

	@Override
	public List<MessageVO> selectSenderMessage(int senderNo) throws Exception {
		return messageDAO.selectSenderMessage(senderNo);
	}

	@Override
	public List<MessageVO> selectReceiverMessage(int receiverNo) throws Exception {
		return messageDAO.selectReceiverMessage(receiverNo);
	}

	@Override
	public void delete(int no) throws Exception {
		messageDAO.delete(no);
	}

	@Override
	public void updateState(int no) throws Exception {
		messageDAO.updateState(no);
	}

	@Override
	public void updateReceiverDelete(int no) throws Exception {
		messageDAO.updateReceiverDelete(no);
	}

	@Override
	public void updateSenderDelete(int no) throws Exception {
		messageDAO.updateSenderDelete(no);
	}

	@Override
	public List<MessageVO> selectSenderTitle(String title, int senderNo, int start, int end) throws Exception {
		return messageDAO.selectSenderTitle(title, senderNo, start, end);
	}

	@Override
	public List<MessageVO> selectSenderContent(String content, int senderNo, int start, int end) throws Exception {
		return messageDAO.selectSenderContent(content, senderNo, start, end);
	}

	@Override
	public List<MessageVO> selectReceiverTitle(String title, int receiverNo, int start, int end) throws Exception {
		return messageDAO.selectReceiverTitle(title, receiverNo, start, end);
	}

	@Override
	public List<MessageVO> selectReceiverContent(String content, int receiverNo, int start, int end) throws Exception {
		return messageDAO.selectReceiverContent(content, receiverNo, start, end);
	}

	@Override
	public int selectSenderCount(int senderNo) throws Exception {
		return messageDAO.selectSenderCount(senderNo);
	}

	@Override
	public int selectReceiverCount(int receiverNo) throws Exception {
		return messageDAO.selectReceiverCount(receiverNo);
	}

	@Override
	public int selectAllCount() throws Exception {
		return messageDAO.selectAllCount();
	}

	@Override
	public List<MessageVO> selectSenderPage(int senderNo, int start, int end) throws Exception {
		return messageDAO.selectSenderPage(senderNo, start, end);
	}

	@Override
	public List<MessageVO> selectReceiverPage(int senderNo, int start, int end) throws Exception {
		return messageDAO.selectReceiverPage(senderNo, start, end);
	}

	@Override
	public List<MessageVO> selectAllPage(int start, int end) throws Exception {
		return messageDAO.selectAllPage(start, end);
	}

	@Override
	public int searchSenderTitleCount(String title, int senderNo) throws Exception {
		return messageDAO.searchSenderTitleCount(title, senderNo);
	}

	@Override
	public int searchSenderContentCount(String content, int senderNo) throws Exception {
		return messageDAO.searchSenderContentCount(content, senderNo);
	}

	@Override
	public int searchReceiverTitleCount(String title, int receiverNo) throws Exception {
		return messageDAO.searchReceiverTitleCount(title, receiverNo);
	}

	@Override
	public int searchReceiverContentCount(String content, int receiverNo) throws Exception {
		return messageDAO.searchReceiverContentCount(content, receiverNo);
	}

	@Override
	public void deleteSevenDays() throws Exception {
		messageDAO.deleteSevenDays();
	}

}
