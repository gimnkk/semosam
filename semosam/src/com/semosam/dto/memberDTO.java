package com.semosam.dto;

import java.util.Arrays;

public class memberDTO {
	private int memnum;
	private String email;
	private String pwd;
	private String name;
	private String gender;
	private String tel;
	private String interests[];
	private String interest;

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public void setInterests(String[] interests) {

		String str = "";

		for (int i = 0; i < interests.length; i++) {
			if (i != interests.length - 1) {
				str += interests[i] + ",";
			} else {
				str += interests[i];
			}
		}
		this.interest = str;
	}

	@Override
	public String toString() {
		return "memberDTO [memnum=" + memnum + ", email=" + email + ", pwd=" + pwd + ", name="
				+ name + ", gender=" + gender + ", tel=" + tel + ", interests="
				+ Arrays.toString(interests) + ", interest=" + interest + "]";
	}
}
