package com.semosam.dto;

public class reviewDTO {
	private int reviewnum;
	private int coursenum;
	private int memnum;
	private String content;
	private String regdate;
	private double starscore;
	
	
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int review) {
		this.reviewnum = review;
	}
	public int getCoursenum() {
		return coursenum;
	}
	public void setCoursenum(int coursenum) {
		this.coursenum = coursenum;
	}
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
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
	public double getStarscore() {
		return starscore;
	}
	public void setStarscore(double starscore) {
		this.starscore = starscore;
	}
	
	
}
