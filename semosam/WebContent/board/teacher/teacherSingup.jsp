<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>쌤등록</h3>
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
				<form action="/JSP_PROJECT/board/teacher/teacherSignupProc.jsp" method="post"
					enctype="multipart/form-data">
					<div id="teacher">
						<h3 class="mb-30">쌤정보</h3>
						<div class="mt-10">
							<p>쌤사진</p>
						<div id="upload">
						<img id="samPic" width="200px" height="200px">
						</div>
							<div class="file-input">
								<input type="text" readonly="readonly" id="fileRoute" required class="fileRoute"> <label
									for="teacherImage">사진 업로드 <input name="teacherImage" type="file"
									onchange="javascript:document.getElementById('fileRoute').value=this.value"
									id="teacherImage">
								</label>
							</div>
						</div>
						<div class="mt-10">
							<p>쌤소개</p>
							<textarea name="teacherInfo" class="single-textarea" placeholder="소개글을 작성해주세요."
							 onfocus="this.placeholder = ''" onblur="this.placeholder = '소개글을 작성해주세요.'" required></textarea>
						</div>
					</div>

					<button type="submit" class="boxed_btn_orange">쌤등록</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	const samPic = document.querySelector("#samPic");
	const upload = document.querySelector("#upload");
	const teacherImage = document.querySelector("#teacherImage"); 
	
	teacherImage.addEventListener('change', function(e) {
		 let get_file = e.target.files;
		 
		 let image = document.createElement('img');
		 
		 let reader = new FileReader();
		 
		 reader.onload = function (img) {
			return function (e) {
				img.src = e.target.result;
			}
		}(img)
	
	
	if (get_file) {
		reader.readAsDataURL(get_file[0]);
	}
		div.appendChild(image);
	})
</script>
</body>
</html>