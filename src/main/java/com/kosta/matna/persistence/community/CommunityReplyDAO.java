package com.kosta.matna.persistence.community;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.ReplyVO;


public interface CommunityReplyDAO {
	boolean addReply(ReplyVO vo) throws Exception;
	boolean modifyReply(ReplyVO vo) throws Exception;
	boolean removeReply(int no,BoardTypeVO type) throws Exception;
	List<ReplyVO> listReply(int bNo,RowBounds rowBounds,BoardTypeVO type) throws Exception;	
	int getTotalCount(int bNo,BoardTypeVO type) throws Exception;
	
}
