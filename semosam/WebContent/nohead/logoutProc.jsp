<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	session.invalidate();
%>

<script>
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.href = "<%=request.getContextPath() %>/board/index.jsp";
</script>