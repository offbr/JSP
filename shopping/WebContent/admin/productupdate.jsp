<%@page import="shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr"/>
<%
ProductBean bean = productMgr.getProduct(request.getParameter("no"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>** 상품 수정 **</h2>
<%@ include file="admin_top.jsp" %>
<form action="productproc.jsp?flag=update" enctype="multipart/form-data" method="post" class="left"> <!-- enctype="multipart/form-data" 대량의 파일 및 업로드시(cos.jar이용 -->
<table style="width: 100%">
	<tr>
		<th colspan="2">상품수정<br></th>
	</tr>
	<tr>
		<td>품명</td>
		<td><input type="text" name="name" value="<%=bean.getName()%>"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price" value="<%=bean.getPrice()%>"></td>
	</tr>
	<tr>
		<td>설명</td>
		<td><textarea rows="5" cols="60" name="detail"><%=bean.getDetail()%></textarea></td>
	</tr>
	<tr>
		<td>재고량</td>
		<td><input type="text" name="stock" value="<%=bean.getStock()%>"></td>
	</tr>
	<tr>
		<td>이미지</td>
		<td>
			<img src="../data/<%=bean.getImage()%>" width="150">
			<input type="file" name="image" size="30">
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<br>
			<input type="hidden" name="no" value="<%=bean.getNo() %>">
			<input type="submit" value="상품 수정">
			<input type="button" value="수정 취소" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
<%@ include file="admin_bottom.jsp" %>
</body>
</html>