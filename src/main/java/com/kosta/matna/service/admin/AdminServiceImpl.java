package com.kosta.matna.service.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;
import com.kosta.matna.persistence.admin.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	public boolean insertItem(ItemVO item) throws Exception {
		if(dao.insertItem(item))return true;
		return false;
	}

	@Override
	public List<ItemVO> listAll(String search, RowBounds rowBounds) throws Exception {
		return dao.listAll(search, rowBounds);
	}

	@Override
	public boolean deleteItem(int ino) throws Exception {
		if(dao.deleteItem(ino))return true;
		return false;
	}

	@Override
	public ItemVO readItem(int ino) throws Exception {
		return dao.readItem(ino);
	}

	@Override
	public boolean modifyItem(ItemVO item) throws Exception {
		if(dao.modifyItem(item))return true;
		return false;
	}

	@Override
	public boolean deleteOrder(int ono) throws Exception {
		if(dao.deleteOrder(ono))return true;
		return false;
	}

	@Override
	public boolean updateOrderState(Map<String, Integer> map) throws Exception {
		if(dao.updateOrderState(map))return true;
		return false;
	}

	@Override
	public MemberVO detailMember(int no) throws Exception {
		return dao.detailMember(no);
	}

	@Override
	public boolean updatePoint(Map<String, Integer> map) throws Exception {
		if(dao.updatePoint(map))return true;
		return false;
	}

	@Override
	public List<Member_orderVO> orderSearchList(Map<String, String> map, RowBounds rowBounds) throws Exception {
		return dao.orderSearchList(map, rowBounds);
	}

	@Override
	public int orderListCount(Map<String, String> map) throws Exception {
		return dao.orderListCount(map);
	}

	@Override
	public int listAllCnt(String search) throws Exception {
		return dao.listAllCnt(search);
	}

	@Override
	public List<Member_orderVO> orderMyList(int ono, RowBounds rowBounds) throws Exception {
		return dao.orderMyList(ono, rowBounds);
	}

	@Override
	public int orderMyListCount(int giver) throws Exception {
		return dao.orderMyListCount(giver);
	}

}
