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

<div class="alert alert-danger" id="idSuccess">�̹� ������� �̸����Դϴ�.</div>

<%
	} else {
%>

<div class="alert alert-success" id="idSuccess">��밡���� �̸����Դϴ�.</div>

<%
	}
%>

