package com.kosta.matna.persistence.review;

import java.util.List;

import com.kosta.matna.domain.review.ReplyVO;

public interface ReplyDAO {
	boolean addReply(ReplyVO vo) throws Exception;
	boolean modifyReply(ReplyVO vo) throws Exception;
	boolean removeReply(int no) throws Exception;
	List<ReplyVO> listReply(int rNo) throws Exception;	
}
