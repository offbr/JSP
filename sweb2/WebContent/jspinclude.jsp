<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="go.css" rel="stylesheet" title="Default Style">
</head>
<body>
<%@ include file="top.jsp" %>
<h1>나의 페이지</h1>
<pre>
문서의 본문
..
.
.
.
.
.
.
..
</pre>
<!-- jsp action tag 사용 -->
<div style="color: fuchsia;"> 
<jsp:include page="in_action1.jsp"/>
</div>
<!-- include 와 jsp action tag 는 처리과정이 다르다 
include는 코드를 가져와서 본문에서 실행하고
jsp action tag 실행 후 결과를 가져와서 출력
-->
<div style="background-color: gray;">
<jsp:include page="in_action2.jsp"> 
	<jsp:param value="korea" name="msg"/>
</jsp:include>
</div>
<%@ include file="bottom.jsp" %>
</body>
</html>




















