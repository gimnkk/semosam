<%@page import="com.semosam.dao.wishlistDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	String email = (String)session.getAttribute("idKey");
	wishlistDAO wDao = new wishlistDAO();
	int result = wDao.deleteWishlist(email, courseNum);
			
	String msg = "���� ���Ÿ� �����Ͽ����ϴ�.";
	String location = "<%=request.getContextPath() %>/board/teacher/wishlist.jsp";

	if (result == 1) {
		msg = "������ �����Ǿ����ϴ�.";
	}		
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
