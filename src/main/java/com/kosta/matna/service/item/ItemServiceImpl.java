package com.kosta.matna.service.item;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.persistence.item.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Inject
	private ItemDAO dao;
	
	@Override
	public ItemVO read(int no) throws Exception {
		System.out.println("넘겨받은 숫자값"+no);
		return dao.read(no);
	}

	@Override
	public void update(int no, int num) throws Exception {
		dao.update(no,num);
	}

	@Override
	public List<ItemVO> listAll() throws Exception {
		return dao.listAll();
	}

}
