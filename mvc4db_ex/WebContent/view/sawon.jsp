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
** 사원 자료 **<br>
<table border="1">
	<tr><th>사원번호</th><th>직원명</th><th>직급</th></tr>
	<c:forEach var="s" items="${data}">
		<tr>
			<td>${s.sawon_no}</td>
			<td>${s.sawon_name}</td>
			<td>${s.sawon_jik}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>