package com.kosta.matna.persistence.recipe;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.recipe.ReplyVO;

@Repository
public class ReplyDAOImpl_recipe implements ReplyDAO {

	@Inject
	SqlSession session;
	String nameSpc = "recipeReply.";
	
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
	public boolean removeReply(int no) throws Exception {
		if(session.delete(nameSpc+"delete", no)==1 ) return true;
		return false;
	}

	@Override
	public List<ReplyVO> listReply(int rNo,RowBounds rowBounds) throws Exception {
		return session.selectList(nameSpc+"list", rNo,rowBounds);
	}

	@Override
	public int getTotalCount(int rNo) throws Exception {
		return session.selectOne(nameSpc+"totalCount", rNo);
	}
}
