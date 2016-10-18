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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="../../js/registerCheck.js"></script>

<style type="text/css">
label{
	color: #454545;
}

.form-register{
max-width: 330px;
padding: 15px;
margin: 0 auto;
}
</style>

</head>
<div class="container">
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->

<!-- 회원가입 폼 -->
<div class="container">

	<form class="form-register" name="register" action="registerOk.jsp" method="post">
		<h2 class="form-signin-heading">User Profile</h2>
		
		<br>
		<label>Email address</label>
		<input type="email" name="inputEmail" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
		<input type="hidden" name="inputEmailOk" id="inputEmailOk">
		<input type="button" id="emailCheck" value="Email Check" class="form-control"><br>
		
		<label>Name</label>
		<input type="text" name="inputName" id="inputName" class="form-control" placeholder="Name" required autofocus>
		
		<br>
		<label>Passwrod</label> 
		<input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password" required>
		
		<br>
		<label>Confirm Passwrod</label> 
		<input type="password" name="inputPasswordOk" id="inputPasswordOk" class="form-control" placeholder="Confirm Password" required>
		
		<br>
		<label>address</label> 
		<input type="text" name="postcode" id="postcode" class="form-control" placeholder="PostCode" readonly="readonly" required>
		<input type="button" onclick="daumPostcode()" value="PostCode Search" class="form-control"><br>
		<input type="text" name="address1" id="address1" placeholder="address" class="form-control" readonly="readonly">
		<input type="text" name="address2" id="address2" placeholder="address" class="form-control">
	
		<br>
		<label>Tel</label> 
		<input type="text" name="inputTel" id="inputTel" class="form-control" placeholder="Tel" required>
		
		<br>
		<button class="btn btn-lg btn-default btn-block" type="submit" id="btnJoin">Join</button><br>
	</form>
	
</div>
<!-- //회원가입 폼 -->

<!-- 우편번호 찾기 폼 
<input type="text" id="postcode" placeholder="우편번호">
<input type="button" onclick="daumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="address" placeholder="주소">
<input type="text" id="address2" placeholder="상세주소">
 -->

 
<!-- 우편번호 검색 -->

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../js/address.js" type="text/javascript"></script>

<!-- //우편번호 검색 -->


<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</div>
</html>




