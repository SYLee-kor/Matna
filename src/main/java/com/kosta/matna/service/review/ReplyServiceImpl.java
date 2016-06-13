package com.kosta.matna.service.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.review.ReplyVO;
import com.kosta.matna.persistence.review.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO dao;
	
	@Override
	public boolean addReply(ReplyVO vo) throws Exception {
		return dao.addReply(vo);
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
	public List<ReplyVO> listReply(int rNo) throws Exception {
		return dao.listReply(rNo);
	}

}
