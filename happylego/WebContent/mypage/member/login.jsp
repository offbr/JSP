<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 



%>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<style type="text/css">
#g_id:focus +  label{
	border: none;
	
input:-webkit-autofill;
input:-webkit-autofill:hover;
input:-webkit-autofill:focus;
input:-webkit-autofill:active; {
    transition: background-color 5000s ease-in-out 0s;
}
}
</style>

<link rel = "stylesheet" type = "text/css" href = "../../css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

<link rel="shortcut icon" href="../../images/lego_32.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "../../js/mypage.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

</head>
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->

<div class="container">
	<div class="row">

<div class="pen-title">

</div>
<div class="container">
  <div class="card"></div>
  <div class="card" style = "background-color: #ffa500">
    <h1 class="title">Login</h1>
	<form action="loginproc.jsp" name = "loginfrm" id = "loginfrm" autocomplete="off">
      <div class="input-container">
        <input type="text" id="g_id" name = "g_id" required="required"/>
        <label for="g_id">id</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id="g_pass" name = "g_pass" required="required"/>
        <label for="g_pass">Password</label>
        <div class="bar"></div>
      </div>
      <div class="button-container">
        <button id = "login"><span>Login</span></button>
      </div>
      <div class="footer"><a href="#"> </a></div>
    </form>
  </div>
 <div class="card alt">
    <div class="toggle" style="color: white;">Join</div>
    <h1 class="title">Join
      <div class="close">close</div>
    </h1>
    <form action="joinproc.jsp" name = "joinfrm" id="joinfrm" method = "post" autocomplete="off">
      <div class="input-container">
      <input type = "button" id = "idcheck" value = "아이디중복검사">
        <input type="text" name="g_id" id = "g_id" required="required"/>
        <label for="g_id">ID</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id = "g_pass" name="g_pass" required="required"/>
        <label for="g_pass">Password</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" name="g_checkpass" id = "g_checkpass" required="required"/>
        <label for="g_checkpass">Repeat Password</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="text" name="g_name" id = "g_name" required="required" />
        <label for="g_name">name</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="text" name="g_phone" id = "g_phone" required="required"/>
        <label for="g_phone">phone</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="text" name="g_mail" id = "g_mail" required="required"/>
        <label for="g_mail">mail</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type = "button" id = "zip" value = "검색">
        <input type="text" name="zipcode" id = "zipcode" required="required"/>
        <label for="zipcode">zipcode</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="text" name="g_address" required="required"/>
        <label for="g_address">address</label>
        <div class="bar"></div>
      </div>
      
      <div class="button-container">
        <button id = "joinok"><span>Next</span></button>
      </div>
    </form>
  </div>
</div>
<!-- Portfolio-->
	</div>
</div>


<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</html>