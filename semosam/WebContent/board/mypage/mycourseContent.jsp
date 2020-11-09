<%@page import="com.semosam.dto.reviewDTO"%>
<%@page import="com.semosam.dao.reviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dto.scheduleDTO"%>
<%@page import="com.semosam.dao.scheduleDAO"%>
<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
courseDAO cDao = new courseDAO();
courseDTO course = cDao.getCourse(coursenum);
String shortAddr = course.getAddress().substring(0, 7);

scheduleDAO sDao = new scheduleDAO();
ArrayList<String> days = sDao.getMyDistinctWeekday(coursenum, id);
// 날짜 및 수업 시간 받아오기

reviewDAO rDao = new reviewDAO();
int countReview = rDao.getCountReview(coursenum);
ArrayList<reviewDTO> reviewList = rDao.getReviews(coursenum);
%>
<!DOCTYPE html>
<!-- bradcam_area_start -->
<div class="courses_details_banner">
	<div class="container">
		<div class="row">
			<div class="col-xl-6">
				<div class="course_text">
					<h3>
						<%=course.getTitle()%>
					</h3>
					<div class="prise">
						<span class="active"><%=course.getCategory()%></span>
					</div>
					<div class="rating">
						<span>후기 <%=countReview%>건
						</span>
					</div>
					<div class="hours">
						<div class="video">
							<div class="single_video">
								<table>
									<tr>
										<td align="center" style="padding-right: 10px;"><i class="ti-calendar"></i></td>
										<td><span> 
									<%
									 	if (days.size() != 0) {
									 	for (int i = 0; i < days.size(); i++) {
								    %> 
 										<%=days.get(i)%><br>
 	 								<%  	} 
									 	} else {					
									%>
  											등록된 수업 일정이 없습니다. 
  									<% } %>
										</span></td>
									</tr>
									<tr>
										<td align="center" style="padding-right: 10px;"><i class="fa fa-thumb-tack"
											aria-hidden="true"></i></td>
										<td><span><%=shortAddr%></span></td>
									</tr>
								</table>
								<input type="button" value="수강 취소하기" style="margin-top: 100px;"
									OnClick="window.location='/JSP_PROJECT/board/mypage/mycourseDelete.jsp?coursenum=<%=coursenum%>'"
									class="genric-btn primary e-large circle">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end -->
<div class="courses_details_info">
	<div class="container">
		<div class="row">
			<!-- 수업명, 수업내용 -->
			<div class="col-xl-7 col-lg-7">
				<div class="single_courses">
					<h3><%=course.getTitle()%></h3>
					<p><%=course.getContent()%></p>
				</div>
				<!-- 수업 안내사항 -->
				<div class="outline_courses_info" style="margin-top: 50px">
					<h2 class="second_title">수업 안내사항</h2>
					<div id="accordion" style="margin-top: 20px">
						<div class="card">
							<div class="card-header" id="headingOne">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapseOne" aria-expanded="false"
										aria-controls="collapseOne">
										<i class="flaticon-question"></i> 수업 관련 공지
									</button>
								</h5>
							</div>
							<div id="collapseOne" class="collapse"
								aria-labelledby="headingOne" data-parent="#accordion">
								<div class="card-body"><%=course.getNotice()%></div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapseTwo" aria-expanded="false"
										aria-controls="collapseTwo">
										<i class="flaticon-question"></i> 수업 제한 인원
									</button>
								</h5>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordion">
								<div class="card-body">
									수업은 최대
									<%=course.getMaxppl()%>명으로 진행됩니다.
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingThree">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapseThree" aria-expanded="false"
										aria-controls="collapseThree">
										<i class="flaticon-question"></i> 수업 장소
									</button>
								</h5>
							</div>
							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordion">
								<div class="card-body">
									주소
									<p><%=course.getAddress()%></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 리뷰 조회 -->
				<div class="outline_courses_info" style="margin-top: 50px">
					<h2 class="second_title"><%=course.getTeacherName()%>
						쌤 학생들의 리뷰
					</h2>
					<div id="accordion" style="margin-top: 20px">
						<div class="card">
							<div class="card-header" id="review">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapseReview" aria-expanded="false"
										aria-controls="collapseReview">
										<i class="flaticon-mark-as-favorite-star"
											style="color: orange"></i> 리뷰
									</button>
								</h5>
							</div>
							<div id="collapseReview" class="collapse"
								aria-labelledby="review" data-parent="#accordion">
								<div class="card-body">
									<%
										if (reviewList.size() > 0) {
										for (int i = 0; i < reviewList.size(); i++) {
									%>
									학생 중
									<%=i + 1%>번째 리뷰 :
									<%=reviewList.get(i).getContent()%>
									/ <b>점수 : <%=reviewList.get(i).getStarscore()%></b>
									<%
										}
									} else {
									%>
									<b>등록된 리뷰가 없습니다.</b>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-5 col-lg-5">
				<div class="courses_sidebar">
					<div class="video_thumb">
						<img
							src="<%=request.getContextPath()%>/uploadFile/<%=course.getCourseimage()%>"
							alt="">
					</div>
					<input type="button" value="리뷰 남기기" style="margin-top: 100px;"
						OnClick="window.location='/JSP_PROJECT/board/mypage/writeReview.jsp?coursenum=<%=coursenum%>'"
						class="boxed_btn">
					<!-- 
					<div class="feedback_info">
						
						<h3>리뷰 남기기<br>(수업신청한 학생만 남길 수 있음)</h3>
						
						<form action="#">
							<textarea name="" id="" cols="30" rows="10" placeholder="수업 후기를 남겨주세요."></textarea>
							<button type="submit" class="boxed_btn">평가 등록하기</button>
						</form>
					</div>
					 -->
				</div>
			</div>
		</div>
	</div>
</div>