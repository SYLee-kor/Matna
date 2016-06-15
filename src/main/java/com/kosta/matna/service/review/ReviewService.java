package com.kosta.matna.service.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewDTO;
import com.kosta.matna.domain.review.ReviewVO;

public interface ReviewService {
	boolean registReview(ReviewVO review, PreviewVO preview) throws Exception;
	boolean modifyReview(ReviewVO review, PreviewVO preview) throws Exception;
	
	boolean viewCntUp(int no) throws Exception;
	boolean removeReview(int no) throws Exception;
	
	int getTotalCount(String tabType) throws Exception;
	Object[] readReview(int no)throws Exception;
	List<ReviewDTO> readList(Map<String,String> typeMap, RowBounds rowBounds) throws Exception;

	List<String> guList() throws Exception;
	List<String> dongList(String gu) throws Exception;
	
	Map<String,Object> gbCheck(Map map)throws Exception;
}
