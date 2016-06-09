package com.kosta.matna.persistence.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewDTO;
import com.kosta.matna.domain.review.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession session;
	
	@Override
	public boolean insertReview(ReviewVO vo) throws Exception {
		if(session.insert("review.insert", vo)==1) return true;
		return false;
	}

	@Override
	public boolean insertPreview(PreviewVO vo) throws Exception {
		if(session.insert("preview.insert",vo)==1)return true;
		return false;
	}

	@Override
	public boolean updateReview(ReviewVO vo) throws Exception {
		if(session.update("review.update", vo)==1)return true;
		return false;
	}

	@Override
	public boolean updatePreview(PreviewVO vo) throws Exception {
		if(session.update("preview.update", vo)==1)return true;
		return false;
	}

	@Override
	public boolean viewCntUp(int no) throws Exception {
		if(session.update("review.viewCntUp", no)==1)return true;
		return false;
	}

	@Override
	public boolean gbUp(int no, String gbKey) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("no", no);
		map.put("gbKey", gbKey);
		if(session.update("review.gbUp", map)==1)return true;
		return false;
	}

	@Override
	public boolean deleteReview(int no) throws Exception {
		if(session.delete("review.delete", no)==1)return true;
		return false;
	}

	@Override
	public boolean deletePreview(int no) throws Exception {
		if(session.delete("preview.delete", no)==1)return true;
		return false;
	}

	@Override
	public List<ReviewDTO> readList(Map<String, String> typeMap, RowBounds rowBounds) throws Exception {
		System.out.println(session.selectList("review.selectList", typeMap, rowBounds).size());
		return session.selectList("review.selectList", typeMap, rowBounds);
	}

	@Override
	public ReviewVO readReview(int no) throws Exception {
		return session.selectOne("review.selectOne", no);
	}

	@Override
	public PreviewVO readPreview(int no) throws Exception {
		return session.selectOne("preview.selectOne", no);
	}

	@Override
	public int getTotalCount(String tabType) throws Exception {
		return session.selectOne("review.totalCount", tabType);
	}

	@Override
	public List<String> guList() throws Exception {
		return session.selectList("review.guList");
	}

	@Override
	public List<String> dongList(String gu) throws Exception {
		return session.selectList("review.dongList",gu);
	}

}
