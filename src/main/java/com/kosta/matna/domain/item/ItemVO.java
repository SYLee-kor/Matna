package com.kosta.matna.domain.item;

import java.util.Date;

public class ItemVO {
	//ino, name, price, amount, state, regdate, content
	private int ino;//��ǰ ������
	private String name;//��ǰ��
	private int price;//��ǰ��
	private int amount;//����
	private int state;//new:1 hot:2
	private Date regdate;//��ǰ�����
	private String content;//��ǰ����
	private String photo;//��ǰ ���� �ּ�
	
	public ItemVO() {
		photo="";
	}
	
	public ItemVO(int ino, String name, int price, int amount, int state, Date regdate, String content, String photo) {
		super();
		this.ino = ino;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.state = state;
		this.regdate = regdate;
		this.content = content;
		this.photo = photo;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
