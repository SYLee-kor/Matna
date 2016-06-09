package com.kosta.matna.persistence.item;

import java.util.List;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

public interface ItemDAO {

	public ItemVO readItem(int ino)throws Exception ;//특정상품 읽기select
	
	public boolean updateItem(int ino, int num)throws Exception ;//상품구입시 수량 수정update
	
	public List<ItemVO> listAll()throws Exception;//전체상품 조회selectAll
	
	public MemberVO readMember(int no)throws Exception ;//로그인한 회원 읽기select
	
	public boolean updatePoint(int no, int price)throws Exception ;//상품구입시 포인트 수정update
	
	public boolean insertOrder(int no1, int no2, String name, int cnt)throws Exception;//상품 구입시 주문창 생성 insert
}
