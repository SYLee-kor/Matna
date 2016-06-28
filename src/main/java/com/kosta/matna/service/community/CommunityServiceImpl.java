package com.kosta.matna.service.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.SearchVO;
import com.kosta.matna.persistence.community.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(int no,BoardTypeVO type) throws Exception {
		dao.updateViewCnt(no,type);
		return dao.read(no,type);
	}
	
	@Override
	public BoardVO update(int no,BoardTypeVO type) throws Exception {
		return dao.read(no,type);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void remove(int no,BoardTypeVO type) throws Exception {
		dao.delete(no,type);	
	}

	@Override
	public List<BoardVO> listAll(BoardTypeVO type) throws Exception {
		return dao.listAll(type);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri,BoardTypeVO type) throws Exception {
		return dao.listCriteria(cri,type);
	}

	@Override
	public int listCountCriteria(BoardTypeVO type) throws Exception {		
		return dao.countPaging(type);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchVO cri, BoardTypeVO type) throws Exception {
		return dao.listSearch(cri,type);
	}

	@Override
	public int listSearchCount(SearchVO cri, BoardTypeVO type) throws Exception {
		return dao.listSearchCount(cri,type);
	}
	
	
}
