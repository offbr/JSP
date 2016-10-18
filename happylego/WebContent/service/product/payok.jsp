<%@page import="happy.mybatis.ProcessDao"%>
<%@page import="service.business.ProductDto"%>
<%@page import="service.business.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<jsp:useBean id="orderDto" class="service.business.OrderDto"/>
<jsp:useBean id="productDto" class="service.business.ProductDto"/>
<%
int a = 0;
String pno = request.getParameter("pno");
String id = (String)session.getAttribute("idkey");
ArrayList<OrderDto> list = (ArrayList<OrderDto>)processDao.selectdatalast();
ProductDto dto = processDao.selectDataId(pno);
int stock = Integer.parseInt(dto.getP_stock()) - 1;
String stock2 = Integer.toString(stock);
for (OrderDto ss:list) {
	 a = ss.getO_no();
}

orderDto.setO_no(a + 1);
orderDto.setO_gid(id);
orderDto.setO_pno(pno);
orderDto.setO_state("대여중");
processDao.insertData(orderDto);

productDto.setP_no(pno);
productDto.setP_stock(stock2);
processDao.updateDataStock(productDto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
</head>
<body>
<script>
window.close();

</script>
</body>
</html>