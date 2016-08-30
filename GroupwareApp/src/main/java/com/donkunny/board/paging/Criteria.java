package com.donkunny.board.paging;

/**
 * 목적 :
 * select * from tbl_notice where nno > 0 order by nno desc limit #{pageStart}, #{perPageNum}
 * pageStart, perPageNum 값을 넣기 위한 객체 생성
 * @author donkunny
 * @Reference 코드로 배우는 스프링 웹 프로젝트(구멍가게 코딩단 지음, 남가람북스)
 */

public class Criteria {
	
	private int page;
	private int perPageNum; // 페이지 당 보이는 게시물 수
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page){
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	// 시작 데이터 번호 = (페이지 번호 - 1) * 페이지 당 보여지는 개수
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	// 페이지 당 보여지는 개수
	public int getPerPageNum(){
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "[page: " + page + "], [perPageNum: " + perPageNum + "]";
	}
}
