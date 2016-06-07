package com.kosta.matna.service.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.persistence.community.FreeBoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private FreeBoardDAO dao;

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

}
