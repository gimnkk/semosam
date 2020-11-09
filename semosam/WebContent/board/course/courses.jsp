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
		<!-- ���� ī�װ� -->
		<div class="row">
			<div class="col-xl-12">
				<div class="course_nav">
					<nav>
						<ul class="nav" id="myTab" role="tablist">
							
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">��� ����</a></li>
							
							<!-- �� ���ɻ� ī�װ� �α��� �ÿ��� Ȯ�� ���� -->
							<% 
							if(id != null) { %>
							<li class="nav-item"><a class="nav-link" id="interest-tab"
								data-toggle="tab" href="#interest"  role="tab"
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
	
	
	<div class="all_courses">
		<div class="container">
			<div class="tab-content" id="myTabContent">
			
			<!-- ��� ���� ���� -->
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="row">
					
					<!-- course All -->
 					<% 
 						ArrayList<courseDTO> courseAll = dbPro.getCourseList("%%");
 						if(courseAll != null) {
 						for(int i = 0; i < courseAll.size(); i++) {
						courseDTO course = courseAll.get(i);
					%>
					
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
						<%}} %>
						<!-- course All-->
						
						
					<!-- <div class="col-xl-12">
							<div class="more_courses text-center">
								<a href="#" class="boxed_btn_rev">More Courses</a>
							</div>
						</div> -->
						
					</div>
				</div>
				<!-- ��� ���� �� -->
				
				<!-- �� ���ɻ� ���� -->
				<%if(id!=null){ %>
				<div class="tab-pane fade" id="interest" role="tabpanel" aria-labelledby="interest-tab">
					<div class="row">
					
					<!-- DB course -->
 					<% 
 						ArrayList<courseDTO> interestList = dbPro.getInterestsCourses(id);
 						if(interestList != null) {
 						for(int i = 0; i < interestList.size(); i++) {
						courseDTO course = interestList.get(i);
					%>
					
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
						<% }} else { %>
						<div style="text-align: center;">
							�� ���ɻ翡 �´� ������ �������� �ʽ��ϴ�.
						</div>
						<%
							}
						%>
					</div>
					</div>
					<%} %>
				<!-- �� ���ɻ� �� -->
				
				<!-- course design -->
				<div class="tab-pane fade" id="design" role="tabpanel" aria-labelledby="design-tab">
					<div class="row">
				<!-- ���� �� -->
 					<%
 						ArrayList<courseDTO> designAll = dbPro.getCourseList("������");
 						if (designAll != null) {
 							for (int i = 0; i < designAll.size(); i++) {
 								courseDTO dCourse = designAll.get(i);
 					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=dCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=dCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=dCourse.getCategory() %> [<%=dCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=dCourse.getCoursenum()%>">
										<%=dCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = dCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=dCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				
				
 				<!-- course business -->
 				<div class="tab-pane fade" id="business" role="tabpanel" aria-labelledby="business-tab">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> businessAll = dbPro.getCourseList("�ǹ�����");
 						if(businessAll != null) {
 						for(int i = 0; i < businessAll .size(); i++) {
						courseDTO bCourse = businessAll .get(i);
					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=bCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=bCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=bCourse.getCategory() %> [<%=bCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=bCourse.getCoursenum()%>">
										<%=bCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = bCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=bCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				
				<!-- course beauty -->
				<div class="tab-pane fade" id="beauty" role="tabpanel" aria-labelledby="beauty-tab">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> beautyAll = dbPro.getCourseList("��Ƽ");
 						if(beautyAll != null) {
 						for(int i = 0; i < beautyAll .size(); i++) {
						courseDTO btCourse = beautyAll .get(i);
					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=btCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=btCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=btCourse.getCategory() %> [<%=btCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=btCourse.getCoursenum()%>">
										<%=btCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = btCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=btCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				
				<!-- course video -->
				<div class="tab-pane fade" id="video" role="tabpanel" aria-labelledby="video-tab">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> videoAll = dbPro.getCourseList("����");
 						if(videoAll != null) {
 						for(int i = 0; i < videoAll .size(); i++) {
						courseDTO vCourse = videoAll .get(i);
					%>
				
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=vCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=vCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=vCourse.getCategory() %> [<%=vCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=vCourse.getCoursenum()%>">
										<%=vCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = vCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=vCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				
				<!-- course language -->
				<div class="tab-pane fade" id="language" role="tabpanel" aria-labelledby="language-tab">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> languageAll = dbPro.getCourseList("�ܱ���");
 						if(languageAll != null) {
 						for(int i = 0; i < languageAll .size(); i++) {
						courseDTO lCourse = languageAll .get(i);
					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=lCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=lCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=lCourse.getCategory() %> [<%=lCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=lCourse.getCoursenum()%>">
										<%=lCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = lCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=lCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				<!-- course music -->
				<div class="tab-pane fade" id="music" role="tabpanel" aria-labelledby="music">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> musicAll = dbPro.getCourseList("����");
 						if(musicAll != null) {
 						for(int i = 0; i < musicAll .size(); i++) {
						courseDTO mCourse = musicAll .get(i);
					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=mCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=mCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=mCourse.getCategory() %> [<%=mCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=mCourse.getCoursenum()%>">
										<%=mCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = mCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=mCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				
				<!-- course lifestyle -->
				<div class="tab-pane fade" id="lifestyle" role="tabpanel" aria-labelledby="lifestyle">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> lifestyleAll = dbPro.getCourseList("��������Ÿ��");
 						if(lifestyleAll != null) {
 						for(int i = 0; i < lifestyleAll .size(); i++) {
						courseDTO lsCourse = lifestyleAll .get(i);
					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=lsCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=lsCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=lsCourse.getCategory() %> [<%=lsCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=lsCourse.getCoursenum()%>">
										<%=lsCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = lsCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=lsCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				
				<!-- course etc -->
				<div class="tab-pane fade" id="etc" role="tabpanel" aria-labelledby="Etc">
					<div class="row">
 					<% 
 						ArrayList<courseDTO> etcAll = dbPro.getCourseList("��Ÿ");
 						if(etcAll != null) {
 						for(int i = 0; i < etcAll .size(); i++) {
						courseDTO eCourse = etcAll .get(i);
					%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=eCourse.getCoursenum()%>">
									<img src="<%=request.getContextPath() %>/uploadFile/<%=eCourse.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
								<div class="courses_info">
									<span><%=eCourse.getCategory() %> [<%=eCourse.getDifficulty() %>]</span>
									<h3>
										<a href="/JSP_PROJECT/board/course/course_details.jsp?coursenum=<%=eCourse.getCoursenum()%>">
										<%=eCourse.getTitle() %>
										</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<%String shortAddr = eCourse.getAddress().substring(0, 7); %>
											<span><%=shortAddr %></span>
										</div>
										<div class="prise">
											<span class="active_prise"><%=eCourse.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				<%}} else {%>
					<div style="text-align: center;">
						������ �������� �ʽ��ϴ�.
					</div>
				<%} %>
				</div>
				</div>
				<!-- etc �� -->
				<!-- ī�װ��� ���� �� -->
			</div>
		</div>
	</div>
</div>
<!-- popular_courses_end-->