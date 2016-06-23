package com.kosta.matna.domain.recipe;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker { // # 게시판 하단에 페이징 처리해주는 클래스
	private int totalCount; // @ 전체 레코드 수
	private int startPage; // @ 시작넘버
	private int endPage; // @ 끝 넘버
	private int beforePage;
	private int afterPage;
	private int prevPage;
	private int nextPage;
	
	private boolean prev; // @ 이전페이지 
	private boolean next; // @ 다음페이지
	
	private int displayPageNum=10; // @ 하단에 출력될 페이지 번호 수
	private Criteria cri;
	
	public PageMaker() {}
	
	public PageMaker(Criteria cri, int totalCount) {
		this.totalCount = totalCount;
		this.cri = cri;
		calcData();
	}
	
	
	public int getPrevPage() {
		prevPage = ( (cri.getPage()-1) < 1 ) ? 1 : cri.getPage()-1;
		return prevPage;
	}

	public int getNextPage() {
		nextPage = ( cri.getPage()+1 > endPage ) ? endPage : cri.getPage()+1;
		return nextPage;
	}

	public int getBeforePage() {
		return beforePage;
	}

	public int getAfterPage() {
		return afterPage;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public String makeQuery(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();
		return uriComponents.toUriString();
	}
	/*public String makeSearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
				.build();
		return uriComponents.toUriString();
	}*/
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public void calcData(){
		endPage = (int)	(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage = endPage - displayPageNum +1;
		
		// @ 하단 출력될 마지막 페이지 번호
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		endPage = endPage > tempEndPage ? tempEndPage : endPage;
		
		beforePage = startPage-1 < 1 ? 1 : startPage-1;
		afterPage = endPage+1 > tempEndPage ? tempEndPage : endPage+1;
		
		prev = startPage <= displayPageNum ? false: true;
		next = endPage == tempEndPage ? false : true;
	}
}
