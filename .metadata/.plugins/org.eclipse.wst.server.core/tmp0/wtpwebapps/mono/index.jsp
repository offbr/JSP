<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>mono</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hind" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>

<!-- 메인 메뉴바 가운데 정렬 -->
<style>
.nav-tabs>li, .nav-pills>li {
	float: none;
	display: inline-block;
}
.nav-tabs, .nav-pills {
	text-align: center;
}
body {
	font-family: 'Montserrat', sans-serif;
}
a{
 color: #454545;
}
</style>

</head>
<div class="container">
<body>

<!-- header -->

<article>
<div class="container-fluid">
	<div class="pull-right">
		<br>
		<a href="localhost:8080/mono/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>&nbsp;
		<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>&nbsp;
		<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
	</div>
</div>
</article>
<!-- //상단 아이콘 -->

<br><br>

<!-- 메인이미지 -->
<div class="container">
	 <!-- 가운데 정렬 center-block 크기를 지정해줘야한다 -->
	<a href="localhost:8080/mono/index.jsp"><img src="images/logo.png" class="img-responsive center-block" alt="Responsive image"></a>
</div>
<!-- //메인이미지 -->

<br><br>

<!-- 메인메뉴 -->
<div class="container">
  <ul class="nav nav-tabs" style="border-top: solid 1px; border-top-color: #dddddd;">
    <li><a href="index.jsp" data-toggle="tab">HOME</a></li>
    <li><a href="shop/deck/deck.jsp">SHOP</a></li>
    <li><a href="board/qna/qnaList.jsp">Q&A</a></li>
    <li><a href="mypage/index/mypageindex.jsp">MYPAGE</a></li>
  </ul>
</div>
<!-- //메인메뉴 -->

<!-- //header -->

<br><br>

<!-- 메인 배경 -->
<div class="container">
<a href="localhost:8080/mono/"><img src="images/5boro_main.jpg" class="img-responsive center-block" alt="Responsive image"></a>
</div>
<!-- //메인 배경 -->
<br><br>

<!-- footer -->
<!-- 하단 이미지 -->
<div class="container">
<a href="localhost:8080/mono/"><img src="images/logo.png" class="img-responsive center-block" alt="Responsive image"></a>
<br><br>
</div>
<!-- //하단 이미지 -->

<!-- 제작자표시 -->
<div class="container text-center" style="font-family: 'Hind', sans-serif;">
<label style="color: #949494;">Copyright © 2016 NYC •</label>
<label> JangHyunJin</label>
<label style="color: #949494;">by Underground Media •</label> 
<label> Shopping Cart by JangHyunJin</label>
</div>
<!-- //제작자표시 -->

<br>
<!-- //footer -->

</body>
</div>

</html>







