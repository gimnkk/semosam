package com.semosam.dto;

import java.io.Serializable;
import java.sql.Date;

public class noticeDTO implements Serializable {
	private int noticeno;
	private String subject;
	private String content;
	private String regdate;

	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "noticeDTO [noticeno=" + noticeno + ", subject=" + subject + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	
	
	
}
