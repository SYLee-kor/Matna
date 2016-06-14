package com.kosta.matna.persistence.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

@Repository
public class ItemDAOImpl implements ItemDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public ItemVO readItem(int ino) throws Exception {
		return session.selectOne("item.detailItem", ino);
	}

	@Override
	public boolean updateItem(int ino, int num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("ino", ino);
			map.put("num", num);
			
		if(session.update("item.updateItem", map)==1){
			return true;
		}
		return false;
	}

	@Override
	public List<ItemVO> listAll() throws Exception {
		return session.selectList("item.listAll");
	}

	@Override
	public MemberVO readMember(int no) throws Exception {
		return session.selectOne("item.detailMember", no);
	}

	@Override
	public boolean updatePoint(int no, int price) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("no", no);
			map.put("price", price);
		
			if(session.update("item.updatePoint", map)==1){
				return true;
			}
		return false;
	}

	@Override
	public boolean insertOrder(Member_orderVO order) throws Exception {
		if(session.insert("item.insertOrder",order)==1)return true;
		return false;
	}

	@Override
	public List<ItemVO> itemSeach(String name) throws Exception {
		return session.selectList("item.itemSeach", name);
	}

}
