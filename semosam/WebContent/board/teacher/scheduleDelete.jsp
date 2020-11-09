<%@page import="com.semosam.dao.scheduleDAO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	int serial = Integer.parseInt(request.getParameter("serial"));
	
	scheduleDAO daoS = new scheduleDAO();
	int result = daoS.deleteSchedule(courseNum, serial);
	
	String msg = "일정삭제에 실패 하였습니다.";
	String location = "/JSP_PROJECT/board/teacher/scheduleContent.jsp?coursenum=" + courseNum;

	if (result == 1) {
		msg = "일정이 삭제되었습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>