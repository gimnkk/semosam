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
		alert("���� ��û�� �Ϸ�Ǿ����ϴ�.");
		location.href = "<%=request.getContextPath() %>/board/mypage/mycourse.jsp";
	} else {
		alert("���� ������ �ߺ����� ��û�� �� �����ϴ�.");
		history.back();
	}
</script>
