package com.kosta.matna.persistence.item;

import java.util.List;

import com.kosta.matna.domain.item.ItemVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.member.Member_orderVO;

public interface ItemDAO {

	public ItemVO readItem(int ino)throws Exception ;//Ư����ǰ �б�select
	
	public boolean updateItem(int ino, int num)throws Exception ;//��ǰ���Խ� ���� ����update
	
	public List<ItemVO> listAll()throws Exception;//��ü��ǰ ��ȸselectAll
	
	public MemberVO readMember(int no)throws Exception ;//�α����� ȸ�� �б�select
	
	public boolean updatePoint(int no, int price)throws Exception ;//��ǰ���Խ� ����Ʈ ����update
	
	public boolean insertOrder(int no1, int no2, String name, int cnt)throws Exception;//��ǰ ���Խ� �ֹ�â ���� insert
}
