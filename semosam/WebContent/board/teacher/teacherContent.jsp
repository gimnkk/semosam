<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	courseDAO daoC = new courseDAO();
	ArrayList<courseDTO> list = new ArrayList<courseDTO>();
	list = daoC.getCourses(id);
%>

<div class="bradcam_area breadcam_bg overlay2">
	<h3>수업목록</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="container box_1170">
				<div class="section-top-border">
					<div class="progress-table-wrap">
						<div class="progress-table" align="center">

							<%
								if (list == null || list.isEmpty()) {
							%>
							
								수업이 존재하지 않습니다. 수업을 등록해주세요.
							

							<%
								} else {
							%>
							<div class="table-head">
								<div class="name">수업명</div>
								<div class="serial">카테고리</div>
								<div class="serial">난이도</div>
								<div class="serial">최대인원수</div>
								<div class=name>주소</div>
							</div>

							<%
								for (int i = 0; i < list.size(); i++) {
							%>

							<div class="table-row">
								<div class="name"><%=list.get(i).getTitle()%></div>
								<div class="serial"><%=list.get(i).getCategory()%></div>
								<div class="serial"><%=list.get(i).getDifficulty()%></div>
								<div class="serial"><%=list.get(i).getMaxppl()%></div>
								<div class="name"><%=list.get(i).getAddress()%></div>
							</div>
							<div class="table-row" style="padding-left: 420px;">
								<a href="<%=request.getContextPath()%>/board/teacher/courseContent.jsp?coursenum=<%=list.get(i).getCoursenum()%>"
									class="genric-btn success circle ">수정하기</a>&nbsp;&nbsp;&nbsp;
								<a href="<%=request.getContextPath()%>/board/teacher/scheduleContent.jsp?coursenum=<%=list.get(i).getCoursenum()%>"
									class="genric-btn primary circle">일정관리</a>
							</div>

							<%
									}
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
