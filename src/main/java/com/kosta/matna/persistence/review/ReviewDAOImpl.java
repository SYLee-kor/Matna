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
	public boolean replyCntUp(int no) throws Exception {
		if(session.update("review.replyCntUp",no)==1) return true;
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
	public List<ReviewVO> readList(Map<String, String> typeMap, RowBounds rowBounds) throws Exception {
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

	@Override
	public List<Integer> gbCheck(int rNo) throws Exception {
		return session.selectList("review.gbCheck", rNo);
	}

	@Override
	public boolean gbInsert(Map map) throws Exception {
		if(session.insert("review.gbInsert",map)==1) return true;
		return false;
	}

	@Override
	public int getGBNo(Map map) throws Exception {
		return session.selectOne("review.getGBNo", map);
	}
	
	@Override
	public boolean gbUpdate(Map map) throws Exception {
		System.out.println(map.get("gbType"));
		if(session.update("review.gbUpdate", map)==1)return true;
		return false;
	}
}
