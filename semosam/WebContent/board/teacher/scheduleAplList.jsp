<%@page import="com.semosam.dto.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dao.applicantDAO"%>
<%@page import="com.semosam.dao.scheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	int serial = Integer.parseInt(request.getParameter("serial"));
	ArrayList<memberDTO> list = new ArrayList<memberDTO>();

	applicantDAO DaoA = new applicantDAO();
	list = DaoA.getApplicant(coursenum, serial);

%>

<div class="bradcam_area breadcam_bg overlay2">
	<h3>수강신청한 튜티목록</h3>
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
							<tr>
								<td align="center">수강신청한 튜티가 존재하지 않습니다.</td>
							</tr>
							<%
								} else {
							%>
								<div class="table-head">
								<div class="name">이메일</div>
								<div class="name">이름</div>
								<div class="serial">성별</div>
								<div class="name">전화번호</div>
							</div>
							<%
									
								for (int i = 0; i < list.size(); i++) {
							%>

							<div class="table-row" align="center">
								<div class="name"><%=list.get(i).getEmail()%></div>
								<div class="name"><%=list.get(i).getName()%></div>
								<div class="serial"><%=(list.get(i).getGender().equals("male"))? "남" : "여"%></div>
								<div class="name"> <%=list.get(i).getTel()%></div>
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
