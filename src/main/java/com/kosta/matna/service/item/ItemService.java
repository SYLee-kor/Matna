package com.kosta.matna.service.item;

import java.util.List;

import com.kosta.matna.domain.item.ItemVO;

public interface ItemService {
	
	public ItemVO read(int no)throws Exception ;//Ư����ǰ �б�select
	
	public void update(int no, int num)throws Exception ;//��ǰ���Խ� ���� ����update
	
	public List<ItemVO> listAll()throws Exception;//��ü��ǰ ��ȸselectAll
}
