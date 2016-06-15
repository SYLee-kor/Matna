package com.kosta.matna.persistence.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewDTO;
import com.kosta.matna.domain.review.ReviewVO;

public interface ReviewDAO {
	boolean insertReview(ReviewVO vo) throws Exception;
	boolean insertPreview(PreviewVO vo) throws Exception;
	
	boolean updateReview(ReviewVO vo) throws Exception;
	boolean updatePreview(PreviewVO vo)throws Exception;
	
	boolean viewCntUp(int no) throws Exception;
	boolean replyCntUp(int no) throws Exception;
	
	boolean deleteReview(int no) throws Exception;
	boolean deletePreview(int no) throws Exception;
	
	int getTotalCount(String tabType) throws Exception;
	
	ReviewVO readReview(int no)throws Exception;
	PreviewVO readPreview(int no)throws Exception;
	
	int getGBNo(Map map) throws Exception;
	List<String> guList() throws Exception;
	List<String> dongList(String gu) throws Exception;
	
	List<ReviewDTO> readList(Map<String,String> typeMap, RowBounds rowBounds) throws Exception;
	
	List<Integer> gbCheck(int rNo) throws Exception;

	boolean gbInsert(Map map) throws Exception;
	boolean gbUpdate(Map map)throws Exception;
}
