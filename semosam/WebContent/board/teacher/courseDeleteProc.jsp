<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	courseDAO daoC = new courseDAO();
	int result = daoC.deleteCourse(courseNum);

	String msg = "���������� ���� �Ͽ����ϴ�.";
	String location = "<%=request.getContextPath() %>/board/teacher/teacherContent.jsp";

	if (result == 1) {
		msg = "������ �����Ǿ����ϴ�.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
