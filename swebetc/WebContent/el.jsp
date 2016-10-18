<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>EL 맞이하기</h2>
<% if(request.getParameter("user") == null){ %>
	<jsp:forward page="el.html"/>
<%} %>

표현식  : <%= request.getParameter("user") %><br/>
EL 사용 : ${param.user}
</body>
</html>