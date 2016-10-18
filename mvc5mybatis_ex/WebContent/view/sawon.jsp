<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr><th>사번</th><th>직원명</th><th>부서명</th><th>직급</th></tr>
	<c:forEach var="s" items="${data}">
	<tr>
		<td>${s.sawon_no}</td>
		<td>${s.sawon_name}</td>
		<td>${s.buser_name}</td>
		<td>${s.sawon_jik}</td>
		<c:set var="count" value="${count + 1}"/>
	</tr>
	</c:forEach>
</table>
인원수 : ${count}
</body>
</html>