package com.kosta.matna.service.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewVO;
import com.kosta.matna.domain.review.SearchKeyWord;

public interface ReviewService {
	
	List<ReviewVO> searchList(SearchKeyWord cri) throws Exception;
	int searchListTotal(SearchKeyWord cri) throws Exception;
	
	boolean registReview(ReviewVO review, PreviewVO preview) throws Exception;
	boolean modifyReview(ReviewVO review, PreviewVO preview) throws Exception;
	
	boolean viewCntUp(int no) throws Exception;
	boolean removeReview(int no) throws Exception;
	
	int getTotalCount(String tabType) throws Exception;
	Object[] readReview(int no)throws Exception;
	List<ReviewVO> readList(Map<String,String> typeMap, RowBounds rowBounds) throws Exception;

	List<String> guList() throws Exception;
	List<String> dongList(String gu) throws Exception;
	
	Map<String,Object> gbCheck(Map map)throws Exception;
}
