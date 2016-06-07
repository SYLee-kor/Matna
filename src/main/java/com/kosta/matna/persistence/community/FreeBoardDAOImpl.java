package com.kosta.matna.persistence.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.boardVO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSession session;
	
	public FreeBoardDAOImpl() {
		System.out.println("»ý¼ºÀÚ!!");
	}
	
	@Override
	public void create(boardVO vo) throws Exception {
		session.insert("board.create", vo);
	}

	@Override
	public boardVO read(int no) throws Exception {
		return session.selectOne("board.read",no);
	}

	@Override
	public void update(boardVO vo) throws Exception {
		session.update("board.update", vo);
	}

	@Override
	public void delete(int no, BoardTypeDAO type) throws Exception {
		Map<String,Object> map = new HashMap<>(); 	
		   map.put("no", no);
		   map.put("type", type.getType());
		session.delete("board.delete", map);
	}

	@Override
	public List<boardVO> listAll(BoardTypeDAO type) throws Exception {
		return session.selectList("board.listAll",type);
	}

	@Override
	public List<boardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPaging() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReplyCnt(int no, int amount) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<boardVO> testSelect() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
