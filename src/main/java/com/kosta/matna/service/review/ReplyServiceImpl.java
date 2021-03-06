package com.kosta.matna.service.review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kosta.matna.domain.review.ReplyVO;
import com.kosta.matna.persistence.member.MemberDAO;
import com.kosta.matna.persistence.review.ReplyDAO;
import com.kosta.matna.persistence.review.ReviewDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO dao;
	
	@Inject
	ReviewDAO rdao;
	@Inject
	MemberDAO mdao;
	
	@Override
	public boolean addReply(ReplyVO vo) throws Exception {
		if( dao.addReply(vo) && rdao.replyCntUp(vo.getrNo()) 
				&& mdao.updateAllPoint(vo.getWriter(), 2)) return true;
		return false;
	}

	@Override
	public boolean modifyReply(ReplyVO vo) throws Exception {
		return dao.modifyReply(vo);
	}

	@Override
	public boolean removeReply(int no) throws Exception {
		if( dao.removeReply(no) && rdao.replyCntDown(no) )return true;
		return false;
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
