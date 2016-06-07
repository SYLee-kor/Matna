package com.kosta.matna.persistence.item;

import java.util.List;

import com.kosta.matna.domain.item.ItemVO;

public interface ItemDAO {

	public ItemVO read(int no)throws Exception ;//특정상품 읽기select
	
	public void update(int no, int num)throws Exception ;//상품구입시 수량 수정update
	
	public List<ItemVO> listAll()throws Exception;//전체상품 조회selectAll
}
