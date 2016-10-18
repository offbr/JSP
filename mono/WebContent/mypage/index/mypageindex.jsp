<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    

String m_email = (String)session.getAttribute("email_key");

if(m_email == null){
	response.sendRedirect("login.jsp");
}



%>
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
<br><br><br><br>

<div class="container text-center">
<div class="btn-group" role="group" aria-label="...">
  <a href="logout.jsp"><button type="button" class="btn btn-default">Logout</button></a>
  <a href="updateInfo.jsp"><button type="button" class="btn btn-default">Information</button></a>
  <a href="#"><button type="button" class="btn btn-default">Cart</button></a>
  <a href="#"><button type="button" class="btn btn-default">Order</button></a>
</div>
</div>


<br><br><br><br>
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</div>
</html>