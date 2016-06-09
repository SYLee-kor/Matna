package com.kosta.matna.domain.review;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker { // # �Խ��� �ϴܿ� ����¡ ó�����ִ� Ŭ����
	private int totalCount; // @ ��ü ���ڵ� ��
	private int startPage; // @ ���۳ѹ�
	private int endPage; // @ �� �ѹ�
	private boolean prev; // @ ���������� 
	private boolean next; // @ ����������
	
	private int displayPageNum=10; // @ �ϴܿ� ��µ� ������ ��ȣ ��
	private Criteria cri;
	
	public PageMaker() {}
	
	public PageMaker(Criteria cri, int totalCount) {
		this.totalCount = totalCount;
		this.cri = cri;
		calcData();
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
		
		// @ �ϴ� ��µ� ������ ������ ��ȣ
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage){
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false: true;
		next = endPage * cri.getPerPageNum() >= totalCount? false : true;
	}
}
