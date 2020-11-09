<%@page import="com.semosam.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	String id = (String) session.getAttribute("idKey");
	memberDAO dao = new memberDAO();
	boolean teacher = dao.teacherCheck(id);
%>

<!DOCTYPE html>

<head>
<meta charset="EUC-KR">
<!-- <meta http-equiv="x-ua-compatible" content="ie=edge">
 -->
<title>����� - ������ ��� ������</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/themify-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/flaticon.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gijgo.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/slicknav.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

<!-- header-start -->
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid p-0">
				<div class="row align-items-center no-gutters">
					<div class="col-xl-2 col-lg-2">
						<div class="logo-img">
						</div>
					</div>
					<div class="col-xl-7 col-lg-7">
						<div class="main-menu  d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="<%=request.getContextPath() %>/board/index.jsp">����</a></li>
									<li><a href="<%=request.getContextPath() %>/board/course/courses.jsp">����</a></li>
									<%
										if (teacher) {
									%>

									<li><a href="<%=request.getContextPath() %>/board/teacher/teacherContent.jsp">������<i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="<%=request.getContextPath() %>/board/teacher/courseRegister.jsp">�������</a></li>
											<li><a href="<%=request.getContextPath() %>/board/teacher/teacherContent.jsp">���� ��ȸ</a></li>
											<!-- ���� ��ȸ �ȿ� ��û�� ��ȸ/��������/��������/�������� ���� -->
										</ul></li>
									<%
										}
									%>
									<%
										if (id != null) {
									%>
									<li><a href="<%=request.getContextPath() %>/board/mypage/myprofile.jsp">����������<i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="<%=request.getContextPath() %>/board/mypage/myprofile.jsp">ȸ������</a></li>
											<li><a href="<%=request.getContextPath() %>/board/mypage/mycourse.jsp">�������</a></li>
											<li><a href="<%=request.getContextPath() %>/board/mypage/wishlist.jsp">����</a></li>

										</ul></li>
									<%
										}
									%>
									<li><a href="<%=request.getContextPath() %>/board/service/notice.jsp">������<i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="<%=request.getContextPath() %>/board/service/notice.jsp">��������</a></li>
											<li><a href="<%=request.getContextPath() %>/board/service/qna.jsp">Q&A</a></li>

										</ul></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 d-none d-lg-block">
						<div class="log_chat_area d-flex align-items-center main-menu">
							<%
								if (!teacher && id != null) {
							%>

							<a href="<%=request.getContextPath() %>/board/teacher/teacherSingup.jsp" class="login"> <i
								class="flaticon-user"></i> <span>�ܵ��</span>
							</a>
							<%
								}
							%>
							<%
								if (id != null) {
							%>
							<a href="<%=request.getContextPath() %>/nohead/logoutProc.jsp" class="genric-btn danger circle"> <!-- <i class="fa fa-phone"></i> -->
								<span>�α׾ƿ�</span>
							</a>
							<%
								} else {
							%>
							<a href="#test-form" class="genric-btn danger circle popup-with-form"> <!-- <i class="fa fa-phone"></i> -->
								<span>�α���</span>
							</a>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="mobile_menu d-block d-lg-none"></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</header>
<!-- header-end -->


<!-- �α����� -->
<form id="test-form" class="white-popup-block mfp-hide" action="<%=request.getContextPath() %>/nohead/loginProc.jsp"
	method="post">
	<div class="popup_box ">
		<div class="popup_inner">
			<!-- <div class="logo text-center">
				<a href="#"> <img src="img/form-logo.png" alt="">
				</a>
			</div> -->
			<h3>�α���</h3>
			<form action="#">
				<div class="row">
					<div class="col-xl-12 col-md-12">
						<input type="email" placeholder="�̸���" name="email" required>
					</div>
					<div class="col-xl-12 col-md-12">
						<input type="password" placeholder="��й�ȣ" name="pwd" required>
					</div>
					<div class="col-xl-12">
						<button type="submit" class="boxed_btn_orange" form="test-form">�α���</button>
					</div>
				</div>
			</form>
			<p class="doen_have_acc">
				���� ȸ���� �ƴϽʴϱ�? <a class="dont-hav-acc" href="#test-form2">ȸ������</a>
			</p>
		</div>
	</div>
</form>
<!-- form itself end -->

<!-- ȸ������ �� -->
<form id="test-form2" class="white-popup-block mfp-hide" action="<%=request.getContextPath() %>/nohead/signupProc.jsp"
	name="regForm" method="post">
	<div class="popup_box">
		<div class="popup_inner">

			<h3>ȸ������</h3>
			<form action="#">
				<div class="row">
					<div class="col-xl-12 col-md-12">
						<input type="email" name="email" id="email" placeholder="�̸���" onkeyup="idCheck(this)" required>
					</div>
					<div class="col-xl-12 col-md-12">
						<div id="idcheck"></div>
						<div class="alert alert-danger" id="idCheckAlertDanger1">�̸��� ���Ŀ� �°� ���ּ���.</div>
					</div>


					<div class="col-xl-12 col-md-12">
						<input type="password" name="pwd" id="pwd1" placeholder="��й�ȣ" maxlength="20"
							onkeyup="pwdCheck(this)" required>
					</div>
					<div class="col-xl-12 col-md-12">
						<div class="alert alert-danger" id="pwdCheckAlert">��й�ȣ�� ����/���� 6~20�� �̳��� �Է����ּ���.</div>
					</div>
					<div class="col-xl-12 col-md-12">
						<input type="Password" name="repwd" id="pwd2" placeholder="��й�ȣ ��Ȯ��" maxlength="20"
							onkeyup="pwdCheck2(this)" required>
					</div>
					<div class="col-xl-12 col-md-12">
						<div class="alert alert-success" id="pwdCheckAlertSuccess">��й�ȣ�� ��ġ�մϴ�.</div>
						<div class="alert alert-danger" id="pwdCheckAlertDanger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div>
					</div>
					<div class="col-xl-12 col-md-12">
						<input type="text" name="name" placeholder="����" required>
					</div>
					<div class="col-xl-12 col-md-12">
						<div class="switch-wrap d-flex justify-content-between">
							<p>��</p>
							<div class="primary-radio">
								<input type="radio" name="gender" value="male" id="male" required><label for="male"></label>
							</div>
							<p>��</p>
							<div class="primary-radio">
								<input type="radio" name="gender" value="female" id="female" required><label
									for="female"></label>

							</div>
						</div>
					</div>

					<div class="col-xl-12 col-md-12">
						<input type="tel" name="tel" id="tel" placeholder="����ó" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
							title="010-xxxx-xxxx" required>
					</div>
				</div>
				<h5>���ɻ�</h5>
				<div class="row">

					<div class="col-xl-12 col-md-12">
						<div class="switch-wrap d-flex justify-content-between">
							<p>������</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="������" value="������"> <label for="������"></label>
							</div>
							<p>�ǹ�����</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="�ǹ�����" value="�ǹ�����"> <label for="�ǹ�����"></label>
							</div>
							<p>��Ƽ</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="��Ƽ" value="��Ƽ"> <label for="��Ƽ"></label>
							</div>
							<p>����</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="����" value="����"> <label for="����"></label>
							</div>
						</div>
						<div class="switch-wrap d-flex justify-content-between">
							<p>�ܱ���</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="�ܱ���" value="�ܱ���"> <label for="�ܱ���"></label>
							</div>
							<p>����</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="����" value="����"> <label for="����"></label>
							</div>
							<p>��������Ÿ��</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="��������Ÿ��" value="��������Ÿ��"> <label
									for="��������Ÿ��"></label>
							</div>
							<p>��Ÿ</p>
							<div class="primary-checkbox">
								<input type="checkbox" name="interests" id="��Ÿ" value="��Ÿ"> <label for="��Ÿ"></label>
							</div>
						</div>

					</div>

					<div class="col-xl-12">
						<button id="submit" type="submit" class="boxed_btn_orange" form="test-form2">ȸ������</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</form>
<!-- form itself end -->



<!-- JS here -->
<script src="<%=request.getContextPath() %>/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendor/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/js/ajax-form.js"></script>
<script src="<%=request.getContextPath() %>/js/waypoints.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.counterup.min.js"></script>
<script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scrollIt.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollUp.min.js"></script>
<script src="<%=request.getContextPath() %>/js/wow.min.js"></script>
<script src="<%=request.getContextPath() %>/js/nice-select.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.slicknav.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.magnific-popup.min.js"></script>
<script src="<%=request.getContextPath() %>/js/plugins.js"></script>
<script src="<%=request.getContextPath() %>/js/gijgo.min.js"></script>
<script src="<%=request.getContextPath() %>/js/reg.js"></script>

<!--contact js-->
<script src="<%=request.getContextPath() %>/js/contact.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.ajaxchimp.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.form.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/js/mail-script.js"></script>

<script src="<%=request.getContextPath() %>/js/main.js"></script>