package com.kosta.matna.persistence.community;

import java.util.List;

import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;


public interface FreeBoardDAO {

	public void create(BoardVO vo)throws Exception;
	public BoardVO read(int no,BoardTypeVO type)throws Exception;
	public void update(BoardVO vo)throws Exception;
	public void delete(int no, BoardTypeVO type)throws Exception; 
	public List<BoardVO> listAll(BoardTypeVO type)throws Exception; 
	public void updateViewCnt(int no,BoardTypeVO type) throws Exception;
}
