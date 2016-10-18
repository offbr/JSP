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

<!-- signin.css 부트스트랩을 cdn으로 가져왔으므로 정렬css 직접추가 -->
<style type="text/css">
.form-signin {
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


<br><br>

<!-- 로그인 폼 -->
<div class="container">

	<form class="form-signin" action="loginOk.jsp" method="post">
		<h2 class="form-signin-heading">Please sign in</h2>
		
		<label for="inputEmail" class="sr-only">Email address</label> 
		<input type="text" name="inputEmail" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
		
		<label for="inputPassword" class="sr-only">Password</label> 
		<input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password" required>
		
		<br>
		<button class="btn btn-lg btn-default btn-block" type="submit">Signin</button><br>
		
		<div class="container">
			<a href="register.jsp" class="text-sm" style="color: #949494;">Register</a> /
			<a href="#" class="text-sm" style="color: #949494;">Forget Password</a>
		</div>
	</form>
	
</div>
<!-- //로그인폼 -->

<br><br>


<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</div>
</html>