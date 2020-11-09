<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@page import="com.semosam.dto.courseDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	courseDAO dbPro = new courseDAO();
	/* courseDTO bean = dbPro.getCourses(); */
	/* Vector<courseDTO> courseList = dbPro.getCourseList(); */
%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>세모쌤 수업</h3>
</div>
<!-- bradcam_area_end -->

<!-- popular_courses_start -->
<div class="popular_courses plus_padding">
	<!-- 인기쌤 수업~수업카테고리 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<h3>인기쌤 수업</h3>
					<p style="font: 'gulim'; ">
						지금 세모쌤에서 가장 인기있는 선생님을 만나보세요!
					</p>
				</div>
			</div>
		</div>
		<!-- 수업 카테고리 -->
		<div class="row">
			<div class="col-xl-12">
				<div class="course_nav">
					<nav>
						<ul class="nav" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">모든 수업</a></li>
							
							<!-- 로그인 시에만 확인 가능 -->
							<% if(id != null) { %>
							<li class="nav-item"><a class="nav-link" id="interest-tab"
								data-toggle="tab" href="#interest" role="tab"
								aria-controls="interest" aria-selected="false">내 관심사</a></li>
							<%} %>
							
							<li class="nav-item"><a class="nav-link" id="design-tab"
								data-toggle="tab" href="#design" role="tab"
								aria-controls="design" aria-selected="false">디자인</a></li>

							<li class="nav-item"><a class="nav-link" id="business-tab"
								data-toggle="tab" href="#business" role="tab"
								aria-controls="business" aria-selected="false">실무역량</a></li>

							<li class="nav-item"><a class="nav-link" id="beauty-tab"
								data-toggle="tab" href="#beauty" role="tab"
								aria-controls="beauty" aria-selected="false">뷰티</a></li>

							<li class="nav-item"><a class="nav-link" id="video-tab"
								data-toggle="tab" href="#video" role="tab"
								aria-controls="video" aria-selected="false">영상</a></li>

							<li class="nav-item"><a class="nav-link" id="language-tab"
								data-toggle="tab" href="#language" role="tab"
								aria-controls="language" aria-selected="false">외국어</a></li>

							<li class="nav-item"><a class="nav-link" id="music-tab"
								data-toggle="tab" href="#music" role="tab" aria-controls="music"
								aria-selected="false">음악</a></li>

							<li class="nav-item"><a class="nav-link" id="lifestyle-tab"
								data-toggle="tab" href="#lifestyle" role="tab"
								aria-controls="lifestyle" aria-selected="false">라이프스타일</a></li>

							<li class="nav-item"><a class="nav-link" id="Etc-tab"
								data-toggle="tab" href="#Etc" role="tab" aria-controls="Etc"
								aria-selected="false">기타</a></li>

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
					
					<!-- DB course -->
<%-- 					<% for(int i = 0; i < courseList.size(); i++) {
						courseDTO course = courseList.get(i);
					%>
					
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %></span>
									<h3>
										<a href="course_details.jsp"><%=course.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(4.5)</span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%} %> --%>
						<!-- DB course -->
						
						<!-- 임시 레이어 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="course_details.jsp"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>카테고리</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="course_details.jsp"> <img src="<%=request.getContextPath() %>/uploadFile/2.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>카테고리</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="course_details.jsp"> <img src="<%=request.getContextPath() %>/uploadFile/3.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>카테고리</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 임시 레이어 -->
					<!-- <div class="col-xl-12">
							<div class="more_courses text-center">
								<a href="#" class="boxed_btn_rev">More Courses</a>
							</div>
						</div> -->
						
					</div>
				</div>
				<!-- 모든 수업 끝 -->
				
				<!-- 내 관심사 시작 -->
				<div class="tab-pane fade" id="interest" role="tabpanel" aria-labelledby="interest-tab">
					<div class="row">
					
					<!-- DB course -->
<%-- 					<% for(int i = 0; i < courseList.size(); i++) {
						courseDTO course = courseList.get(i);
					%>
					
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %></span>
									<h3>
										<a href="course_details.jsp"><%=course.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(4.5)</span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%} %> --%>
						<!-- DB course -->
						
						<!-- 임시 레이어 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="course_details.jsp"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>카테고리(관심사)</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>카테고리(관심사)</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>카테고리(관심사)</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 임시 레이어 -->
					<!-- <div class="col-xl-12">
							<div class="more_courses text-center">
								<a href="#" class="boxed_btn_rev">More Courses</a>
							</div>
						</div> -->
						
					</div>
				</div>
				<!-- 내 관심사 끝 -->
					
					
				<div class="tab-pane fade" id="design" role="tabpanel" aria-labelledby="design-tab">
					<div class="row">
											<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>디자인</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="business" role="tabpanel" aria-labelledby="business-tab">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>실무역량</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="beauty" role="tabpanel" aria-labelledby="beauty-tab">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>뷰티</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="video" role="tabpanel" aria-labelledby="video-tab">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>영상</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="language" role="tabpanel" aria-labelledby="language-tab">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>외국어</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="music" role="tabpanel" aria-labelledby="music">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>음악</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="lifestyle" role="tabpanel" aria-labelledby="lifestyle">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>라이프스타일</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="Etc" role="tabpanel" aria-labelledby="Etc">
					<div class="row">
												<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>기타</span>
									<h3>
										<a href="course_details.jsp">수업명</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(평균별점)</span>
										</div>
										<div class="prise">
											<span class="active_prise">누구누구 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 카테고리별 수업 끝 -->
			</div>
		</div>
	</div>
</div>
<!-- popular_courses_end-->