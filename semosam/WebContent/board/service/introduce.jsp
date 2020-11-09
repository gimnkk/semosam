<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html class="no-js" lang="zxx">

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>소개</h3>
</div>
<div class="our_courses">
<!-- bradcam_area_end -->
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  h2 { text-align: center; }
  img.padding {
	padding-left: 200px;
	padding-right :200px;
}
  
  .carousel-control.right, .carousel-control.left {
  background-image: none;
  color: #511c88;
}

.carousel-indicators li {
  border-color: #511c88;
}

.carousel-indicators li.active {
  background-color: #511c88;
}

.item h4 {
  font-size: 19px;
  line-height: 1.375em;
  font-weight: 400;
  font-style: italic;
  margin: 70px 0;
}

.item span {
  font-style: normal;
}
  </style>
</head>
<body>
<!-- Container (About Section) -->
<img src="<%=request.getContextPath()%>/img/info_m_img01.png" width="100%"  class="padding">
<img src="<%=request.getContextPath()%>/img/info_m_img02.png" width="100%"  class="padding">
<img src="<%=request.getContextPath()%>/img/info_m_img03.png" width="100%"  class="padding">
<img src="<%=request.getContextPath()%>/img/info_m_img04.png" width="100%"  class="padding">
 <h2>수강생들의 후기</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
   

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"세모셈이 인정한 베테랑 교육자와 함께!"<br><span>어디사는 O씨,WAAAGH! </span></h4>
      </div>
      <div class="item">
        <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
      </div>
      <div class="item">
        <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>
</body>
</html>
