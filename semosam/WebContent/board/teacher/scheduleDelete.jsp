<%@page import="com.semosam.dao.scheduleDAO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	int serial = Integer.parseInt(request.getParameter("serial"));
	
	scheduleDAO daoS = new scheduleDAO();
	int result = daoS.deleteSchedule(courseNum, serial);
	
	String msg = "���������� ���� �Ͽ����ϴ�.";
	String location = "<%=request.getContextPath() %>/board/teacher/scheduleContent.jsp?coursenum=" + courseNum;

	if (result == 1) {
		msg = "������ �����Ǿ����ϴ�.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>