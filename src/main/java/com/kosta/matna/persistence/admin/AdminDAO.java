package com.kosta.matna.persistence.admin;

import java.util.List;
import java.util.Map;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

public interface AdminDAO {

	public boolean insertItem(ItemVO item)throws Exception;//��ǰ ��Ͻ� DB�� ��ǰ ��� insert
	
	public List<ItemVO> listAll()throws Exception;//��ü��ǰ ��ȸselectAll
	
	public boolean deleteItem(int ino)throws Exception;//üũ ��ǰ ���� delete
	
	public ItemVO readItem(int ino)throws Exception ;//Ư����ǰ �б�select
	
	public boolean modifyItem(ItemVO item)throws Exception ;//��ϻ�ǰ ����update
	
	public List<Member_orderVO> orderlistAll()throws Exception;//��ü�ֹ� ��ȸselectAll
	
	public boolean deleteOrder(int ono)throws Exception;//üũ �ֹ� ���� delete

	public boolean updateOrderState(Map<String, Integer> map)throws Exception ;//üũ �ֹ� ����update
	
	public MemberVO detailMember(int no)throws Exception ;//Ư��ȸ�� �����б�select
	
	public boolean updatePoint(Map<String, Integer> map)throws Exception ;//�ֹ� ��� ����Ʈ ����point
	
	public List<Member_orderVO> orderSearchList(Map<String, String> map)throws Exception;//Ư�� �ֹ� ��ȸselectAll
	
}
