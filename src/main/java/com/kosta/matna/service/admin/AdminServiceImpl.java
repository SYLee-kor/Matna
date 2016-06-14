package com.kosta.matna.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.item.ItemVO;
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
	public List<ItemVO> listAll() throws Exception {
		return dao.listAll();
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
	public List<Member_orderVO> orderlistAll() throws Exception {
		return dao.orderlistAll();
	}

	@Override
	public boolean deleteOrder(int ono) throws Exception {
		if(dao.deleteOrder(ono))return true;
		return false;
	}
}
