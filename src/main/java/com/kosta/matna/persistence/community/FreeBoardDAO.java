package com.kosta.matna.persistence.community;

import java.util.List;

import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.boardVO;


public interface FreeBoardDAO {

	public void create(boardVO vo)throws Exception;
	public boardVO read(int no)throws Exception;
	public void update(boardVO vo)throws Exception;
	public void delete(int no, BoardTypeDAO type)throws Exception; 
	public List<boardVO> listAll(BoardTypeDAO type)throws Exception; 
	public List<boardVO> listCriteria(Criteria cri)throws Exception; 
	public int countPaging()throws Exception; 
	
	public void updateReplyCnt(int no, int amount)throws Exception;
	
	public void updateViewCnt(int no) throws Exception;
	
	public List<boardVO> testSelect()throws Exception;
}
