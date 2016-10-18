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
<title>상품 보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>** 상품 상세보기 **</h2>
<%@ include file="admin_top.jsp" %>
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
				<tr><td>재고량 : </td><td><%=bean.getStock() %></td></tr>
			</table>
		</td>
		<td>
			<b>* 상품 설명 *</b><br><!-- style="vertical-align: top;" 위로 정렬 -->
			<%=bean.getDetail() %>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: center;">
			<a href="javascript:productUpdate('<%=bean.getNo() %>')"><button>수정하기</button></a>
			<a href="javascript:productDelete('<%=bean.getNo() %>')"><button>삭제하기</button></a>
		</td>
	</tr>
</table>
<%@ include file="admin_bottom.jsp" %>

<form action="productupdate.jsp" name="updateFrm" method="post">
<input type="hidden" name="no">
</form>
<form action="productproc.jsp?flag=delete" name="deleteFrm" method="post">
<input type="hidden" name="no">
</form>
</body>
</html>





