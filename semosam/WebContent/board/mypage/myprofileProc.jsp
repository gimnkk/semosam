<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mdao" class="com.semosam.dao.memberDAO" />
<jsp:useBean id="dto" class="com.semosam.dto.memberDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	request.setCharacterEncoding("EUC-KR"); 

	boolean result = mdao.updateMember(dto);
	String msg = "ȸ�������� ���� �Ͽ����ϴ�.";
	String location = "<%=request.getContextPath() %>/board/mypage/myprofile.jsp";

	if (result==true) {
		msg = "ȸ�������� ���� �Ͽ����ϴ�.";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>
