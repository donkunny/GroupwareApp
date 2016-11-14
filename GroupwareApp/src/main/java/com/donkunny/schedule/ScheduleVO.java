package com.donkunny.schedule;

public class ScheduleVO {

	private int sno;
	private String s_id;
	private String s_fromDate;
	private String s_toDate;
	private String s_title;
	private String s_content;
	private String s_attendee;
	private String s_place;
	private int s_type;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_fromDate() {
		return s_fromDate;
	}
	public void setS_fromDate(String s_fromDate) {
		this.s_fromDate = s_fromDate;
	}
	public String getS_toDate() {
		return s_toDate;
	}
	public void setS_toDate(String s_toDate) {
		this.s_toDate = s_toDate;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_attendee() {
		return s_attendee;
	}
	public void setS_attendee(String s_attendee) {
		this.s_attendee = s_attendee;
	}
	public String getS_place() {
		return s_place;
	}
	public void setS_place(String s_place) {
		this.s_place = s_place;
	}
	public int getS_type() {
		return s_type;
	}
	public void setS_type(int s_type) {
		this.s_type = s_type;
	}
	@Override
	public String toString() {
		return "[s_id: " + s_id + "], [s_fromDate: " + s_fromDate + "], " + "[s_toDate: " + s_toDate
				+ "], [s_content: " + s_content + "], [s_attenee: " + s_attendee + "], [s_place: " +
				s_place + "], [s_type: " + s_type + "]";
	}
}
