<%@page import="com.semosam.dao.applicantDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String email = (String) session.getAttribute("idKey");

	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	int serial = Integer.parseInt(request.getParameter("serial"));
	applicantDAO Adao = new applicantDAO();
	int result = Adao.deleteMyCourses(coursenum, serial);
	
	String msg="���� ��ҿ� �����Ͽ����ϴ�.";
	String location = request.getContextPath()+"/board/mypage/mycourse.jsp";
	
	if(result==1){
		msg="���� ��ҵǾ����ϴ�.";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>