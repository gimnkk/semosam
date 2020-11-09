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
	<h3>내프로필</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="">
			<div class="col-xl-8 col-lg-8 col-md-8" id="myprofile">
				<form action="/JSP_PROJECT/board/mypage/myprofileProc.jsp" method="post">
					<div id="myprofile">
						<h3 class="mb-30">내정보</h3>
						<div class="mt-10">
							<p>E-MAIL</p>
							<input type="hidden" name="email" value="<%=dto.getEmail()%>"><%=dto.getEmail()%>
						</div>
						<br />
						<div class="mt-10">
							<p>비밀번호</p>
							<input type="password" name="pwd" value="<%=dto.getPwd()%>" required class="single-input">
						</div>
						<br />
						<div class="mt-10">
							<p>이름</p>
							<input type="text" name="name" value="<%=dto.getName()%>" required class="single-input">
						</div>
						<br />
						<div class="mt-10">
							<p>성별</p>
							남자
							<input type="radio" name="gender" value="male" <%=dto.getGender().equals("male") ? "checked" : ""%>>
							&nbsp; 여자
							<input type="radio" name="gender" value="female" <%=dto.getGender().equals("female") ? "checked" : ""%>>
							&nbsp;
						</div>
						<br />
						<div class="mt-10">
							<p>연락처</p>
							<input type="text" name="tel" value="<%=dto.getTel()%>" required class="single-input">
						</div>
						<br />
						<div class="mt-10">
							<p>관심분야</p>
							디자인
							<input type="checkbox" name="interests" value="디자인" <%=dto.getInterest().contains("디자인") ? "checked" : ""%>>
							&nbsp; 실무역량
							<input type="checkbox" name="interests" value="실무역량" <%=dto.getInterest().contains("실무역량") ? "checked" : ""%>>
							&nbsp; 뷰티
							<input type="checkbox" name="interests" value="뷰티" <%=dto.getInterest().contains("뷰티") ? "checked" : ""%>>
							&nbsp; 영상
							<input type="checkbox" name="interests" value="영상" <%=dto.getInterest().contains("영상") ? "checked" : ""%>>
							&nbsp; 외국어
							<input type="checkbox" name="interests" value="외국어" <%=dto.getInterest().contains("외국어") ? "checked" : ""%>>
							&nbsp; 음악
							<input type="checkbox" name="interests" value="음악" <%=dto.getInterest().contains("음악") ? "checked" : ""%>>
							&nbsp; 라이프스타일
							<input type="checkbox" name="interests" value="라이프스타일" <%=dto.getInterest().contains("라이프스타일") ? "checked" : ""%>>
							&nbsp; 기타
							<input type="checkbox" name="interests" value="기타" <%=dto.getInterest().contains("기타") ? "checked" : ""%>>
							&nbsp;
						</div>
						<br />
					</div>
					<br />
					<button type="submit" value="프로필 수정" class="boxed_btn_orange">프로필 수정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" value="회원 탈퇴" class="boxed_btn_orange" value="withdraw"
						OnClick="window.location='/JSP_PROJECT/board/mypage/withdraw.jsp?email=<%=dto.getEmail()%>'"
					>회원 탈퇴</button>
				</form>
			</div>
		</div>
	</div>
</div>
