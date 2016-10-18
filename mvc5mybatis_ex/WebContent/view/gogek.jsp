<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>사번</th>
			<th>고객명</th>
			<th>전화</th>
			<th>성별</th>
		</tr>
		<c:forEach var="g" items="${data}">
			<tr>
				<td>${g.gogek_no}</td>
				<td>${g.gogek_name}</td>
				<td>${g.gogek_tel}</td>
				<td>
				<c:if var="m" test="${fn:substring(g.gogek_jumin,7,8) == '1'}">남
				<c:set var="mcount" value="${mcount + 1}" />
				</c:if> 
				<c:if var="g" test="${fn:substring(g.gogek_jumin,7,8) == '2'}">여
				<c:set var="gcount" value="${gcount + 1}" />
				</c:if>
				</td>
			</tr>
			<c:set var="count" value="${count + 1}" />
		</c:forEach>
	</table>
	남자 : ${mcount}
	<br> 여자 : ${gcount}
	<br> 인원수 : ${count}
	<br> ${fn:length(data)}
</body>
</html>




