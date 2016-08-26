package com.donkunny.member.login;

/**
 * 화면에서 전달하는 데이터를 수집하는 클래스
 * @author donkunny
 *
 */
public class LoginDTO {

	private String id;
	private String pwd;
	
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
	
	@Override
	public String toString() {
		return "[id: " + id + "], [pwd: " + pwd + "]";
	}
	
}
