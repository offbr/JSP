<%@page import="product.business.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="bean" class="product.business.ProductBean"/>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<%
ArrayList<ProductBean> list = processDao.productList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>mono</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.brand{
	text-transform: uppercase;
	font-size: 10px;
}
label{
	text-transform: uppercase;
	font-size: 12px;
}
.money{
	color: #949494;
	font-size: 12px;
}
</style>

<script>
function goProduct(p_no){
	document.pFrm.p_no.value = p_no;
	document.pFrm.submit();
}

</script>

</head>
<div class="container">
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->
<br>

<!-- subMenu -->
<%@ include file="../product/shopLink.jsp" %>
<!-- //subMenu -->

<br><br>

<!-- 상품표시 -->
<div class="container">
<div class="row">
<c:forEach var="p" items="<%=list%>">
	
	<div class="col-sm-6 col-md-4 text-center">
    <a href="#" class="thumbnail" style="border: none;" onclick="javascript:goProduct(${p.p_no});">
      <img style="border: none;" src="../../productimages/${p.p_image}.jpg" alt="">
      <label class="brand">${p.p_brand}</label><br>
 	  <label>${p.p_name}</label><br>
 	  <label class="money">￦ ${p.p_price}</label>
    </a>
  	</div>

</c:forEach>
</div>
</div>
<!-- //상품표시 -->



<!-- 상품번호 -->
<form action="../product/product.jsp" method="post" name="pFrm">
	<input type="hidden" name="p_no">
</form>
<!-- 상품번호 -->



<br><br>
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</div>
</html>