package com.kosta.matna.service.community;

import java.util.List;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.SearchVO;


public interface CommunityService {
	public void regist(BoardVO board)throws Exception;
	public BoardVO read(int no,BoardTypeVO type)throws Exception;
	public BoardVO update(int no,BoardTypeVO type)throws Exception;
	public void modify(BoardVO board)throws Exception;
	public void remove(int no,BoardTypeVO type)throws Exception;
	public List<BoardVO> listAll(BoardTypeVO type)throws Exception;
	public List<BoardVO> listCriteria(Criteria cri,BoardTypeVO type)throws Exception;
	public int listCountCriteria(BoardTypeVO type)throws Exception;
	public List<BoardVO> listSearchCriteria(SearchVO cri,BoardTypeVO type)throws Exception;
	public int listSearchCount(SearchVO cri,BoardTypeVO type)throws Exception; 
}
