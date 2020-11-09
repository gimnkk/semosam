<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="com.semosam.dao.memberDAO"%>
<%@page import="com.semosam.dto.memberDTO"%>
<%
	request.setCharacterEncoding("EUC-KR");
	
	memberDAO mdao = new memberDAO();
	String email = (String) session.getAttribute("idKey");
	memberDTO dto = mdao.getMember(email);
%>
<!DOCTYPE html>
<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>��������</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="">
			<div class="col-xl-8 col-lg-8 col-md-8" id="myprofile">
				<form action="/JSP_PROJECT/board/mypage/myprofileProc.jsp" method="post">
					<div id="myprofile">
						<h3 class="mb-30">������</h3>
						<div class="mt-10">
							<p>E-MAIL</p>
							<input type="hidden" name="email" value="<%=dto.getEmail()%>"><%=dto.getEmail()%>
						</div>
						<br />
						<div class="mt-10">
							<p>��й�ȣ</p>
							<input type="password" name="pwd" value="<%=dto.getPwd()%>" required class="single-input">
						</div>
						<br />
						<div class="mt-10">
							<p>�̸�</p>
							<input type="text" name="name" value="<%=dto.getName()%>" required class="single-input">
						</div>
						<br />
						<div class="mt-10">
							<p>����</p>
							����
							<input type="radio" name="gender" value="male" <%=dto.getGender().equals("male") ? "checked" : ""%>>
							&nbsp; ����
							<input type="radio" name="gender" value="female" <%=dto.getGender().equals("female") ? "checked" : ""%>>
							&nbsp;
						</div>
						<br />
						<div class="mt-10">
							<p>����ó</p>
							<input type="text" name="tel" value="<%=dto.getTel()%>" required class="single-input">
						</div>
						<br />
						<div class="mt-10">
							<p>���ɺо�</p>
							������
							<input type="checkbox" name="interests" value="������" <%=dto.getInterest().contains("������") ? "checked" : ""%>>
							&nbsp; �ǹ�����
							<input type="checkbox" name="interests" value="�ǹ�����" <%=dto.getInterest().contains("�ǹ�����") ? "checked" : ""%>>
							&nbsp; ��Ƽ
							<input type="checkbox" name="interests" value="��Ƽ" <%=dto.getInterest().contains("��Ƽ") ? "checked" : ""%>>
							&nbsp; ����
							<input type="checkbox" name="interests" value="����" <%=dto.getInterest().contains("����") ? "checked" : ""%>>
							&nbsp; �ܱ���
							<input type="checkbox" name="interests" value="�ܱ���" <%=dto.getInterest().contains("�ܱ���") ? "checked" : ""%>>
							&nbsp; ����
							<input type="checkbox" name="interests" value="����" <%=dto.getInterest().contains("����") ? "checked" : ""%>>
							&nbsp; ��������Ÿ��
							<input type="checkbox" name="interests" value="��������Ÿ��" <%=dto.getInterest().contains("��������Ÿ��") ? "checked" : ""%>>
							&nbsp; ��Ÿ
							<input type="checkbox" name="interests" value="��Ÿ" <%=dto.getInterest().contains("��Ÿ") ? "checked" : ""%>>
							&nbsp;
						</div>
						<br />
					</div>
					<br />
					<button type="submit" value="������ ����" class="boxed_btn_orange">������ ����</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" value="ȸ�� Ż��" class="boxed_btn_orange" value="withdraw"
						OnClick="window.location='/JSP_PROJECT/board/mypage/withdraw.jsp?email=<%=dto.getEmail()%>'"
					>ȸ�� Ż��</button>
				</form>
			</div>
		</div>
	</div>
</div>
