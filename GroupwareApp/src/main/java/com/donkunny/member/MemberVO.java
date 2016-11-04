package com.donkunny.member;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String pwd;
	private String pwd_confirm;
	private String name;
	private String email;
	private String tel;
	private String birth;
	private int grade;
	private Date regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd_confirm() {
		return pwd_confirm;
	}
	public void setPwd_confirm(String pwd_confirm) {
		this.pwd_confirm = pwd_confirm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return 
				" [id: " + id + "]," + " [pwd: " + pwd + "]," 
				+ " [name: " + name + "]," + " [email: " + email + "]," + " [tel" + tel + "],"
				+ " [birth: " + birth + "]," + " [grade: " + grade + "]," + "[regdate: " + regdate + "]";
	}
	
}
