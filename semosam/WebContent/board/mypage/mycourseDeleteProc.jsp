<%@page import="com.semosam.dao.applicantDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String email = (String) session.getAttribute("idKey");

	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	int serial = Integer.parseInt(request.getParameter("serial"));
	applicantDAO Adao = new applicantDAO();
	int result = Adao.deleteMyCourses(coursenum, serial);
	
	String msg="수강 취소에 실패하였습니다.";
	String location = "/JSP_PROJECT/board/mypage/mycourse.jsp";
	
	if(result==1){
		msg="수강 취소되었습니다.";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>