package com.donkunny.board.paging;

/**
 * 키워드 검색에 필요한 클래스
 * @author donkunny
 * @Reference 코드로 배우는 스프링 웹 프로젝트(구멍가게 코딩단 지음, 남가람북스)
 */
public class SearchCriteria extends Criteria{
	private String searchType;
	private String keyword;
	private String p_status;
	private String p_id;
	private String p_acceptor;
	
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
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_acceptor() {
		return p_acceptor;
	}
	public void setP_acceptor(String p_acceptor) {
		this.p_acceptor = p_acceptor;
	}
	@Override
	public String toString(){
		return super.toString() + " SearchCriteria " + "[searchType= " + searchType + ", keyword= " + keyword + "]";
	}
}