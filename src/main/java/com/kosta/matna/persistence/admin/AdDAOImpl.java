package com.kosta.matna.persistence.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.admin.AD;
import com.kosta.matna.domain.admin.SearchKeyWord;

@Repository
public class AdDAOImpl implements AdDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public void insertAD(AD ad) throws Exception {
		session.insert("ad.insert", ad);
	}

	@Override
	public void updateAD(AD ad) throws Exception {
		session.update("ad.update", ad);
	}

	@Override
	public void deleteAD(int no) throws Exception {
		session.delete("ad.delete", no);
	}

	@Override
	public AD select(int no) throws Exception {
		return session.selectOne("ad.select", no);
	}

	@Override
	public List<AD> selectList(SearchKeyWord cri) throws Exception {
		return session.selectList("ad.selectAll",cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listCount(SearchKeyWord cri) throws Exception {
		return session.selectOne("ad.selectCount",cri);
	}

	@Override
	public AD selectView(int no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", no);
		map.put("end", no);
		return session.selectOne("ad.selectView",map);
	}

	@Override
	public int total() throws Exception {
		return session.selectOne("ad.getTotal");
	}

}
