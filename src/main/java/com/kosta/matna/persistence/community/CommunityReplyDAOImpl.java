package com.kosta.matna.persistence.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.ReplyVO;


@Repository
public class CommunityReplyDAOImpl implements CommunityReplyDAO {

	@Inject
	SqlSession session;
	String nameSpc = "communityReply.";
	
	public Map<String, Object> mapNo(int no, BoardTypeVO type) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("type", type.getType());

		return map;
	}
	public Map<String, Object> mapBNo(int no, BoardTypeVO type) {
		Map<String, Object> map = new HashMap<>();
		map.put("bNo", no);
		map.put("type", type.getType());

		return map;
	}
	
	@Override
	public boolean addReply(ReplyVO vo) throws Exception {
		if(session.insert(nameSpc+"insert", vo)==1 ) return true;
		return false;
	}

	@Override
	public boolean modifyReply(ReplyVO vo) throws Exception {
		if(session.update(nameSpc+"update", vo)==1 ) return true;
		return false;
	}

	@Override
	public boolean removeReply(int no,BoardTypeVO type) throws Exception {
		if(session.delete(nameSpc+"delete", mapNo(no,type))==1 ) return true;
		return false;
	}

	@Override
	public List<ReplyVO> listReply(int bNo,RowBounds rowBounds,BoardTypeVO type) throws Exception {
		return session.selectList(nameSpc+"list", mapBNo(bNo,type),rowBounds);
	}

	@Override
	public int getTotalCount(int bNo,BoardTypeVO type) throws Exception {
		System.out.println("type : " + type.getType());
		System.out.println("bno : " + bNo);
		int c=session.selectOne(nameSpc+"totalCount", mapBNo(bNo,type));
		System.out.println("°¹¼ö : " + c);
		return c;
	}

}
