package com.semosam.dto;

public class courseDTO {
	private int coursenum;
	private int memnum;
	private String title;
	private String category;
	private String difficulty;
	private int maxppl;
	private String address;
	private String content;
	private String notice;
	private String courseimage;
	private String teacherName;
	private String teacherInfo;
	private String teacherImage;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public int getMaxppl() {
		return maxppl;
	}

	public void setMaxppl(int maxppl) {
		this.maxppl = maxppl;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getCourseimage() {
		return courseimage;
	}

	public void setCourseimage(String courseimage) {
		this.courseimage = courseimage;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherInfo() {
		return teacherInfo;
	}

	public void setTeacherInfo(String teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public String getTeacherImage() {
		return teacherImage;
	}

	public void setTeacherImage(String teacherImage) {
		this.teacherImage = teacherImage;
	}

	@Override
	public String toString() {
		return "courseDTO [coursenum=" + coursenum + ", memnum=" + memnum + ", title=" + title + ", category="
				+ category + ", difficulty=" + difficulty + ", maxppl=" + maxppl + ", address=" + address + ", content="
				+ content + ", notice=" + notice + ", courseimage=" + courseimage + ", teacherName=" + teacherName
				+ ", teacherInfo=" + teacherInfo + ", teacherImage=" + teacherImage + ", getCoursenum()="
				+ getCoursenum() + ", getMemnum()=" + getMemnum() + ", getTitle()=" + getTitle() + ", getCategory()="
				+ getCategory() + ", getDifficulty()=" + getDifficulty() + ", getMaxppl()=" + getMaxppl()
				+ ", getAddress()=" + getAddress() + ", getContent()=" + getContent() + ", getNotice()=" + getNotice()
				+ ", getCourseimage()=" + getCourseimage() + ", getTeacherName()=" + getTeacherName()
				+ ", getTeacherInfo()=" + getTeacherInfo() + ", getTeacherImage()=" + getTeacherImage()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
