package com.kosta.matna.persistence.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSession session;

	public FreeBoardDAOImpl() {
		System.out.println("생성자!!");
	}

	public Map<String, Object> map(int no, BoardTypeVO type) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("type", type.getType());

		return map;
	}

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert("board.create", vo);
	}

	@Override
	public BoardVO read(int no, BoardTypeVO type) throws Exception {
		return session.selectOne("board.read", map(no, type));
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update("board.update", vo);
	}

	@Override
	public void delete(int no, BoardTypeVO type) throws Exception {
		session.delete("board.delete", map(no, type));
	}

	@Override
	public List<BoardVO> listAll(BoardTypeVO type) throws Exception {
		return session.selectList("board.listAll", type);
	}

	@Override
	public void updateViewCnt(int no, BoardTypeVO type) throws Exception {
		System.out.println("updateViewCnt실행");
		session.update("board.updateViewCnt", map(no, type));
	}

}
