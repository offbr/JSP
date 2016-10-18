<%@page import="service.business.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%
String type = request.getParameter("type");
%>
<%ArrayList<ProductDto> list = (ArrayList<ProductDto>)processDao.selectDataSeach(type);
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스신청</title>
<link rel="shortcut icon" href="../../images/lego_32.ico">
</head>
<body>
<table border="1" style="text-align: center;">
<tr><th>상품번호</th><th>상품명(수정할 상품을 클릭)</th><th>삭제</th><th>총상품재고</th><th>현재재고</th></tr>
<c:forEach var="s" items="<%=list %>">
<tr>
<td>${s.p_no }</td>
<td><a href="javascript:func2(${s.p_no })">${s.p_name }</a></td>
<td><a href="javascript:func(${s.p_no })">삭제</a></td>
<td>3</td>
<td>${s.p_stock }</td>
</tr>
</c:forEach>
</table>
</body>
</html>