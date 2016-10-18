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
** 부서 자료 **<br>
<table border="1">
	<tr><th>부서번호</th><th>부서명</th><th>근무지</th><th>부서전화</th></tr>
	<c:forEach var="b" items="${data}">
		<tr>
			<td>${b.buser_no}</td>
			<td><a href="sawon.do?no=${b.buser_no}">${b.buser_name}</a></td>
			<td>${b.buser_loc}</td>
			<td>${b.buser_tel}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>