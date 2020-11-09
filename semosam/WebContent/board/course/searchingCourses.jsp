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
	String keyword = request.getParameter("search");
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
					<h3>수업 검색</h3>
				</div>
				<div class="search" align="center" style="margin-bottom: 50px;">
					<form action="/JSP_PROJECT/board/course/searchingCourses.jsp" method="get">
						<input type="search" name="search" id="search"
							placeholder="검색어를 입력하세요" style="background-color: #F6F6F6;">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		
<%	//파라미터가 있을 때
	if (keyword != null) {
		System.out.println(keyword);
		ArrayList<courseDTO> searchingList = dbPro.getSearchingResults(keyword);
%>
		<!-- 수업 카테고리 -->
		<div class="row">
			<div class="col-xl-12">
				<div class="course_nav">
					<nav>
						<ul class="nav" id="myTab" role="tablist">
							
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">검색 결과</a></li>
							
							<!-- 내 관심사 카테고리 로그인 시에만 확인 가능 -->
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
								data-toggle="tab" href="#etc" role="tab" aria-controls="Etc"
								aria-selected="false">기타</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- 수업 카테고리 끝 -->
	</div>
	<!-- 인기쌤 수업~수업카테고리 끝 -->
	
	<!-- 수업 영역 -->
	<div class="all_courses">
		<div class="container">
			<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
				%>
				<!-- 전체 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 전체 검색 결과 끝-->
				<!-- 검색 결과가 없을 때 -->
						<%}} else {%>
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%}%>
				</div>
				</div>

								
				<!-- course design -->
 				<div class="tab-pane fade show" id="design" role="tabpanel" aria-labelledby="design-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("디자인")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
				<!-- design 끝 -->
				
				
 				<!-- course business -->
 				<div class="tab-pane fade show" id="business" role="tabpanel" aria-labelledby="business-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("실무역량")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
				<!-- business 끝 -->
 				
				<!-- course beauty -->
				<div class="tab-pane fade show" id="beauty" role="tabpanel" aria-labelledby="beauty-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("뷰티")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- beauty 끝 -->
 				
				<!-- course video -->
				<div class="tab-pane fade show" id="video" role="tabpanel" aria-labelledby="video-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("영상")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- video 끝 -->
 				
				<!-- course language -->
				<div class="tab-pane fade show" id="language" role="tabpanel" aria-labelledby="language-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("외국어")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- language 끝 -->
 				
				<!-- course music -->
				<div class="tab-pane fade show" id="music" role="tabpanel" aria-labelledby="music-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("음악")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- music 끝 -->
 				
				<!-- course lifestyle -->
				<div class="tab-pane fade show" id="lifestyle" role="tabpanel" aria-labelledby="lifestyle-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("라이프스타일")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- lifestyle 끝 -->
 				
				<!-- course etc -->
 				<div class="tab-pane fade show" id="etc" role="tabpanel" aria-labelledby="etc-tab">
					<div class="row">
				<%
					//검색 결과가 있을 때
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("기타")) {
				%>
				<!-- 검색 결과 시작 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- 수업 이미지 -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- 수업 내용 -->
								<div class="courses_info">
									<span><%=course.getCategory() %> [<%=course.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
										<%=course.getTitle() %>
										</a>
									</h3>
									
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
										<%String shortAddr = course.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=course.getTeacherName() %> 쌤</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- 검색 결과 끝-->
				
						<%}else {%>
						<!-- 검색 결과 중 해당 카테고리가 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%break;}}} else {%>
						<!-- 검색 결과가 아예 없을 때 -->
							<div align="center">
								검색 결과가 없습니다.
							</div>
						<%} %>
				</div>
				</div>
				<!-- etc 끝 -->
				<!-- 카테고리별 수업 끝 -->
			</div>
		</div>
	</div>
	<!-- 수업 디스플레이 역영(카테고리, 하위영역합쳐서) -->
	
	<%} else {%>
	<div align="center" style="margin: 100px;">
	<!-- 파라미터가 아예 없을 때 -->
	검색 결과가 없습니다. 검색어를 입력해주세요.
	</div>
	<%} %>
</div>
<!-- popular_courses_end-->