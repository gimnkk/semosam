<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mdao" class="com.semosam.dao.memberDAO" />
<jsp:useBean id="dto" class="com.semosam.dto.memberDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	request.setCharacterEncoding("EUC-KR"); 

	boolean result = mdao.updateMember(dto);
	String msg = "회원수정에 실패 하였습니다.";
	String location = "/JSP_PROJECT/board/mypage/myprofile.jsp";

	if (result==true) {
		msg = "회원수정에 성공 하였습니다.";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>
