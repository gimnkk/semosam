<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	int coursenum = Integer.parseInt(request.getParameter("coursenum"));
	
%>


<div class="bradcam_area breadcam_bg overlay2">
	<h3>리뷰작성</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="container box_1170">
				<div class="progress-table-wrap">
					<div class="progress-table" align="center">
						<div align="center">
							<h2>리뷰남기기</h2><hr>
						</div>
						<div align="center">
							<form action="/JSP_PROJECT/board/mypage/writeReviewProc.jsp">
								<textarea name="content" id="" cols="90" rows="20" placeholder="수업 후기를 남겨주세요."></textarea>
						</div>
						<div>
							평점 : 
							<input name="starscore" placeholder="평점을 적어주세요" style="margin: 15px 0px;"> (0.0~5.0)
							<input type="hidden" name="coursenum" value="<%=coursenum %>">						
						</div>
						<div align="center">
							<button type="submit" class="boxed_btn">평가 등록하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
