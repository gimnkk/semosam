<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>수업등록</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<!-- <div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<h3>Popular Courses</h3>
					<p>
						Your domain control panel is designed for ease-of-use and <br> allows for all aspects of
						your domains.
					</p>
				</div>
			</div> -->
		</div>
		<div class="row">
			<div class="col-xl-8 col-lg-8 col-md-8" id="teacherSingup">
				<form action="/JSP_PROJECT/board/teacher/courseRegisterProc.jsp" method="post"
					enctype="multipart/form-data">
					
					<div id="course">

						<h3 class="mb-30">
							<br>수업 정보
						</h3>

						<div class="mt-10">
							<p>수업 이름</p>
							<input type="text" name="title" placeholder="수업명" onfocus="this.placeholder = ''"
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
						</div>
						<div class="mt-10">
							<p>수업 인원(1~99)</p>

							<input type="text" name="maxppl" placeholder="수업 인원" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '수업 인원'" required class="single-input">
						</div>
						<div class="mt-10">
							<p>수업 장소</p>

							<input type="text" name="address" placeholder="수업 장소" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '수업 장소'" required class="single-input">
						</div>
						<div class="mt-10">
							<p>수업 소개</p>

							<textarea name="content" class="single-textarea" placeholder="수업 소개"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '수업 소개'" required></textarea>
						</div>
						<div class="mt-10">
							<p>수업 공지</p>

							<textarea name="notice" class="single-textarea" placeholder="수업 공지"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '수업 공지'" required></textarea>
						</div>
						<div class="mt-10">
							<p>수업 이미지</p>
							<div class="file-input">
								<input type="text" readonly="readonly" id="fileRoute2" required class="fileRoute"> <label
									for="courseImage">사진 업로드 <input name="courseImage" type="file"
									onchange="javascript:document.getElementById('fileRoute2').value=this.value"
									id="courseImage">
								</label>
							</div>
						</div>
					</div>
					<button type="submit" class="boxed_btn_orange">수업등록</button>
				</form>
			</div>
		</div>
	</div>
</div>
