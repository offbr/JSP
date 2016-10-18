<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<% session.removeAttribute("adminOk"); %>
<h2>로그아웃 성공</h2><br>
[<a href="javascript:window.close()">창닫기</a>]
</body>
</html>