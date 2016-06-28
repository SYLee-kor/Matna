package com.kosta.matna.domain.review;

public class SearchKeyWord extends Criteria{
	private String rb;
	private String gu;
	private String dong;
	private String money;
	private String parking;
	private String date;
	private String search;
	private String reviewType;
	
	public SearchKeyWord() {
	}

	
	
	public SearchKeyWord(String rb, String gu, String dong, String money, String parking, String date, String search,
			String reviewType) {
		this.rb = rb;
		this.gu = gu;
		this.dong = dong;
		this.money = money;
		this.parking = parking;
		this.date = date;
		this.search = search;
		this.reviewType = reviewType;
	}

	

	public String getReviewType() {
		return reviewType;
	}



	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}



	@Override
	public String toString() {
		return "[rb : "+rb+", gu : "+gu+", dong : "+dong+", money : "+money+", parking : "+parking+", date : "+date+", search : "+search+"]";
	}

	public String getRb() {
		return rb;
	}

	public void setRb(String rb) {
		this.rb = rb;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		if(gu == null)
			this.gu = "";
		else if(gu.length()>0)
			this.gu = gu;
		else
			this.gu = "";
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		if(dong == null)
			this.dong = "";
		else if(dong.length()>0)
			this.dong = dong;
		else
			this.dong = "";
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		String price="";
		if(money.equals("5õ�� ����"))
			price = "0,5";
		else if(money.equals("5õ��~1����"))
			price = "5,10";
		else if(money.equals("1����~2����"))
			price = "10,20";
		else if(money.equals("2����~3����"))
			price = "20,30";
		else if(money.equals("3����~5����"))
			price = "30,50";
		else if(money.equals("5����~7����"))
			price = "50,70";
		else if(money.equals("7���� �̻�"))
			price = "70,100";
		else
			this.money = price;
		
		this.money = price;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	
}
