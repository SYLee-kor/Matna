package com.kosta.matna.service.item;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

public interface ItemService {
	
	public ItemVO readItem(int ino)throws Exception ;//특정상품 읽기select
	
	public boolean updateItem(int ino, int num)throws Exception ;//상품구입시 수량 수정update
	
	public List<ItemVO> listAll()throws Exception;//전체상품 조회selectAll
	
	public MemberVO readMember(int no)throws Exception ;//로그인한 회원 읽기select
	
	public int readTaker(String taker)throws Exception ;//입력한 ID로 회원 번호찾기select
	
	public boolean updatePoint(int no, int price)throws Exception ;//상품구입시 포인트 수정update
	
	public boolean insertOrder(Member_orderVO order)throws Exception;//상품 구입시 주문창 생성 insert
	
	public List<ItemVO> itemSeach(String name, RowBounds rowBounds)throws Exception;//전체,검색상품 조회select name:상품명
	
	public int listAllCnt(String search)throws Exception;//전체,검색 상품 갯수 select
}
