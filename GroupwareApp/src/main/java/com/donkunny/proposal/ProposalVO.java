package com.donkunny.proposal;

import java.sql.Date;

public class ProposalVO {
	private int pno;
	private String p_id;
	private String p_writer;
	private String p_title;
	private String p_status;
	private Date p_acceptDate;
	private String p_content;
	private String p_reportOpinion;
	private Date p_reportDate;
	private String p_acceptOpinion;
	private String p_acceptor;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_writer() {
		return p_writer;
	}
	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public Date getP_acceptDate() {
		return p_acceptDate;
	}
	public void setP_acceptDate(Date p_acceptDate) {
		this.p_acceptDate = p_acceptDate;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_reportOpinion() {
		return p_reportOpinion;
	}
	public void setP_reportOpinion(String p_reportOpinion) {
		this.p_reportOpinion = p_reportOpinion;
	}
	public Date getP_reportDate() {
		return p_reportDate;
	}
	public void setP_reportDate(Date p_reportDate) {
		this.p_reportDate = p_reportDate;
	}
	public String getP_acceptOpinion() {
		return p_acceptOpinion;
	}
	public void setP_acceptOpinion(String p_acceptOpinion) {
		this.p_acceptOpinion = p_acceptOpinion;
	}
	public String getP_acceptor() {
		return p_acceptor;
	}
	public void setP_acceptor(String p_acceptor) {
		this.p_acceptor = p_acceptor;
	}
}
