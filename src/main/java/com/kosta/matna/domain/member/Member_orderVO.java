package com.kosta.matna.domain.member;

import java.sql.Date;

public class Member_orderVO {
	//no,giver, taker, item, cnt, orderDate, state
	private int ono;//��ǰ ������
	private int giver;//�޴»�� no
	private int taker;//�ִ� ��� no
	private String item;//�����ϴ� ��ǰ��
	private int cnt;//�����ϴ� ��ǰ��
	private Date orderDate;//�ֹ� ��¥
	private int state;//��ۻ���:0 ��ۿϷ�:1
	private String addr;//�����
	
	public Member_orderVO() {
		// TODO Auto-generated constructor stub
	}
	
	public Member_orderVO(int ono, int giver, int taker, String item, int cnt, Date orderDate, int state, String addr) {
		super();
		this.ono = ono;
		this.giver = giver;
		this.taker = taker;
		this.item = item;
		this.cnt = cnt;
		this.orderDate = orderDate;
		this.state = state;
		this.addr = addr;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getGiver() {
		return giver;
	}

	public void setGiver(int giver) {
		this.giver = giver;
	}

	public int getTaker() {
		return taker;
	}

	public void setTaker(int taker) {
		this.taker = taker;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
}
