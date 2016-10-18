<%@page import="java.util.ArrayList"%>
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

<c:forEach var="s" items="${sawonlist }">
<%int i = 0; %>
${s.sawon_name } 관리고객
<br>
<table>
<tr><th>고객번호</th><th>고객명</th><th>고객전화</th></tr>
<c:forEach var = "g" items="${gogeklist }">
<c:choose>
<c:when test="${g.gogek_damsano eq s.sawon_no }">
<%i++; %>

<tr><td>${g.gogek_no }</td><td>${g.gogek_name}</td><td>${g.gogek_tel}</td></tr>


</c:when>
</c:choose>

</c:forEach>
<% if( i == 0){ %>
<tr><td colspan="3">관리고객이 없습니다.</td></tr>
<%}else{ %>
<tr><td colspan="3"><%=i %></td></tr>
<%} %>
</table>

</c:forEach>

</body>
</html>