<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
session.setAttribute("idkey", id);
session.setMaxInactiveInterval(10); //10초 간 세션유지
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>세션 연습</h2>
<form action="session2.jsp" method="post">
* 좋아하는 영화를 선택 하시오*<br>
<input type="radio" name="movie" value="트루먼쇼" checked="checked">트루먼쇼
<input type="radio" name="movie" value="원데이">원데이
<input type="radio" name="movie" value="다크나이트">다크나이트
<p/>
<input type="submit" value="결과보기">
<input type="color">
</form>
</body>
</html>