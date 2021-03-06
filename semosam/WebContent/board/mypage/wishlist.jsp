<%@page import="com.semosam.dto.applicantDTO"%>
<%@page import="com.semosam.dao.applicantDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dao.memberDAO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.scheduleDAO"%>
<%@page import="com.semosam.dto.scheduleDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String email = (String) session.getAttribute("idKey");
	courseDAO Cdao = new courseDAO();
	ArrayList<courseDTO> MyWish = Cdao.getMyCourses(email);
%>
<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>찜 목록</h3>
</div>
<!-- bradcam_area_end -->
<!-- popular_courses_start -->
<div class="popular_courses plus_padding">
	<!-- 인기쌤 수업~수업카테고리 -->
	<div class="container">
		<!-- 수업 카테고리 -->
		<div class="row">
			<div class="col-xl-12">
				<div class="course_nav">
					<nav>
						<ul class="nav" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
									aria-controls="home" aria-selected="true"
								>찜목록</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- 수업 카테고리 끝 -->
	</div>
	<!-- 인기쌤 수업~수업카테고리 끝 -->
	<div class="all_courses">
		<div class="container">
			<div class="tab-content" id="myTabContent">
				<!-- 모든 수업 시작 -->
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="row">
						<!-- course All -->
						<%
							if (MyWish != null && !MyWish.isEmpty()) {
								for (int i = 0; i < MyWish.size(); i++) {
									courseDTO dto = MyWish.get(i);
						%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="<%=request.getContextPath() %>/board/course/course_details.jsp?coursenum=<%=dto.getCoursenum()%>">
										<img src="<%=request.getContextPath()%>/uploadFile/<%=dto.getCourseimage()%>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=dto.getCategory()%> [<%=dto.getDifficulty()%>]</span>
									<h3>
										<a href="<%=request.getContextPath() %>/board/course/course_details.jsp?coursenum=<%=dto.getCoursenum()%>">
											<%=dto.getTitle()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="<%=request.getContextPath()%>/board/teacher/wishlistDeleteProc.jsp?coursenum=" + <%=dto.getCoursenum()%>
											class="genric-btn warning circle" >찜삭제</a>
											
											<br>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(4.5)</span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=dto.getTeacherName()%> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%
									}
								} else {%>
							<tr>
								<td align="center">찜한 수업이 존재하지 않습니다. 수업메뉴에서 찜하기를 이용해보세요.</td>
							</tr>
						<%} %>
						<!-- course All-->
						<!-- <div class="col-xl-12">
							<div class="more_courses text-center">
								<a href="#" class="boxed_btn_rev">More Courses</a>
							</div>
						</div> -->
					</div>
				</div>
				<!-- 모든 수업 끝 -->
			</div>
		</div>
	</div>
</div>
<!-- popular_courses_end-->