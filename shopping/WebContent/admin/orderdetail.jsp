<%@page import="shop.product.ProductBean"%>
<%@page import="shop.order.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="shop.order.OrderMgr"/>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr"/>
<%
OrderBean order = orderMgr.getOrderDetail(request.getParameter("no")); //주문번호 가지고오기
ProductBean product = productMgr.getProduct(order.getProduct_no()); //상품자료 가지고오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>** 주문 상세 보기 **</h2>
<%@ include file="admin_top.jsp" %>
<form action="orderproc_admin.jsp" name="detailFrm" method="post">
<table style="width: 100%">
	<tr>
		<td>고객 아이디 : <%=order.getId() %></td>
		<td>주 문 번 호 : <%=order.getNo() %></td>
		<td>상 품 번 호 : <%=product.getNo() %></td>
		<td>상 품 명 : <%=product.getName() %></td>
	</tr>
	<tr>
		<td>상 품 가 격 : <%=product.getPrice() %></td>
		<td>주 문 수 량 : <%=order.getQuantity() %></td>
		<td>재 고 수 량 : <%=product.getStock() %></td>
		<td>주 문 일 : <%=order.getSdate() %></td>
	</tr>
	<tr>
		<td colspan="4">총 결제금액 :
			<%=Integer.parseInt(order.getQuantity()) * Integer.parseInt(product.getPrice()) %> 원	
	</tr>
	<tr>
		<td colspan="4" style="text-align: center;">
		주문 상태 :
		<select name="state">
			<option value="1">접수</option>
			<option value="2">입금확인</option>
			<option value="3">배송준비</option>
			<option value="4">배송중</option>
			<option value="5">처리완료</option>
			<script>
				document.detailFrm.state.value = <%=order.getState()%>
			</script>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="수 정" onclick="orderUpdate(this.form)" />
			<input type="button" value="삭 제" onclick="orderDelete(this.form)" />
			<input type="hidden" name="no" value="<%=order.getNo() %>"/>
			<input type="hidden" name="flag">
		</td>
	</tr>
</table>
</form>
<%@ include file="admin_bottom.jsp" %>
</body>
</html>
















