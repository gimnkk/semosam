<%@page import="com.semosam.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("EUC-KR");

	String email = request.getParameter("email");

	memberDAO dao = new memberDAO();
	boolean result = dao.checkId(email);

	if (result) {
%>

<div class="alert alert-danger" id="idSuccess">이미 사용중인 이메일입니다.</div>

<%
	} else {
%>

<div class="alert alert-success" id="idSuccess">사용가능한 이메일입니다.</div>

<%
	}
%>

