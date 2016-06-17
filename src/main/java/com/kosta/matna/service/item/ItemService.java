package com.kosta.matna.service.item;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

public interface ItemService {
	
	public ItemVO readItem(int ino)throws Exception ;//Ư����ǰ �б�select
	
	public boolean updateItem(int ino, int num)throws Exception ;//��ǰ���Խ� ���� ����update
	
	public List<ItemVO> listAll()throws Exception;//��ü��ǰ ��ȸselectAll
	
	public MemberVO readMember(int no)throws Exception ;//�α����� ȸ�� �б�select
	
	public int readTaker(String taker)throws Exception ;//�Է��� ID�� ȸ�� ��ȣã��select
	
	public boolean updatePoint(int no, int price)throws Exception ;//��ǰ���Խ� ����Ʈ ����update
	
	public boolean insertOrder(Member_orderVO order)throws Exception;//��ǰ ���Խ� �ֹ�â ���� insert
	
	public List<ItemVO> itemSeach(String name, RowBounds rowBounds)throws Exception;//��ü,�˻���ǰ ��ȸselect name:��ǰ��
	
	public int listAllCnt(String search)throws Exception;//��ü,�˻� ��ǰ ���� select
}
