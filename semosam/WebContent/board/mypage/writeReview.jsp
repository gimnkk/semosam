<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	
%>


<div class="bradcam_area breadcam_bg overlay2">
	<h3>�����ۼ�</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="container box_1170">
				<div class="progress-table-wrap">
					<div class="progress-table" align="center">
						<div align="center">
							<h2>���䳲���</h2><hr>
						</div>
						<div align="center">
							<form action="<%=request.getContextPath() %>/board/mypage/writeReviewProc.jsp">
								<textarea name="content" id="" cols="90" rows="20" placeholder="���� �ı⸦ �����ּ���."></textarea>
						</div>
						<div>
							���� : 
							<input name="starscore" placeholder="������ �����ּ���" style="margin: 15px 0px;"> (0.0~5.0)
							<input type="hidden" name="coursenum" value="<%=coursenum %>">						
						</div>
						<div align="center">
							<button type="submit" class="boxed_btn">�� ����ϱ�</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
