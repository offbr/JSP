<%@page import="shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr"/>
<%
String no = request.getParameter("no");
ProductBean bean = productMgr.getProduct(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>** 상품 상세보기 **</h2>
<%@ include file="guest_top.jsp" %>
<form action="cartproc.jsp">
<table style="width: 100%">
	<tr>
		<td style="width: 20%">
			<img src="../data/<%=bean.getImage()%>" width="150">
		</td>
		<td style="width: 50%">
			<table style="width: 100%">
				<tr><td>번호 : </td><td><%=bean.getNo() %></td></tr>
				<tr><td>품명 : </td><td><%=bean.getName() %></td></tr>
				<tr><td>가격 : </td><td><%=bean.getPrice() %></td></tr>
				<tr><td>등록일 : </td><td><%=bean.getSdate() %></td></tr>
				<tr><td>재고 : </td><td><%=bean.getStock() %></td></tr>
				<tr>
				<td>주문 수 : </td>
				<td>
					<input type="text" name="quantity" value="1" size="5" style="text-align: center; color: white;">
				</td>
				</tr>
			</table>
		</td>
		<td>
			<b>* 상품 설명 *</b><br><!-- style="vertical-align: top;" 위로 정렬 -->
			<%=bean.getDetail() %>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: center;">
			<br>
			<input type="hidden" name="product_no" value="<%=bean.getNo()%>">
			<input type="submit" value="장바구니에 담기">
			<input type="button" value="이전으로 이동" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
<%@ include file="guest_bottom.jsp" %>
</body>
</html>






