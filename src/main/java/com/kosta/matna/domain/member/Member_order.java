package com.kosta.matna.domain.member;

import java.util.Date;

public class Member_order {
	//no,giver, taker, item, cnt, orderDate, state
	private int no;//상품 시퀀스
	private int giver;//받는사람 no
	private int taker;//주는 사람 no
	private String item;//구입하는 상품명
	private int cnt;//구입하는 상품수
	private Date orderDate;//주문 날짜
	private int state;//배송상태:0 배송완료:1
	
	public Member_order() {
		// TODO Auto-generated constructor stub
	}
	
	public Member_order(int no, int giver, int taker, String item, int cnt, Date orderDate, int state) {
		super();
		this.no = no;
		this.giver = giver;
		this.taker = taker;
		this.item = item;
		this.cnt = cnt;
		this.orderDate = orderDate;
		this.state = state;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
}
