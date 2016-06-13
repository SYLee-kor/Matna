package com.kosta.matna.domain.community;

public class SearchVO extends Criteria{

	private String searchType;
	private String keyword;
	
	@Override
	public String toString() {
		return "SearchCriteria [�˻�����: "+searchType+
				     ", Ű����: "+keyword+"]";
	}
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}