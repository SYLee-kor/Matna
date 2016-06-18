package com.kosta.matna.persistence.message;

import java.util.List;

import com.kosta.matna.domain.message.MessageVO;


public interface MessageDAO {
	public boolean create(MessageVO vo)throws Exception;
	
	public MessageVO readMessage(int no)throws Exception;
	
	public void updateState(int no)throws Exception;
	
	public void delete(int no)throws Exception;
	
	public void deleteSevenDays()throws Exception;
	
	public List<MessageVO> selectMessageAll() throws Exception;
	public List<MessageVO> selectSenderMessage(int senderNo)throws Exception;
	public List<MessageVO> selectReceiverMessage(int receiverNo)throws Exception;

	public void updateSenderDelete(int no) throws Exception;
	public void updateReceiverDelete(int no) throws Exception;
	
	public List<MessageVO> selectSenderTitle(String title, int senderNo, int start, int end)throws Exception;
	public List<MessageVO> selectSenderContent(String content, int senderNo, int start, int end)throws Exception;
	
	public List<MessageVO> selectReceiverTitle(String title, int receiverNo, int start, int end)throws Exception;
	public List<MessageVO> selectReceiverContent(String content, int receiverNo, int start, int end)throws Exception;
	
	public int searchSenderTitleCount(String title, int senderNo)throws Exception;
	public int searchSenderContentCount(String content, int senderNo)throws Exception;
	public int searchReceiverTitleCount(String title, int receiverNo)throws Exception;
	public int searchReceiverContentCount(String content, int receiverNo)throws Exception;
	
	public int selectAllCount()throws Exception;
	public int selectSenderCount(int senderNo)throws Exception;
	public int selectReceiverCount(int receiverNo)throws Exception;
	
	public List<MessageVO> selectAllPage(int start, int end)throws Exception;
	public List<MessageVO> selectSenderPage(int senderNo, int start, int end)throws Exception;
	public List<MessageVO> selectReceiverPage(int senderNo, int start, int end)throws Exception;
	
}
