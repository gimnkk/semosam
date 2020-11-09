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
	
			
	String msg = "리뷰 작성에 실패하였습니다.";
	String location = "/JSP_PROJECT/board/mypage/wishlist.jsp";

	if (result == 1) {
		msg = "리뷰가 작성되었습니다.";
	}		
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
