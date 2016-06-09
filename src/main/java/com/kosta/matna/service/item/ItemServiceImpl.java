package com.kosta.matna.service.item;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.persistence.item.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	
	@Inject
	private ItemDAO dao;
	
	
	@Override
	public ItemVO readItem(int ino) throws Exception {
		return dao.readItem(ino);
	}

	@Override
	public boolean updateItem(int ino, int num) throws Exception {
		if(dao.updateItem(ino, num))return true;
		return false;
	}

	@Override
	public List<ItemVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public MemberVO readMember(int no) throws Exception {
		return dao.readMember(no);
	}

	@Override
	public boolean updatePoint(int no, int price) throws Exception {
		if(dao.updatePoint(no, price))return true;
		return false;
	}

}
