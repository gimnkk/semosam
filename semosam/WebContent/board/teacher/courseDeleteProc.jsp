<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	courseDAO daoC = new courseDAO();
	int result = daoC.deleteCourse(courseNum);

	String msg = "수업삭제에 실패 하였습니다.";
	String location = "/JSP_PROJECT/board/teacher/teacherContent.jsp";

	if (result == 1) {
		msg = "수업이 삭제되었습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
