package com.kosta.matna.persistence.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.domain.community.Criteria;
import com.kosta.matna.domain.community.SearchVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	private SqlSession session;

	public CommunityDAOImpl() {
		System.out.println("생성자!!");
	}

	public Map<String, Object> map(int no, BoardTypeVO type) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("type", type.getType());

		return map;
	}
	public Map<String, Object> Smap(SearchVO search, BoardTypeVO type) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type.getType());
		map.put("searchType", search.getSearchType());
		map.put("keyword", search.getKeyword());		
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
		System.out.println("updateViewCnt실행 : " +type.getType());
		session.update("board.updateViewCnt", map(no, type));
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri,BoardTypeVO type) throws Exception {	
        return session.selectList("board.listAll",type, 
        		new RowBounds(cri.getPageStart(), cri.getPerPageNum()));		
	}

	@Override
	public int countPaging(BoardTypeVO type) throws Exception {		
		return session.selectOne("board.countPaging",type);
	}

	@Override
	public List<BoardVO> listSearch(SearchVO cri, BoardTypeVO type) throws Exception {
		return session.selectList("board.listSearch", Smap(cri, type) , new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(SearchVO cri, BoardTypeVO type) throws Exception {
		return session.selectOne("board.listSearchCount", Smap(cri, type));
	}

	@Override
	public boolean replyCnt(int no, BoardTypeVO type) throws Exception {
		System.out.println("정보 : " + no + ", " + type.getType());
		if(session.update("board.updateReplyCnt",map(no,type))==1) return true;
		return false;
	}

}
