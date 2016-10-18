<%@page import="service.business.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao" />
<%
String pno = request.getParameter("pno");
ProductDto dto = processDao.selectDataId(pno);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해피레고</title>
<link rel="shortcut icon" href="../../images/lego_32.ico">
</head>
<body>
<c:set var="aa" value="<%= dto.getP_size()%>"></c:set>

<form action="update_proc.jsp" enctype="multipart/form-data" method="post">
		상품번호 : <input type="text" value="<%=dto.getP_no()%>" name="p_no"><br>
      	상품명 : <input type="text" value="<%=dto.getP_name()%>" name="p_name"><br>
      	가격 : <input type="text" value="<%=dto.getP_price()%>" name="p_price"><br>
      	사이즈 : <select name="p_size">
      	
      	<c:if test="${aa == 'M'}">
      	<option value="M" selected="selected">M</option>
      	<option value="L">L</option>
      	<option value="XL">XL</option>
      	</c:if>
      	
      	<c:if test="${aa == 'L'}">
      	<option value="M">M</option>
      	<option value="L" selected="selected">L</option>
      	<option value="XL">XL</option>
      	</c:if>
      	
      	<c:if test="${aa == 'XL'}">
      	<option value="M">M</option>
      	<option value="L">L</option>
      	<option value="XL" selected="selected">XL</option>
      	</c:if>
      	
      	</select><br>
      	재고(*3) : <input type="text" value="<%=dto.getP_stock()%>" name="p_stock"><br> 
      	이미지(*jpg) : <input type="file" name="p_image"><br>
      	타입 : <input type="text" value="<%=dto.getP_type()%>" name="p_type"><br>
      	설명 : <textarea rows="10" cols="40" name="p_content"><%=dto.getP_content()%></textarea><br>
      	<button type="submit">수정</button>
      	<button onClick="window.close()">닫기</button>
</form>

</body>
</html>