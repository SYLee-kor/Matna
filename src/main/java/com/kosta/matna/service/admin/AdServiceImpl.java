package com.kosta.matna.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.admin.AD;
import com.kosta.matna.domain.admin.SearchKeyWord;
import com.kosta.matna.persistence.admin.AdDAO;

@Service
public class AdServiceImpl implements AdService {
	
	@Inject
	private AdDAO dao;

	@Override
	public void insertAD(AD ad) throws Exception {
		dao.insertAD(ad);
	}

	@Override
	public void updateAD(AD ad) throws Exception {
		dao.updateAD(ad);
	}

	@Override
	public void deleteAD(int no) throws Exception {
		dao.deleteAD(no);
	}

	@Override
	public AD select(int no) throws Exception {
		return dao.select(no);
	}

	@Override
	public List<AD> selectList(SearchKeyWord cri) throws Exception {
		return dao.selectList(cri);
	}

	@Override
	public int listCount(SearchKeyWord cri) throws Exception {
		return dao.listCount(cri);
	}

	@Override
	public AD selectView(int no) throws Exception {
		return dao.selectView(no);
	}

	@Override
	public int total() throws Exception {
		return dao.total();
	}
}