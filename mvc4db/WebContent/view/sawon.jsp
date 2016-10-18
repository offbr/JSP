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
	<tr><th>사원번호</th><th>사원명</th><th>부서번호</th><th>직급</th><th>연봉</th><th>입사일</th><th>성별</th></tr>
	<c:forEach var="s" items="${data}">
		<tr>
			<td>${s.sawon_no}</td>
			<td>${s.sawon_name}</td>
			<td>${s.buser_num}</td>
			<td>${s.sawon_jik}</td>
			<td>${s.sawon_pay}</td>
			<td>${s.sawon_ibsail}</td>
			<td>${s.sawon_gen}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>