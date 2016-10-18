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
<%@ include file="logincheck.jsp" %>
<h2> ** 사용자 목록 ** </h2>
<a href="userinsert.jsp">사용자 등록</a><br><br>
<table border="1">
	<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th></tr>
	<c:forEach var="u" items="${list}">
	<tr>
	<td>${u.userid}</td>
	<td>${u.password}</td>
	<td><a href="userview.do?userid=${u.userid}&command=view">${u.name}</a></td>
	<td>${u.email}</td>
	</tr>
	</c:forEach>
</table>
<br>
<a href="out.do?command=out">로그아웃</a>
</body>
</html>