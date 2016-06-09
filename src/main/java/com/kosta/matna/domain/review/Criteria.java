package com.kosta.matna.domain.review;

public class Criteria {

	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = (page < 1) ? 1 : page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		System.out.println("setperPageNum 실행");
		this.perPageNum = (perPageNum < 1 || perPageNum > 100) ? 10 : perPageNum;
	}
	
	public int getPageStart(){
		System.out.println("getPageStart 실행 : "+page+"/"+(this.page-1)*perPageNum);
		return (this.page-1)*perPageNum;
	}
	
	public int getPageEnd(){
		System.out.println("getPageEnd 실행 : "+page+"/"+this.page*perPageNum);
		return this.page*perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page : "+page+" / perPageNum : "+perPageNum+"]";
	}
}
