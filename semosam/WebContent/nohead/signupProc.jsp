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
<title>회원가입 결과</title>
</head>
<body>
	<%
		memberDAO dao=new memberDAO();
		boolean result = dao.insertMember(dto);
		String msg = "회원가입에 실패 하였습니다.";
		String location = "document.referrer";
		if (result) {
			msg = "회원가입을 하였습니다.";
		}
	%>
	<script type="text/javascript">
alert("<%=msg%>");
location.href=<%=location%>;
	</script>
</body>
</html>