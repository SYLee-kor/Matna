package com.kosta.matna.service.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.ReplyVO;
import com.kosta.matna.persistence.community.CommunityDAO;
import com.kosta.matna.persistence.community.CommunityReplyDAO;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {
	
	@Inject
	CommunityReplyDAO dao;
	
	@Inject
	CommunityDAO cdao;
	
	@Override
	public boolean addReply(ReplyVO vo,BoardTypeVO type) throws Exception {
		if( dao.addReply(vo) && cdao.replyCnt(vo.getbNo(),type) ) return true;
		return false;
	}

	@Override
	public boolean modifyReply(ReplyVO vo) throws Exception {
		return dao.modifyReply(vo);
	}

	@Override
	public boolean removeReply(int bNo,int no,BoardTypeVO type) throws Exception {
		if( dao.removeReply(no,type) && cdao.delReplyCnt(bNo,type) ) return true;
		return dao.removeReply(no,type);
	}

	@Override
	public List<ReplyVO> listReply(int bNo,RowBounds rowBounds,BoardTypeVO type) throws Exception {
		return dao.listReply(bNo, rowBounds,type);
	}

	@Override
	public int getTotalCount(int bNo,BoardTypeVO type) throws Exception {
		return dao.getTotalCount(bNo,type);
	}

}
