package com.kosta.matna.persistence.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public boolean insertItem(ItemVO item) throws Exception {
		if(session.insert("item.insertItem", item)==1)return true;
		return false;
	}

	@Override
	public List<ItemVO> listAll(String search, RowBounds rowBounds) throws Exception {
		return session.selectList("item.listAll",search,rowBounds);
	}

	@Override
	public boolean deleteItem(int ino) throws Exception {
		if(session.delete("item.deleteItem", ino)>0)return true;
		return false;
	}

	@Override
	public ItemVO readItem(int ino) throws Exception {
		return session.selectOne("item.detailItem", ino);
	}

	@Override
	public boolean modifyItem(ItemVO item) throws Exception {
		if(session.update("item.modifyItem", item)==1)return true;
		return false;
	}
	
	@Override
	public boolean deleteOrder(int ono) throws Exception {
		if(session.delete("item.deleteOrder", ono)>0)return true;
		return false;
	}

	@Override
	public boolean updateOrderState(Map<String, Integer> map) throws Exception {
		if(session.update("item.updateOrderState", map)>0)return true;
		return false;
	}

	@Override
	public MemberVO detailMember(int no) throws Exception {
		return session.selectOne("item.detailMember", no);
	}

	@Override
	public boolean updatePoint(Map<String, Integer> map) throws Exception {
		if(session.update("item.updatePoint", map)>0)return true;
		return false;
	}

	@Override
	public List<Member_orderVO> orderSearchList(Map<String, String> map, RowBounds rowBounds) throws Exception {
		return session.selectList("item.orderSearchList", map, rowBounds);
	}

	@Override
	public int orderListCount(Map<String, String> map) throws Exception {
		return session.selectOne("item.orderListCount",map);
	}

	@Override
	public int listAllCnt(String search) throws Exception {
		return session.selectOne("item.listAllCnt", search);
	}

	@Override
	public List<Member_orderVO> orderMyList(int ono, RowBounds rowBounds) throws Exception {
		return session.selectList("item.orderMyList", ono, rowBounds);
	}

	@Override
	public int orderMyListCount(int giver) throws Exception {
		return session.selectOne("item.orderMyListCount", giver);
	}

}
