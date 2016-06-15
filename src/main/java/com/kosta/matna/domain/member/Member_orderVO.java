package com.kosta.matna.domain.member;

import java.sql.Date;

public class Member_orderVO {
	//no,giver, taker, item, cnt, orderDate, state
	private int ono;//상품 시퀀스
	private int giver;//받는사람 no
	private int taker;//주는 사람 no
	private int item;//구입하는 상품명
	private int cnt;//구입하는 상품수
	private Date orderDate;//주문 날짜
	private int state;//배송상태:0 배송완료:1
	private String addr;//배송지
	private String giverid;//받는사람 id
	private String takerid;//주는 사람 id
	private String itemname;//구입하는 상품 번호
	
	public Member_orderVO() {
		// TODO Auto-generated constructor stub
	}
	
	public Member_orderVO(int ono, int giver, int taker, int item, int cnt, Date orderDate, int state, String addr, String giverid, String takerid, String itemname) {
		super();
		this.ono = ono;
		this.giver = giver;
		this.taker = taker;
		this.item = item;
		this.cnt = cnt;
		this.orderDate = orderDate;
		this.state = state;
		this.addr = addr;
		this.giverid = giverid;
		this.takerid = takerid;
		this.itemname = itemname;
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

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
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
	
	public String getGiverid() {
		return giverid;
	}

	public void setGiver(String giverid) {
		this.giverid = giverid;
	}

	public String getTakerid() {
		return takerid;
	}

	public void setTakerid(String takerid) {
		this.takerid = takerid;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	
}
