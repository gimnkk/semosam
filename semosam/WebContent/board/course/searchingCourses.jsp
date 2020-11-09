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
	<h3>����� ����</h3>
</div>
<!-- bradcam_area_end -->

<!-- popular_courses_start -->
<div class="popular_courses plus_padding">
	<!-- �α�� ����~����ī�װ� ���� -->
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<h3>���� �˻�</h3>
				</div>
				<div class="search" align="center" style="margin-bottom: 50px;">
					<form action="/JSP_PROJECT/board/course/searchingCourses.jsp" method="get">
						<input type="search" name="search" id="search"
							placeholder="�˻�� �Է��ϼ���" style="background-color: #F6F6F6;">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		
<%	//�Ķ���Ͱ� ���� ��
	if (keyword != null) {
		System.out.println(keyword);
		ArrayList<courseDTO> searchingList = dbPro.getSearchingResults(keyword);
%>
		<!-- ���� ī�װ� -->
		<div class="row">
			<div class="col-xl-12">
				<div class="course_nav">
					<nav>
						<ul class="nav" id="myTab" role="tablist">
							
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">�˻� ���</a></li>
							
							<!-- �� ���ɻ� ī�װ� �α��� �ÿ��� Ȯ�� ���� -->
							<% if(id != null) { %>
							<li class="nav-item"><a class="nav-link" id="interest-tab"
								data-toggle="tab" href="#interest" role="tab"
								aria-controls="interest" aria-selected="false">�� ���ɻ�</a></li>
							<%} %>
							
							<li class="nav-item"><a class="nav-link" id="design-tab"
								data-toggle="tab" href="#design" role="tab"
								aria-controls="design" aria-selected="false">������</a></li>

							<li class="nav-item"><a class="nav-link" id="business-tab"
								data-toggle="tab" href="#business" role="tab"
								aria-controls="business" aria-selected="false">�ǹ�����</a></li>

							<li class="nav-item"><a class="nav-link" id="beauty-tab"
								data-toggle="tab" href="#beauty" role="tab"
								aria-controls="beauty" aria-selected="false">��Ƽ</a></li>

							<li class="nav-item"><a class="nav-link" id="video-tab"
								data-toggle="tab" href="#video" role="tab"
								aria-controls="video" aria-selected="false">����</a></li>

							<li class="nav-item"><a class="nav-link" id="language-tab"
								data-toggle="tab" href="#language" role="tab"
								aria-controls="language" aria-selected="false">�ܱ���</a></li>

							<li class="nav-item"><a class="nav-link" id="music-tab"
								data-toggle="tab" href="#music" role="tab" aria-controls="music"
								aria-selected="false">����</a></li>

							<li class="nav-item"><a class="nav-link" id="lifestyle-tab"
								data-toggle="tab" href="#lifestyle" role="tab"
								aria-controls="lifestyle" aria-selected="false">��������Ÿ��</a></li>

							<li class="nav-item"><a class="nav-link" id="Etc-tab"
								data-toggle="tab" href="#etc" role="tab" aria-controls="Etc"
								aria-selected="false">��Ÿ</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- ���� ī�װ� �� -->
	</div>
	<!-- �α�� ����~����ī�װ� �� -->
	
	<!-- ���� ���� -->
	<div class="all_courses">
		<div class="container">
			<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
				%>
				<!-- ��ü �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- ��ü �˻� ��� ��-->
				<!-- �˻� ����� ���� �� -->
						<%}} else {%>
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%}%>
				</div>
				</div>

								
				<!-- course design -->
 				<div class="tab-pane fade show" id="design" role="tabpanel" aria-labelledby="design-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("������")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
				<!-- design �� -->
				
				
 				<!-- course business -->
 				<div class="tab-pane fade show" id="business" role="tabpanel" aria-labelledby="business-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("�ǹ�����")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
				<!-- business �� -->
 				
				<!-- course beauty -->
				<div class="tab-pane fade show" id="beauty" role="tabpanel" aria-labelledby="beauty-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("��Ƽ")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- beauty �� -->
 				
				<!-- course video -->
				<div class="tab-pane fade show" id="video" role="tabpanel" aria-labelledby="video-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("����")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- video �� -->
 				
				<!-- course language -->
				<div class="tab-pane fade show" id="language" role="tabpanel" aria-labelledby="language-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("�ܱ���")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- language �� -->
 				
				<!-- course music -->
				<div class="tab-pane fade show" id="music" role="tabpanel" aria-labelledby="music-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("����")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- music �� -->
 				
				<!-- course lifestyle -->
				<div class="tab-pane fade show" id="lifestyle" role="tabpanel" aria-labelledby="lifestyle-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("��������Ÿ��")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
 				<!-- lifestyle �� -->
 				
				<!-- course etc -->
 				<div class="tab-pane fade show" id="etc" role="tabpanel" aria-labelledby="etc-tab">
					<div class="row">
				<%
					//�˻� ����� ���� ��
					if (!searchingList.isEmpty()) {
							for (int i = 0; i < searchingList.size(); i++) {
								courseDTO course = searchingList.get(i);
								if(course.getCategory().equals("��Ÿ")) {
				%>
				<!-- �˻� ��� ���� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=course.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- �˻� ��� ��-->
				
						<%}else {%>
						<!-- �˻� ��� �� �ش� ī�װ��� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%break;}}} else {%>
						<!-- �˻� ����� �ƿ� ���� �� -->
							<div align="center">
								�˻� ����� �����ϴ�.
							</div>
						<%} %>
				</div>
				</div>
				<!-- etc �� -->
				<!-- ī�װ��� ���� �� -->
			</div>
		</div>
	</div>
	<!-- ���� ���÷��� ����(ī�װ�, �����������ļ�) -->
	
	<%} else {%>
	<div align="center" style="margin: 100px;">
	<!-- �Ķ���Ͱ� �ƿ� ���� �� -->
	�˻� ����� �����ϴ�. �˻�� �Է����ּ���.
	</div>
	<%} %>
</div>
<!-- popular_courses_end-->