<%@page import="java.util.ArrayList"%>
<%@page import="com.semosam.dto.scheduleDTO"%>
<%@page import="com.semosam.dao.scheduleDAO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@page import="com.semosam.dto.courseDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	courseDAO cDao = new courseDAO();
	courseDTO course = cDao.getCourse(coursenum);
	scheduleDAO sDao = new scheduleDAO();
	ArrayList<scheduleDTO> list = sDao.getSchedules(coursenum);
%>
<!DOCTYPE html>
<html>
<head>
<style>

td {
	padding-bottom: 20px;
}
</style>

<script type="text/javascript">

	if("<%=id%>"==null) {
		alert('�α����� �ʿ��մϴ�.');
		history.go(-1);
	}
	
	function applicant() {
		if(document.applicantForm.serial.value=="") {
			alert("���� ������ �����ϼ���")
			return false;
		}
		document.applicantForm.submit();
	}
</script>

</head>
<body>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2" onclick="applicant()">
	<h3>������û</h3>
</div>
<!-- bradcam_area_end -->

<div class="courses_details_info">
	<div class="container">
		<div class="row">
		
			<div class="col-xl-7 col-lg-7">
				<div class="single_courses" style="margin-bottom: 20px;">
					<h3><b><%= course.getTitle() %></b></h3>
					<br>
					 <h4 class="second_title"><i class="ti-calendar"></i>&nbsp;&nbsp;���Ͻô� ���������� �������ּ���.</h4>
				</div>
					<div class="outline_courses_info">
					
					<form name="applicantForm" method="get"
					action="<%=request.getContextPath() %>/board/course/courseSubmitProc.jsp" >
					
					<input type="hidden" name="coursenum" value="<%=coursenum%>">
					<table style="margin-top: 30px;	margin-left:30px;">
						<%
							if(list.size()!=0){
						for(int i = 0; i < list.size(); i++) {%>
						<tr>
						<td>
						
						<div class="primary-radio" style="float: left">
							<input type="radio" id="schedule<%=i %>" name="serial" value="<%=list.get(i).getSerial() %>" >
							<label for="schedule<%=i %>"></label>
						</div>
						</td>
						<td>
						<label for="schedule<%=i %>">&nbsp;&nbsp;<%=list.get(i).getDay() %> <%=list.get(i).getWeekday() %>���� <%=list.get(i).getTime() %></label>
						</td>
						</tr>
						<!-- ���� ���� �� -->
						<%}} else { %>
						<tr>
						<td align="center">
							��ϵ� ���� ������ �����ϴ�.
						</td>
						</tr>
						<%} %>
					</table>
											
					</form>
					</div>
				</div>
			
			<div class="col-xl-5 col-lg-5">
				<div class="courses_sidebar" style="margin-top: 10px;">
				
					<!-- �ܼҰ� -->
					<div class="author_info">
						<div class="auhor_header">
							<div class="thumb">
								<img src="<%=request.getContextPath() %>/uploadFile/<%=course.getTeacherImage() %>" alt="" height="90" width="90" style="border-radius: 100%;" >
							</div>
							<div class="name">
								<h3><%=course.getTeacherName() %></h3>
								<p><br></p>
							</div>
						</div>
						<%if(list.size() != 0) {%>
						<p class="text_info"><br>������ ���Ű� ȯ���ؿ�!<br><b>������, �ð�</b>�� �������ּ���.</p>
						<%} else { %>
						<p class="text_info"><br>���� ���� ������ �������� �ʾҾ��.<br><b>���� ���� ���� ���� �߰��ϰڽ��ϴ�!</b><br>
						���ݸ� ��ٷ� �ּ���.</p>
						<%} %>
					</div>
					<%if(list.size() != 0) {%>
					<a href="javascript:applicant()" class="boxed_btn">���� ��û�ϱ�</a>
					<%} else {%>
					<a href="javascript:history.back()" class="boxed_btn">���� ������ ���ư���</a>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="col-xl-12" style="padding-top: 50px;">
		<div class="more_courses text-center">
			<a href="#" class="boxed_btn_rev">���� ��û�ϱ�</a>
		</div>
	</div> -->
</div>

	
</body>
</html>