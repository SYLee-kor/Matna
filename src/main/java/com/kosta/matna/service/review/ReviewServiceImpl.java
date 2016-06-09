package com.kosta.matna.service.review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewDTO;
import com.kosta.matna.domain.review.ReviewVO;
import com.kosta.matna.persistence.review.ReviewDAO;

@Transactional
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	ReviewDAO dao;
	
	@Override
	public boolean registReview(ReviewVO review, PreviewVO preview) throws Exception {
		if(dao.insertReview(review) && dao.insertPreview(preview))return true;
		return false;
	}
	
	@Override
	public boolean modifyReview(ReviewVO review, PreviewVO preview) throws Exception {
		if(dao.updateReview(review) && dao.updatePreview(preview))return true;
		return false;
	}

	@Override
	public boolean viewCntUp(int no) throws Exception {
		return dao.viewCntUp(no);
	}

	@Override
	public boolean gbUp(int no, String gbKey) throws Exception {
		return dao.gbUp(no, gbKey);
	}

	@Override
	public boolean removeReview(int no) throws Exception {
		if(dao.deletePreview(no) && dao.deleteReview(no))return true;
		return false;
	}

	@Override
	public Object[] readReview(int no) throws Exception {
		Object[] reviews = new Object[2];
		reviews[0] = dao.readReview(no);
		reviews[1] = dao.readPreview(no);
		return reviews;
	}

	@Override
	public List<ReviewDTO> readList(Map<String, String> typeMap, RowBounds rowBounds) throws Exception {
		return dao.readList(typeMap, rowBounds);
	}

	@Override
	public int getTotalCount(String tabType) throws Exception {
		return dao.getTotalCount(tabType);
	}

	@Override
	public List<String> guList() throws Exception {
		return dao.guList();
	}

	@Override
	public List<String> dongList(String gu) throws Exception {
		return dao.dongList(gu);
	}

}
