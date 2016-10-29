package com.donkunny.board.paging;

/**
 * 키워드 검색에 필요한 클래스
 * @author donkunny
 * @Reference 코드로 배우는 스프링 웹 프로젝트(구멍가게 코딩단 지음, 남가람북스)
 */
public class SearchCriteria extends Criteria{
	private String searchType;
	private String keyword;
	
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
	@Override
	public String toString(){
		return super.toString() + " SearchCriteria " + "[searchType= " + searchType + ", keyword= " + keyword + "]";
	}
}