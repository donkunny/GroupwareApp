package com.donkunny.board;

import java.util.Date;

public class NoticeBoardVO {
	private int nno;
	private String n_id;
	private String n_title;
	private String n_content;
	private int n_replycnt;
	private int n_cnt;
	private Date n_regdate;

	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_replycnt() {
		return n_replycnt;
	}
	public void setN_replycnt(int n_replycnt) {
		this.n_replycnt = n_replycnt;
	}
	public int getN_cnt() {
		return n_cnt;
	}
	public void setN_cnt(int n_cnt) {
		this.n_cnt = n_cnt;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	
	@Override
	public String toString() {
		return "[nno: " + nno + "], [n_id: " + n_id + "], [n_title: " + n_title + "], [n_content: " + n_content + "], [n_replycnt: " + n_replycnt + "], [n_cnt: " + 
				n_cnt + "], [n_regdate: " + n_regdate + "]";
		
	}
}
