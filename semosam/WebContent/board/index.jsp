<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>


<!-- slider_area_start -->
<div class="slider_area ">
	<div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-xl-6 col-md-6">
					<div class="illastrator_png">
						<img src="<%=request.getContextPath() %>/img/banner/edu_ilastration.png" alt="">
					</div>
				</div>
				<div class="col-xl-6 col-md-6">
					<div class="slider_info">
						<h3 class="black">
							������ ��� ������<br>����� <br>
						</h3>

						<div class="search">
							<form action="<%=request.getContextPath() %>/board/course/courses.jsp" method="get">
								<input type="search" name="search" id="search" placeholder="���� ���� ������ ã��������">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- slider_area_end -->



<!-- our_courses_start -->
<div class="our_courses">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<h3>������� �Ұ��մϴ�.</h3>
					<p>
						������ ��� �������� ����ܿ��� ����������.
					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-3 col-md-6 col-lg-6">
				<div class="single_course text-center" style="width: 260px; height: 400px;">
					<div class="icon">
						<i class="flaticon-art-and-design"></i>
					</div>
					<h3>���� ������ ã��</h3>
					<p>
						�������� �ƴϾ<br>��ɸ� �ִٸ�<br>��� ȸ���� ��������<br>�� �ڰ��� �ֽ��ϴ�!
						<br>
						�ڽ��� �����<br>�ٸ� ����� �����ϼ���.
					</p>
				</div>
			</div>
			<div class="col-xl-3 col-md-6 col-lg-6">
				<div class="single_course text-center" style="width: 260px; height: 400px;">
					<div class="icon blue">
						<i class="flaticon-business-and-finance"></i>
					</div>
					<h3>������ �׸��� �л�</h3>
					<p>
						��� �����ִ� �о�,<br>���� �;��� �͵���<br>����ܿ��� ����������.
						<br>
						������� ����<br>�ּ��� �� �ΰ����� ������<br>â���� �� �ֽ��ϴ�!
					</p>
				</div>
			</div>
			<div class="col-xl-3 col-md-6 col-lg-6">
				<div class="single_course text-center" style="width: 260px; height: 400px;">
					<div class="icon">
						<i class="flaticon-premium"></i>
					</div>
					<h3>�ܰ� �л����� ����</h3>
					<p>
						ä�� ����� ����<br>�ܰ� ������ �� �ֽ��ϴ�.
						<br>
						�ܰ� �����ϸ�<br>���� �������� ����������!
					</p>
				</div>
			</div>
			<div class="col-xl-3 col-md-6 col-lg-6">
				<div class="single_course text-center" style="width: 260px; height: 400px;">
					<div class="icon gradient">
						<i class="flaticon-crown"></i>
					</div>
					<h3>�����</h3>
					<p>
						����ܿ���<br>���ϴ� ������ ã��<br>���� ���� ������ ���ƿ�.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- our_courses_end -->



