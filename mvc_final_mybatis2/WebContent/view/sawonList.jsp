<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h2>Company</h2>
<hr>
<table>
	
	<c:set var="count" value="${count = start}"/>
	
	<c:forEach var="s" items="${sawonlist}">	
	
	<c:if test="${sawon_name != s.sawon_name}"> <!-- 사원 이름 한번만 찍기 -->
	
	<c:if test="${count != start}">
	<tr><td colspan="3" style="text-align: center;">${count} 명</td></tr>
	</c:if>
	
	<c:set var="count" value="${count = 0}"/>
		<tr>
			<th colspan="2" style="color: blue;">${s.sawon_name}</th>
			<th>관리고객</th>
		</tr>
		
		<tr>
			<th>고객번호</th>
			<th>고객명</th>
			<th>고객전화</th>
		</tr>
		
	</c:if>
	
	<tr style="text-align: center;">
		<td>${s.gogek_no}</td>
		<td>${s.gogek_name}</td>
		<td>${s.gogek_tel}</td>
	</tr>
	
	<tr>	
		<c:if test="${s.gogek_name != null}"> <!-- 관리고객 0명은 넘기기 -->
			<c:set var="count" value="${count + 1}"/>
		</c:if>
<%-- 		<td colspan="3" style="text-align: center;">${count} 명</td> --%>
	</tr>
	
	<c:set var="sawon_name" value="${s.sawon_name}"/>
	
	</c:forEach>
	<tr>
	<td style="text-align: center;" colspan="3"><c:out value="${count} 명"/></td>
	</tr>
</table>

<hr>

</body>
</html>








