package com.kosta.matna.persistence.review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.review.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSession session;
	
	@Override
	public boolean addReply(ReplyVO vo) throws Exception {
		if(session.insert("review_reply.insert",vo)==1)return true;
		return false;
	}

	@Override
	public boolean modifyReply(ReplyVO vo) throws Exception {
		if(session.insert("review_reply.update",vo)==1)return true;
		return false;
	}

	@Override
	public boolean removeReply(int no) throws Exception {
		if(session.insert("review_reply.delete",no)==1)return true;
		return false;
	}

	@Override
	public List<ReplyVO> listReply(int rno, RowBounds rowBounds) throws Exception {
		return session.selectList("review_reply.list", rno, rowBounds);
	}

	@Override
	public int getTotalCount(int rno) throws Exception {
		return session.selectOne("review_reply.totalCount", rno);
	}

}
