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
		String msg = "�̹� �߰��� �����Դϴ�.";
		String location = "javascript:history.back()";
		if (result == 1) {
			msg = "���Ͽ� �߰��Ǿ����ϴ�.";
			location = request.getContextPath()+"/board/mypage/wishlist.jsp";
		}
	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href =	'<%=location%>';
	</script>
</body>
</html>