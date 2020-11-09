<%@page import="com.semosam.dto.noticeDTO"%>
<%@page import="com.semosam.dao.noticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");

	int pageSize = 5;
	String category = request.getParameter("category");
	String sentence = request.getParameter("sentence");
	if (request.getParameter("pageNum") == null) {
		session.setAttribute("pageNum", "1");
	} else {
		session.setAttribute("pageNum", request.getParameter("pageNum"));
	}
	
	String pageNum= (String)session.getAttribute("pageNum");
	
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List articleList = null;
	noticeDAO dbPro = noticeDAO.getInstance();
	count = dbPro.getArticleCount(category, sentence);
	if (count > 0) {
		articleList = dbPro.getArticles(startRow, endRow, category, sentence);
	}
	number = count - (currentPage - 1) * pageSize;
%>
<style>
	#block {
		padding : 10px 0;
	}
	
	.table {
		margin : 200px 100px 50px 100px;
		align : center;
		width : 90%;
		
	}
</style>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>공지사항</h3>
</div>
<%
	if (count == 0) {
%>
<table class="table" width="700">
	<tr>
		<td align="center">공지사항에 저장된 글이 없습니다.</td>
	</tr>
</table>
<%
	} else {
%>
<table class="table">
	<tr class="our_courses">
		<td align="center" width="50">번호</td>
		<td align="center" width="46" >제목</td>
		<td align="center" width="150">내용</td>
		<td align="center" width="150">작성일</td>
	</tr>
	<%
		for (int i = 0; i < articleList.size(); i++) {
				noticeDTO article = (noticeDTO) articleList.get(i);
	%>
	<tr height="30">
		<td align="center" width="50"><%=article.getNoticeno()%></td>
		<td align="center" width="50"><%=article.getSubject()%></td>
		<td align="center" width="100"><%=article.getContent()%></td>
		<td align="center" width="150"><%=article.getRegdate()%></td>
	</tr>
	<%
		}
	%>
</table>
<%
	}
%>
<div style="margin-bottom: 50px;"  align="center">
	<%
		int bottomLine = 3;
		if (count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
			int endPage = startPage + bottomLine - 1;
			if (endPage > pageCount)
				endPage = pageCount;
			if (startPage > bottomLine) {
	%>
	<a href="notice.jsp?pageNum=<%=startPage - bottomLine%>">[이전]</a>
	<%
		}
	%>
	<%
		for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="notice.jsp?pageNum=<%=i%>">
		<%
			if (i != currentPage)
						out.print("[" + i + "]");
					else 
						out.print("<font color='red'>[" + i + "]</font>");
					
		%>
	</a>
	<%
		}
			if (endPage < pageCount) {
	%>
	<a href="notice.jsp?pageNum=<%=startPage + bottomLine%>">[다음]</a>
	<%
		}
		}
	%>
	
	<div>
		<div style="margin: 50px 0px;" align="center">
			<form name="searchForm" method="post">
				<select name="category" size="1">
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
				
				<input size="16" name="sentence">
				<input type="submit" value="찾기">
				<input type="hidden" name="nowPage" value="1">
			</form>
		</div>
	</div>
</div>
</body>
</html>