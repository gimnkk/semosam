<%@page import="com.semosam.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");

	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");

	memberDAO dao = new memberDAO();
	boolean result = dao.login(email, pwd);
	if (result) {
		session.setAttribute("idKey", email);
%>
<script type="text/javascript">
	alert("로그인되었습니다.");
	location.href = document.referrer;
</script>

<%
	} else {
%>
<script type="text/javascript">
	alert("로그인에 실패하였습니다. ID와 비밀번호를 확인해주세요.");
	history.go(-1);
</script>

<%
	}
%>