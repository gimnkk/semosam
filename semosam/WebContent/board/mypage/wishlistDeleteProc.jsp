<%@page import="com.semosam.dao.wishlistDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	String email = (String)session.getAttribute("idKey");
	wishlistDAO wDao = new wishlistDAO();
	int result = wDao.deleteWishlist(email, courseNum);
			
	String msg = "찜목록 제거를 실패하였습니다.";
	String location = "/JSP_PROJECT/board/teacher/wishlist.jsp";

	if (result == 1) {
		msg = "찜목록이 삭제되었습니다.";
	}		
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
