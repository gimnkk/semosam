package com.semosam.dto;

public class teacherDTO {
	private int memnum;
	private String teacherimage;
	private String teacherinfo;

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public String getTeacherimage() {
		return teacherimage;
	}

	public void setTeacherimage(String teacherimage) {
		this.teacherimage = teacherimage;
	}

	public String getTeacherinfo() {
		return teacherinfo;
	}

	public void setTeacherinfo(String teacherinfo) {
		this.teacherinfo = teacherinfo;
	}

	@Override
	public String toString() {
		return "teacherDTO [memnum=" + memnum + ", teacherimage=" + teacherimage + ", teacherinfo="
				+ teacherinfo + "]";
	}

}