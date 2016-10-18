<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Company</h2>
<table border="1">
	<tr><th>부서번호</th><th>부서명</th></tr>
	<c:forEach var="b" items="${buserlist}">
	<tr>
		<td>${b.buser_no}</td>
		<td><a href="sawonlist.do?buser_no=${b.buser_no}">${b.buser_name}</a></td>
	</tr>
	</c:forEach>
</table>
</body>
</html>