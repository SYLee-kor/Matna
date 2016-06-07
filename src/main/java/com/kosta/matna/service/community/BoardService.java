package com.kosta.matna.service.community;

import java.util.List;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;


public interface BoardService {
	public void regist(BoardVO board)throws Exception;
	public BoardVO read(int no,BoardTypeVO type)throws Exception;
	public void modify(BoardVO board)throws Exception;
	public void remove(int no,BoardTypeVO type)throws Exception;
	public List<BoardVO> listAll(BoardTypeVO type)throws Exception;

	 
}
