package com.kosta.matna.service.recipe;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kosta.matna.domain.recipe.ReplyVO;
import com.kosta.matna.persistence.recipe.RecipeDAO;
import com.kosta.matna.persistence.recipe.ReplyDAO;

@Service
public class ReplyServiceImpl_recipe implements ReplyService {
	
	@Inject
	ReplyDAO dao;
	
	@Inject
	RecipeDAO rdao;
	
	@Override
	public boolean addReply(ReplyVO vo) throws Exception {
		if( dao.addReply(vo) && rdao.replyCntUp(vo.getrNo()) ) return true;
		return false;
	}

	@Override
	public boolean modifyReply(ReplyVO vo) throws Exception {
		return dao.modifyReply(vo);
	}

	@Override
	public boolean removeReply(int no) throws Exception {
		return dao.removeReply(no);
	}

	@Override
	public List<ReplyVO> listReply(int rNo,RowBounds rowBounds) throws Exception {
		return dao.listReply(rNo, rowBounds);
	}

	@Override
	public int getTotalCount(int rNo) throws Exception {
		return dao.getTotalCount(rNo);
	}

}
