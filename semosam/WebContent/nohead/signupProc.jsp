<%@page import="com.semosam.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dto" class="com.semosam.dto.memberDTO" />
<jsp:setProperty property="*" name="dto" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���</title>
</head>
<body>
	<%
		memberDAO dao=new memberDAO();
		boolean result = dao.insertMember(dto);
		String msg = "ȸ�����Կ� ���� �Ͽ����ϴ�.";
		String location = "document.referrer";
		if (result) {
			msg = "ȸ�������� �Ͽ����ϴ�.";
		}
	%>
	<script type="text/javascript">
alert("<%=msg%>");
location.href=<%=location%>;
	</script>
</body>
</html>