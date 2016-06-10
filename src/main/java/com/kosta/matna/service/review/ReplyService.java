package com.kosta.matna.service.review;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.review.ReplyVO;

public interface ReplyService {
	boolean addReply(ReplyVO vo) throws Exception;
	boolean modifyReply(ReplyVO vo) throws Exception;
	boolean removeReply(int no) throws Exception;
	List<ReplyVO> listReply(int rno, RowBounds rowBounds) throws Exception;
	
	int getTotalCount(int rno) throws Exception;
}
