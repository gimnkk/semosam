<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="cDao" class="com.semosam.dao.courseDAO" />
<jsp:useBean id="cDto" class="com.semosam.dto.courseDTO" />
<jsp:setProperty property="title" name="cDto"/>
<jsp:setProperty property="category" name="cDto"/>
<jsp:setProperty property="difficulty" name="cDto"/>
<jsp:setProperty property="maxppl" name="cDto"/>
<jsp:setProperty property="address" name="cDto"/>
<jsp:setProperty property="content" name="cDto"/>
<jsp:setProperty property="notice" name="cDto"/>
<jsp:setProperty property="coursenum" name="cDto"/>

<body>
<%
	int result = cDao.updateCourse(cDto);

	System.out.println(result);

	String msg = "�������濡 ���� �Ͽ����ϴ�.";
	String location = "javascript:history.back()";

	if (result == 1) {
		msg = "�������濡 ���� �Ͽ����ϴ�.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
</body>