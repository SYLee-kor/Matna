package com.kosta.matna.service.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewVO;
import com.kosta.matna.domain.review.SearchKeyWord;
import com.kosta.matna.persistence.member.MemberDAO;
import com.kosta.matna.persistence.review.ReplyDAO;
import com.kosta.matna.persistence.review.ReviewDAO;

@Transactional
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	ReviewDAO dao;
	@Inject
	MemberDAO mDao;
	@Inject
	ReplyDAO rDao;
	
	@Override
	public boolean registReview(ReviewVO review, PreviewVO preview) throws Exception {
		if(dao.insertReview(review) && dao.insertPreview(preview)
				&& mDao.updateAllPoint(review.getWriter(), 100))return true;
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
	public boolean removeReview(int no) throws Exception {
		if(rDao.removeAllReply(no) && dao.deletePreview(no) && dao.deleteReview(no))return true;
		return false;
	}

	@Override
	public Object[] readReview(int no) throws Exception {
		Object[] reviews = new Object[2];
		reviews[0] = dao.readReview(no);
		reviews[1] = dao.readPreview(no);
		dao.viewCntUp(no); //# 조회수 증가
		return reviews;
	}

	@Override
	public List<ReviewVO> readList(Map<String, String> typeMap, RowBounds rowBounds) throws Exception {
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

	@Override
	public Map<String,Object> gbCheck(Map map) throws Exception {
		List<Integer> list = dao.gbCheck((int)map.get("rNo"));
		// # 리스트에 좋아요, 싫어요를 등록한 회원이라면.... 리턴!!
		Map<String,Object> resultMap = new HashMap<>();
		for (int i = 0; i < list.size(); i++) {
			if( (int)map.get("userNo")== list.get(i) ){
				resultMap.put("result", false);
				resultMap.put("gbNum",-1);
				resultMap.put("gbType", (String)map.get("gbType"));
				return resultMap;
			}
		} 
		// # 리턴에 안걸렸다면 좋아요 싫어요를 누르지 않은 회원..
		// # gbCheck 테이블에 인서트 후 review 테이블에 good 또는 bad +1
		if( dao.gbInsert(map) ) dao.gbUpdate(map); 
		resultMap.put("result", true);
		resultMap.put("gbNum", dao.getGBNo(map));
		resultMap.put("gbType", (String)map.get("gbType"));
		return resultMap;
	}

	@Override
	public List<ReviewVO> searchList(SearchKeyWord cri) throws Exception {
		return dao.searchList(cri);
	}

}
