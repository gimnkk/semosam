<%@page import="com.semosam.dao.applicantDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	applicantDAO aDao = new applicantDAO();
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	int serial = Integer.parseInt(request.getParameter("serial"));
	boolean flag = aDao.insertApplicant(coursenum, serial, id);
	
	
%>
<script type="text/javascript">
		
	if(<%=flag%>) {
		alert("수업 신청이 완료되었습니다.");
		location.href = "/JSP_PROJECT/board/mypage/mycourse.jsp";
	} else {
		alert("같은 일정을 중복으로 신청할 수 없습니다.");
		history.back();
	}
</script>
