package com.kosta.matna.persistence.admin;

import java.util.List;

import com.kosta.matna.domain.admin.AD;
import com.kosta.matna.domain.admin.SearchKeyWord;

public interface AdDAO {
	public void insertAD(AD ad)throws Exception;
	public void updateAD(AD ad)throws Exception;
	public void deleteAD(int no)throws Exception;
	public AD select(int no)throws Exception;
	public AD selectView(int no)throws Exception;
	public List<AD> selectList(SearchKeyWord cri)throws Exception;
	public int listCount(SearchKeyWord cri)throws Exception;
	public int total()throws Exception;
}
