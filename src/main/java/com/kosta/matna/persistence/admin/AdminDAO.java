package com.kosta.matna.persistence.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

public interface AdminDAO {

	public boolean insertItem(ItemVO item)throws Exception;//상품 등록시 DB에 상품 등록 insert
	
	public List<ItemVO> listAll(String search, RowBounds rowBounds)throws Exception;//전체상품 조회selectAll
	
	public boolean deleteItem(int ino)throws Exception;//체크 상품 삭제 delete
	
	public ItemVO readItem(int ino)throws Exception ;//특정상품 읽기select
	
	public boolean modifyItem(ItemVO item)throws Exception ;//등록상품 수정update
	
	//public List<Member_orderVO> orderlistAll( RowBounds rowBounds)throws Exception;//전체,검색 주문 조회selectAll

	public boolean deleteOrder(int ono)throws Exception;//체크 주문 삭제 delete

	public boolean updateOrderState(Map<String, Integer> map)throws Exception ;//체크 주문 수정update
	
	public MemberVO detailMember(int no)throws Exception ;//특정회원 정보읽기select
	
	public boolean updatePoint(Map<String, Integer> map)throws Exception ;//주문 취소 포인트 수정point
	
	public List<Member_orderVO> orderSearchList(Map<String, String> map, RowBounds rowBounds)throws Exception;//특정 주문 조회selectAll
	
	public int orderListCount(Map<String, String> map)throws Exception;//전체,검색 주문 갯수 select
	
	public int listAllCnt(String search)throws Exception;//전체,검색 상품 갯수 select
	//public int orderSearchCount(Map<String, String> map)throws Exception;//검색 주문 갯수 select
}
