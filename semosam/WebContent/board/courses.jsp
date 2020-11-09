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
					<h3>�α�� ����</h3>
					<p style="font: 'gulim'; ">
						���� ����ܿ��� ���� �α��ִ� �������� ����������!
					</p>
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
							
							<!-- �α��� �ÿ��� Ȯ�� ���� -->
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
								data-toggle="tab" href="#Etc" role="tab" aria-controls="Etc"
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
					
					<!-- DB course -->
<%-- 					<% for(int i = 0; i < courseList.size(); i++) {
						courseDTO course = courseList.get(i);
					%>
					
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%} %> --%>
						<!-- DB course -->
						
						<!-- �ӽ� ���̾� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="course_details.jsp"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>ī�װ�</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>ī�װ�</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>ī�װ�</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- �ӽ� ���̾� -->
					<!-- <div class="col-xl-12">
							<div class="more_courses text-center">
								<a href="#" class="boxed_btn_rev">More Courses</a>
							</div>
						</div> -->
						
					</div>
				</div>
				<!-- ��� ���� �� -->
				
				<!-- �� ���ɻ� ���� -->
				<div class="tab-pane fade" id="interest" role="tabpanel" aria-labelledby="interest-tab">
					<div class="row">
					
					<!-- DB course -->
<%-- 					<% for(int i = 0; i < courseList.size(); i++) {
						courseDTO course = courseList.get(i);
					%>
					
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<!-- ���� �̹��� -->
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/<%=course.getCourseimage() %>">
									</a>
								</div>
								<!-- ���� ���� -->
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
											<span class="active_prise"><%=course.getTeacherName() %> ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%} %> --%>
						<!-- DB course -->
						
						<!-- �ӽ� ���̾� -->
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="course_details.jsp"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>ī�װ�(���ɻ�)</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>ī�װ�(���ɻ�)</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>ī�װ�(���ɻ�)</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- �ӽ� ���̾� -->
					<!-- <div class="col-xl-12">
							<div class="more_courses text-center">
								<a href="#" class="boxed_btn_rev">More Courses</a>
							</div>
						</div> -->
						
					</div>
				</div>
				<!-- �� ���ɻ� �� -->
					
					
				<div class="tab-pane fade" id="design" role="tabpanel" aria-labelledby="design-tab">
					<div class="row">
											<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="single_courses">
								<div class="thumb">
									<a href="#"> <img src="<%=request.getContextPath() %>/uploadFile/1.jpg">
									</a>
								</div>
								<div class="courses_info">
									<span>������</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>�ǹ�����</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>��Ƽ</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>����</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>�ܱ���</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>����</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>��������Ÿ��</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
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
									<span>��Ÿ</span>
									<h3>
										<a href="course_details.jsp">������</a>
									</h3>
									<div class="star_prise d-flex justify-content-between">
										<div class="star">
											<i class="flaticon-mark-as-favorite-star"></i> <span>(��պ���)</span>
										</div>
										<div class="prise">
											<span class="active_prise">�������� ��</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ī�װ��� ���� �� -->
			</div>
		</div>
	</div>
</div>
<!-- popular_courses_end-->