package com.kosta.matna.service.community;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.ReplyVO;


public interface CommunityReplyService {
	boolean addReply(ReplyVO vo,BoardTypeVO type) throws Exception;
	boolean modifyReply(ReplyVO vo) throws Exception;
	boolean removeReply(int bNo,int no,BoardTypeVO type) throws Exception;
	List<ReplyVO> listReply(int bNo,RowBounds rowBounds,BoardTypeVO type) throws Exception;	
	int getTotalCount(int bNo,BoardTypeVO type) throws Exception;
}
