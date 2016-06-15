package com.kosta.matna.persistence.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.item.ItemVO;
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
	public List<ItemVO> listAll() throws Exception {
		return session.selectList("item.listAll");
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
	public List<Member_orderVO> orderlistAll() throws Exception {
		return session.selectList("item.orderListAll");
	}

	@Override
	public boolean deleteOrder(int ono) throws Exception {
		if(session.delete("item.deleteOrder", ono)>0)return true;
		return false;
	}

}
