package com.donkunny.board.paging;

public class CriForSchedule extends Criteria{
	
	private String s_id;
	
	public CriForSchedule(){
		super();
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	@Override
	public String toString() {
		return "[s_id: " + s_id + "], [page: " + getPage() + "], [perPageNum: " + getPerPageNum() +"]";
	}

}
