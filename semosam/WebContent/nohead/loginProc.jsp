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
	alert("�α��εǾ����ϴ�.");
	location.href = document.referrer;
</script>

<%
	} else {
%>
<script type="text/javascript">
	alert("�α��ο� �����Ͽ����ϴ�. ID�� ��й�ȣ�� Ȯ�����ּ���.");
	history.go(-1);
</script>

<%
	}
%>