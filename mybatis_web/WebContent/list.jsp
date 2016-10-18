<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<% ArrayList<DataDto> list = (ArrayList)processDao.selectDataAll(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>** 상품 자료(myBatis) **</h2>
<a href="ins.html">상품추가</a><p/>
<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>
<c:forEach var="s" items="<%=list %>">
	<tr>
		<td><a href="delete.jsp?code=${s.code}">${s.code}</a></td>
		<td><a href="update.jsp?code=${s.code}">${s.sang}</a></td>
		<td>${s.su}</td>
		<td>${s.dan}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>
