<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int courseNum = Integer.parseInt(request.getParameter("coursenum"));
	courseDAO daoC = new courseDAO();
	courseDTO dto = new courseDTO();
	dto = daoC.getCourse(courseNum);
%>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>수업변경</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
		</div>
		<div class="row">
			<div class="col-xl-8 col-lg-8 col-md-8" id="teacherSingup">
				<form name="courseUpdateForm" action="/JSP_PROJECT/board/teacher/courseUpdate.jsp" method="post">
					<div id="course">
						<h3 class="mb-30"><br>수업 정보</h3>
						<div class="mt-10">
							<p>수업 이름</p>
							<input type="text" name="title" value="<%=dto.getTitle()%>" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '수업 이름'" required class="single-input">
						</div>
						<p>카테고리</p>
						<div class="input-group-icon mt-10">
							<div class="icon">
								<i class="fa fa-folder-open-o" aria-hidden="true"></i>
							</div>
							<div class="form-select" id="default-select">
								<select name="category">
									<option selected="selected" disabled>카테고리</option>
									<option value="디자인">디자인</option>
									<option value="실무역량">실무역량</option>
									<option value="뷰티">뷰티</option>
									<option value="영상">영상</option>
									<option value="외국어">외국어</option>
									<option value="음악">음악</option>
									<option value="라이프스타일">라이프스타일</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<script>
								courseUpdateForm.category.value='<%=dto.getCategory()%>';	
							</script>
						</div>
						<p>수업 난이도</p>
						<div class="input-group-icon mt-10">
							<div class="icon">
								<i class="fa fa-paperclip" aria-hidden="true"></i>
							</div>
							<div class="form-select" id="default-select">
								<select name="difficulty">
									<option selected disabled>난이도</option>
									<option value="easy">easy</option>
									<option value=intermediate>intermediate</option>
									<option value="hard">hard</option>
								</select>
							</div>
							<script>
								courseUpdateForm.difficulty.value='<%=dto.getDifficulty()%>';		
							</script>
						</div>
						<div class="mt-10">
							<p>수업 인원(1~99)</p>
							<input type="text" name="maxppl" value="<%=dto.getMaxppl()%>" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '수업 인원'" required class="single-input">
						</div>
						<div class="mt-10">
							<p>수업 장소</p>
							<div class="file-input">
								<input type="text" name="address" id="address" value="<%=dto.getAddress() %>" readonly="readonly" required class="fileRoute">
								<label for="address" onclick="sample4_execDaumPostcode()">장소 검색</label>
							</div>
						</div>
						<div class="mt-10">
							<p>수업 소개</p>

							<textarea name="content" class="single-textarea"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '수업 소개'" required><%=dto.getContent() %></textarea>
						</div>
						<div class="mt-10">
							<p>수업 공지</p>

							<textarea name="notice" class="single-textarea"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '수업 공지'" required><%=dto.getNotice() %></textarea>
						</div>
					</div>
					<input type="hidden" name="coursenum" value="<%=dto.getCoursenum()%>">
					<button type="submit" class="boxed_btn_orange">수업변경</button>
					<button type="button" class="boxed_btn" onclick="window.location='/JSP_PROJECT/board/teacher/courseDeleteProc.jsp?coursenum=<%=dto.getCoursenum()%>'">수업삭제</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; 
                var extraRoadAddr = ''; 

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById("address").value = roadAddr;
            }
        }).open();
    }
</script>