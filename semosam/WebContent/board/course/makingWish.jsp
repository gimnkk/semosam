<%@page import="com.semosam.dao.wishlistDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int memnum = Integer.parseInt(request.getParameter("memnum"));
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	
	wishlistDAO wDao = new wishlistDAO();
	
	int result = wDao.addWishlist(memnum, coursenum);
%>
<body>
	<%
		String msg = "이미 추가된 강의입니다.";
		String location = "javascript:history.back()";
		if (result == 1) {
			msg = "찜목록에 추가되었습니다.";
			location = "/JSP_PROJECT/board/mypage/wishlist.jsp";
		}
	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href =	'<%=location%>';
	</script>
</body>
</html>