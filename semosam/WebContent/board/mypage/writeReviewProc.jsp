<%@page import="com.semosam.dao.reviewDAO"%>
<%@page import="com.semosam.dao.wishlistDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	String email = (String)session.getAttribute("idKey");
	String content = request.getParameter("content");
	double starscore = Double.parseDouble(request.getParameter("starscore"));
	reviewDAO rDao = new reviewDAO();
	int result = rDao.insertReview(content, starscore, courseNum, email);
	
			
	String msg = "���� �ۼ��� �����Ͽ����ϴ�.";
	String location = "<%=request.getContextPath() %>/board/mypage/wishlist.jsp";

	if (result == 1) {
		msg = "���䰡 �ۼ��Ǿ����ϴ�.";
	}		
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
