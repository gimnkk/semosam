<%@page import="com.semosam.dto.scheduleDTO"%>
<%@page import="com.semosam.dao.scheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	scheduleDAO daoS = new scheduleDAO();
	scheduleDTO dto = new scheduleDTO();
	
	String day = request.getParameter("date") + " " + request.getParameter("time");
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	dto.setCoursenum(coursenum);
	dto.setDay(day);
	dto.setRuntime(Integer.parseInt(request.getParameter("runtime")));
	
	int result = daoS.addSchedule(dto);
	
%>
<body>
	<%
		String msg = "������Ͽ� ���� �Ͽ����ϴ�.";
		String location = "javascript:history.back()";
		if (result == 1) {
			msg = "��������� �Ͽ����ϴ�.";
			location = "<%=request.getContextPath() %>/board/teacher/scheduleContent.jsp?coursenum=" + coursenum;
		}
	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href =	'<%=location%>';
	</script>
</body>
</html>