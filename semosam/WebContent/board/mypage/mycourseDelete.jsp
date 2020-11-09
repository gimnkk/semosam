<%@page import="com.semosam.dao.scheduleDAO"%>
<%@page import="com.semosam.dto.scheduleDTO"%>
<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	/* String email = session.getAttribute("idKey");  */
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	courseDAO daoC = new courseDAO();
	courseDTO dtoC = daoC.getCourse(courseNum);

	scheduleDAO daoS = new scheduleDAO();
	ArrayList<scheduleDTO> list = new ArrayList<scheduleDTO>();
	list = daoS.getMyCoursesSchedules(courseNum);
%>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>수강 취소</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="container box_1170">
				<div class="section-top-border">
					<div class="progress-table-wrap">
						<div class="progress-table" align="center">
							<%-- 			<%
								if (list == null || list.isEmpty()) {
							%>
							<tr>
								<td align="center">일정이 존재하지 않습니다. 일정을 등록해주세요.</td>
								&nbsp;&nbsp;
								<td>
									<a href="<%=request.getContextPath()%>/board/teacher/scheduleRegister.jsp?coursenum=<%=courseNum%>"
										class="genric-btn success circle"
									>일정추가</a>
								</td>
							</tr>
							<%
								} else {
							%> --%>
							<div style="color: #415094;" align="center">
								<div><%=dtoC.getTitle()%></div>
							</div>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<div class="table-row" align="center">
								<div class="percentage"><%=list.get(i).getDay() + " " + list.get(i).getTime()%></div>
								<div class="gender"><%=list.get(i).getRuntime()%>시간
								</div>
								<div class="gender">
									<a
										href="<%=request.getContextPath()%>/board/mypage/mycourseDeleteProc.jsp?coursenum=<%=list.get(i).getCoursenum()%>&serial=<%=list.get(i).getSerial()%>"
										class="genric-btn info circle arrow"
									>일정삭제</a>
								</div>
							</div>
							<%
								}
							%>
							<div class="table-row" style="padding-left: 420px">
								<a href="javascript:history.back()" class="genric-btn primary circle">뒤로가기</a>
							</div>
						</div>
						<%-- 						<%
							}
						%> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
