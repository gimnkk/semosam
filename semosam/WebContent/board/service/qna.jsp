<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<style type="text/css">
#block {
	padding: 10px 0;
}
</style>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>FAQ 자주 묻는 질문</h3>
</div>
<head>
<title>FAQ 자주 묻는 질문</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="our_courses">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">수강생</a></li>
				<li><a data-toggle="tab" href="#menu1">선생님</a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<div id="block">
						<h3>수업 신청 절차가 어떻게 되나요?</h3>
						<p>
							로그인 후에 신청 하실 수 있습니다.<br>
							수업신청은 수업메뉴에서 원하는 수업을 선택하고 시간을 선택한 후 수강신청 버튼을 누르면 진행됩니다!
						</p>
					</div>
					<div id="block">
						<h3>수업장소와 시간은 어떻게 되나요?</h3>
						<p>
							수업소개에 수업장소와 시간이 명시되어 있습니다. 자세히 명시 되어있지 않은 수업의 경우 튜터와 조율하여 유동적으로
							결정할 수 있습니다.<br>
						</p>
					</div>
					<div id="block">
						<h3>세모쌤들의 수업 퀄리티를 신뢰할 수 있을까요?</h3>
						<p>
							세모쌤에서 튜터에 대한 철저한 사전검증을 하게 됩니다.<br> 실제 수업을 들었던 수강생의 리뷰와 피드백을
							통해 튜터의 평판을 지속적으로 관리합니다. 세모쌤에서는 계속해서 튜터들의 신뢰도를 높일 수 있는 검증 시스템을 만들어
							갈 것임을 약속드립니다.
						</p>
					</div>
					<div id="block">
						<h3>수업 취소는 어떻게 할 수 있나요?</h3>
						<p>'마이페이지 > 수강목록'에서 해당 수업을 선택하면 수업 취소가 가능합니다. 첫 수업 24시간 전에
							선생님께 수업취소의사를 전달해주시길 바랍니다.</p>
					</div>
					<div id="block">
						<h3>수업 취소는 어떻게 할 수 있나요?</h3>
						<p>'마이페이지 > 수강목록'에서 해당 수업을 선택하면 수업 취소가 가능합니다. 첫 수업 24시간 전에
							선생님께 수업취소의사를 전달해주시길 바랍니다.</p>
					</div>
					<div id="block">
						<h3>회원가입은 어떻게 하나요?</h3>
						<p>'로그인 > 회원가입'를 통해 회원가입이 가능합니다.</p>
					</div>
					<div id="block">
						<h3>회원탈퇴는 어떻게 하나요?</h3>
						<p>'마이페이지 > 회원정보메뉴'를 통해 회원탈퇴가 가능합니다.</p>
					</div>
				</div>
				<div id="menu1" class="tab-pane fade">
					<div id="block">
						<h3>수업 등록은 아무나 할 수 있나요?</h3>
						<p>
							누구나 수업 등록을 하실 수 있습니다. 단, 수업등록 전에 쌤등록을 진행하셔야 합니다.<br>
							수업 등록 후 관리자의 최종 승인이 있어야 홈페이지에 게시되고 신청을 받을 수 있습니다. 관리자는 등록된 수업내용,
							이미지, 튜터 프로필 등의 적절성, 사실확인을 검증한 이후 최종 승인을 해드립니다.
						</p>
					</div>
					<div id="block">
						<h3>수업 등록은 어떻게 하나요?</h3>
						<p>
							수업 등록은 '선생님 > 수업등록' 에서 하실 수 있습니다.<br> 단, 선생님 메뉴를 사용하기 위해서는
							쌤등록이 우선 진행 되어야 합니다.
						</p>
					</div>
					<div id="block">
						<h3>수업은 어디서 진행하면 되나요?</h3>
						<p>
							기본적으로 튜터님께서 수업소개서에 작성해주신 곳에서 수업을 진행해주시면 됩니다.<br> (EX. 카페,
							스터디룸, 튜터님 개인 스튜디오 등)<br> 자유롭게 장소를 정하여 수업을 진행하는 것이 세모쌤의
							장점이니까요!<br>
						</p>
					</div>
					<div id="block">
						<h3>수업 등록후 승인까지 얼마나 걸리나요?</h3>
						<p>
							세모쌤께서 작성해주신 수업소개서는 탈잉의 검토단분들이 꼼꼼히 검토하고 있습니다. 수업승인은 먼저 등록해주신 순서대로
							진행되고 있으며 영업일 기준 평균 5일 정도 소요됩니다.<br> 수업승인 반려 후 재승인 요청 해주시는
							경우에도 처음부터 다시 심사가 진행되니 모든 내용을 완벽하게 작성하신 후에 제출해주시는 것이 좋습니다.
						</p>
					</div>
					<div id="block">
						<h3>수강생이 수업을 신청하면 어디서 확인 할 수 있나요?</h3>
						<p>
							'선생님 > 수업목록 > 일정관리' 에서 확인 하실 수 있습니다. 수업을 선택하신 후 해당 수업의 일정을 선택하여
							튜티목록을 누르시면 해당하는 수업의 일정에 신청한 수강생의 목록을 확인하실 수 있습니다.<br>
						</p>
					</div>
					<div id="block">
						<h3>등록한 수업을 취소하고 싶습니다.</h3>
						<p>'선생님 > 수업목록 > 수정하기' 에서 수업을 취소 하실 수 있습니다. 아래에 있는 수업삭제 버튼을
							누르시면 해당 수업이 취소됩니다.</p>
					</div>
					<div id="block">
						<h3>수업에 등록한 일정을 취소하고 싶습니다.</h3>
						<p>'선생님 > 수업목록 > 일정관리' 에서 취소 하실 수 있습니다. 페이지 아래에 있는 수업삭제 버튼을
							누르시면 해당 수업이 취소됩니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



