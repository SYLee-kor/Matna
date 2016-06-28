package com.kosta.matna.persistence.message;

import java.net.StandardSocketOptions;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.message.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public boolean create(MessageVO vo) throws Exception {
		System.out.println("ssafsf");
		Object senderNo = session.selectOne("message.selectSenderNo",vo);
		Object receiverNo = session.selectOne("message.selectReceiverNo",vo);
		//System.out.println(senderNo+"////"+receiverNo);
		if(senderNo==null || receiverNo==null){
			return false;
		}
		vo.setSenderNo((int)senderNo);
		vo.setReceiverNo((int)receiverNo);
		//System.out.println(vo.getSenderNo()+","+vo.getTitle()+","+vo.getContent()+","+vo.getReceiverNo());
		session.insert("message.create", vo);
		return true;
	}

	@Override
	public MessageVO readMessage(int no) throws Exception {
		return session.selectOne("message.readMessage",no);
	}

	@Override
	public void updateState(int no) throws Exception {
		session.update("message.updateState",no);
	}
	
	@Override
	public void updateSenderDelete(int no) throws Exception {
		session.update("message.updateSenderDelete",no);
	}
	
	@Override
	public void updateReceiverDelete(int no) throws Exception {
		session.update("message.updateReceiverDelete",no);
	}

	@Override
	public List<MessageVO> selectMessageAll() throws Exception {
		return session.selectList("message.selectMessageAll");
	}

	@Override
	public List<MessageVO> selectSenderMessage(int senderNo) throws Exception {
		return session.selectList("message.selectSenderMessage",senderNo);
	}

	@Override
	public List<MessageVO> selectReceiverMessage(int receiverNo) throws Exception {
		return session.selectList("message.selectReceiverMessage",receiverNo);
	}

	@Override
	public void delete(int no) throws Exception {
		session.delete("message.delete",no);
	}

	@Override
	public List<MessageVO> selectSenderTitle(String title, int senderNo, int start, int end) throws Exception {
		//List<MessageVO> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();
		   map.put("title",title );
		   map.put("senderNo",senderNo );
		   map.put("start", start);
		   map.put("end", end);

		return session.selectList("message.searchSenderTitle",map);
	}

	@Override
	public List<MessageVO> selectSenderContent(String content, int senderNo, int start, int end) throws Exception {
		//List<MessageVO> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();
		   map.put("content",content );
		   map.put("senderNo",senderNo );
		   map.put("start", start);
		   map.put("end", end);

		return session.selectList("message.searchSenderContent",map);
	}

	@Override
	public List<MessageVO> selectReceiverTitle(String title, int receiverNo, int start, int end) throws Exception {
		//List<MessageVO> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();
		   map.put("title",title );
		   map.put("receiverNo",receiverNo );
		   map.put("start", start);
		   map.put("end", end);

		return session.selectList("message.searchReceiverTitle",map);
	}

	@Override
	public List<MessageVO> selectReceiverContent(String content, int receiverNo, int start, int end) throws Exception {
		//List<MessageVO> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();
		   map.put("content",content );
		   map.put("receiverNo",receiverNo );
		   map.put("start", start);
		   map.put("end", end);

		return session.selectList("message.searchReceiverContent",map);
	}

	@Override
	public int selectSenderCount(int senderNo) throws Exception {
		return session.selectOne("message.selectSenderCount",senderNo);
	}

	@Override
	public int selectReceiverCount(int receiverNo) throws Exception {
		return session.selectOne("message.selectReceiverCount",receiverNo);
	}

	@Override
	public int selectAllCount() throws Exception {
		return session.selectOne("message.selectAllCount");
	}

	@Override
	public List<MessageVO> selectSenderPage(int senderNo, int start, int end) throws Exception {
		
		Map<String,Integer> map = new HashMap<>();
			map.put("senderNo", senderNo);
			map.put("start", start);
			map.put("end", end);
		
		return session.selectList("message.selectSenderPage", map);
	}

	@Override
	public List<MessageVO> selectReceiverPage(int receiverNo, int start, int end) throws Exception {
		
		Map<String,Integer> map = new HashMap<>();
		map.put("receiverNo", receiverNo);
		map.put("start", start);
		map.put("end", end);
		
		return session.selectList("message.selectReceiverPage", map);
	}

	@Override
	public List<MessageVO> selectAllPage(int start, int end) throws Exception {
		
		Map<String,Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return session.selectList("message.selectAllPage", map);
	}

	@Override
	public int searchSenderTitleCount(String title, int senderNo) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		   map.put("title",title );
		   map.put("senderNo",senderNo );
		
		return session.selectOne("message.searchSenderTitleCount",map);
	}

	@Override
	public int searchSenderContentCount(String content, int senderNo) throws Exception {

		Map<String, Object> map = new HashMap<>();
		   map.put("content",content );
		   map.put("senderNo",senderNo );
		
		return session.selectOne("message.searchSenderContentCount",map);
	}

	@Override
	public int searchReceiverTitleCount(String title, int receiverNo) throws Exception {

		Map<String, Object> map = new HashMap<>();
		   map.put("title",title );
		   map.put("receiverNo",receiverNo );
		
		return session.selectOne("message.searchReceiverTitleCount",map);
	}

	@Override
	public int searchReceiverContentCount(String content, int receiverNo) throws Exception {

		Map<String, Object> map = new HashMap<>();
		   map.put("content",content );
		   map.put("receiverNo",receiverNo );
		
		return session.selectOne("message.searchReceiverContentCount",map);
	}

	@Override
	public void deleteSevenDays() throws Exception {
		session.delete("message.deleteSevenDays");
	}

	@Override
	public int IsNewMessage(int receiverNo) throws Exception {
		return session.selectOne("message.IsNewMessage", receiverNo);
	}

}
