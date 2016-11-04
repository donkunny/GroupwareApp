package com.donkunny.member;

import java.sql.Date;

public class TempMemberVO {
	private String t_id;
	private String t_pwd;
	private String t_pwd_confirm;
	private String t_name;
	private String t_email;
	private String t_tel;
	private String t_birth;
	private Date t_regdate;
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getT_pwd() {
		return t_pwd;
	}
	public void setT_pwd(String t_pwd) {
		this.t_pwd = t_pwd;
	}
	public String getT_pwd_confirm() {
		return t_pwd_confirm;
	}
	public void setT_pwd_confirm(String t_pwd_confirm) {
		this.t_pwd_confirm = t_pwd_confirm;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_email() {
		return t_email;
	}
	public void setT_email(String t_email) {
		this.t_email = t_email;
	}
	public String getT_tel() {
		return t_tel;
	}
	public void setT_tel(String t_tel) {
		this.t_tel = t_tel;
	}
	public String getT_birth() {
		return t_birth;
	}
	public void setT_birth(String t_birth) {
		this.t_birth = t_birth;
	}
	public Date getT_regdate() {
		return t_regdate;
	}
	public void setT_regdate(Date t_regdate) {
		this.t_regdate = t_regdate;
	}
	
	@Override
	public String toString() {
		return " [id: " + t_id + "]," + " [pwd: " + t_pwd + "]," 
				+ " [name: " + t_name + "]," + " [email: " + t_email + "]," + " [tel" + t_tel + "],"
				+ " [birth: " + t_birth + "]," + "[regdate: " + t_regdate + "]";
	}
}
