<%@page import="com.semosam.dto.noticeDTO"%>
<%@page import="com.semosam.dao.noticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	try {
		noticeDAO dbPro = noticeDAO.getInstance();
		noticeDTO article = dbPro.getArticle(noticeno);
%>
<html>

<body>
	<br>
	<br>
	<b>글내용 보기</b>
	<div class="container">
		<table class="w3-table-all" style="width: 80%;">
			<tr height="30">
				<td width="125" align="center">글번호</td>
				<td width="125" align="center">
					<%=article.getNoticeno()%></td>
			</tr>
			
			<tr height="30">
				<td width="125" align="center">글제목</td>
				<td align="center" width="375" colspan="3">
					<%=article.getSubject()%></td>
			</tr>
			<tr height="30">
				<td width="125" align="center">글내용</td>
				<td align="left" width="375" colspan="3">
					<pre>
			<%=article.getContent()%></pre>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" class="w3-center">
					<input type="button" value="글목록" onclick="document.location.href='notice.jsp'">
				</td>
			</tr>
		</table>
		<%
			} catch (Exception e) {
			}
		%>
	</div>
</body>
</html>
