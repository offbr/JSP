<%@page import="product.business.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<% 
String p_no = request.getParameter("p_no");

ProductDto dto = processDao.productView(p_no);
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
#product_detail {
	color: #444444;
	letter-spacing: 2px;
}
.price{
	color: #949494;
	letter-spacing: normal;
}
.product_frm{
	border-top: 1px solid #f0f0f0;
	border-bottom: 1px solid #f0f0f0;
}
</style>

</head>

<div class="container">
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->
<br>

<!-- 상품표시 -->
<div class="container-fluid">
<div class="row">	

	<div class="col-md-6 text-center">
    <a href="#" class="thumbnail" style="border: none;" onclick="javascript:goProduct(${p.p_no});">
      <img style="border: none;" src="../../productimages/<%=dto.getP_detailimage()%>.jpg" alt="">
    </a>
  	</div>
  	
  	<div class="col-md-6 text-center" style="border: 7px double; color: #f0f0f0;">
  		<div id="product_detail">
  		<br>
  		<h6><%=dto.getP_brand()%></h6>
      	<h4><%=dto.getP_name()%></h4>
 	  	<p class="pprice"><span class="price">￦ <%=dto.getP_price()%></span></p>
 	  	<form action="cart.jsp" method="post" class="product_frm" style="padding-top: 10px; padding-bottom: 10px;">
 	  	<input type="hidden" name="p_no" value="<%=dto.getP_no()%>">
 	  	<p class="pprice"><span class="price">size : <%=dto.getP_size()%></span></p>
 	  	<br>
 	  	<h5 style="font-weight: bold;">QUANTITY</h5>
 	  		<input type="text" style="text-align: center;" value="1" size="1" name="qnantity"><br><br>
 	  		<a href="../cart/cart.jsp"><button type="button" class="btn btn-default btn-lg" style="">ADD TO CART</button></a>
 	  	</form>
 	  	<h6>by 5BORONYC</h6>
 	  	</div>
  	</div>

</div>
</div>
<!-- //상품표시 -->



<br>
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</div>
</html>











