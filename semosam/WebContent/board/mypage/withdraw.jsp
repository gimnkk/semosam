<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="com.semosam.dao.memberDAO"%>
<%@page import="com.semosam.dto.memberDTO"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = (String) session.getAttribute("idKey");

%>
<!DOCTYPE html>
<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>ȸ�� Ż��</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="col-xl-8 col-lg-8 col-md-8" id="withdraw">
				<form action="/JSP_PROJECT/board/mypage/withdrawProc.jsp" method="post">
					<div id="withdraw">
						<h3 class="mb-30">ȸ�� Ż��</h3>
						<div class="mt-10">
							<p>��й�ȣ�� �Է����ּ���</p>
							<input type="password" name="pwd" required class="single-input">
							<input type="hidden" name="email" value="<%=email %>">
						</div>
					</div>
					<br />
					<button type="submit" value="Ż���ϱ�" class="boxed_btn_orange">Ż���ϱ�</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" value="�ڷΰ���"  class="boxed_btn_orange"OnClick="window.location='/JSP_PROJECT/board/mypage/myprofile.jsp'">
						�ڷΰ���</button>
				</form>
			</div>
		</div>
	</div>
</div>
