<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>수업일정등록</h3>
</div>
<!-- bradcam_area_end -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="col-xl-8 col-lg-8 col-md-8" id="teacherSingup">
				<div class="mt-10">
					<p>수업 이름</p>
					<input name="title" class="single-input">
				</div>
				<table class="mt-10">
					<form action="/JSP_PROJECT/board/teacher/scheduleRegisterProc.jsp"
						method="post">
					<tr>
						<td>날짜</td>
						<td>시간</td>
						<td>수업시간(hour)</td>
					</tr>
					<tr>
						<td><input type="date" name="date" class="single-input"></td>
						<td><input type="time" name="time" min="08:00" max="22:00" list="timeslist" class="single-input"></td>
						<td><input name="runtime" size="1" class="single-input"></td>
					</tr>
					
					<!-- <textarea name="content" class="single-textarea" placeholder="수업 소개"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '수업 소개'" required></textarea> -->
					<tr>
					<td colspan="2"><button type="submit" class="boxed_btn_orange">수업등록</button></td>
					</tr>
					</form>
					<datalist id="timeslist">
						<option value="08:00">
						<option value="08:30">
						<option value="09:00">
						<option value="09:30">
						<option value="10:00">
						<option value="10:30">
						<option value="11:00">
						<option value="11:30">
						<option value="12:00">
						<option value="12:30">
						<option value="13:00">
						<option value="13:30">
						<option value="14:00">
						<option value="14:30">
						<option value="15:00">
						<option value="15:30">
						<option value="15:00">
						<option value="15:30">
						<option value="16:00">
						<option value="16:30">
						<option value="17:00">
						<option value="17:30">
						<option value="18:00">
						<option value="18:30">
						<option value="19:00">
						<option value="19:30">
						<option value="20:00">
						<option value="20:30">
						<option value="21:00">
						<option value="21:30">
						<option value="22:00">
					</datalist>
					
				</table>
			</div>
		</div>
	</div>
</div>
