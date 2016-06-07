package com.kosta.matna.persistence.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.item.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public ItemVO read(int no) throws Exception {
		return session.selectOne("item.detail", no);
	}

	@Override
	public void update(int no, int num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("no", no);
			map.put("num", num);
			
		session.update("item.update", map);
	}

	@Override
	public List<ItemVO> listAll() throws Exception {
		return session.selectList("item.listAll");
	}

}
