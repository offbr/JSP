<%@page import="service.business.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%
String type = request.getParameter("type");

%>
<%ArrayList<ProductDto> list = (ArrayList<ProductDto>)processDao.selectDataPart(type);

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
</head>
<body>

<div class="row" style="width: 100%;"id="div">
      		<c:forEach var="s" items="<%=list %>">	      
      			<div class="col s3" style=" height: 440px; text-align: center;">
      				<div style=" margin-top: 40px; height: 400px; background-color: white; border: 1px solid #EAEAEA;">
      						<br><br><br>
    							<div style="margin-top: 40px;">
    						<a href="javascript:$('#modal${s.p_no }').openModal();" class="modal-trigger">
   									<img src="../../serviceimage/${s.p_image }.jpg" width="230px" height="170px">
   									<br><br><br>
   									<span style="color: orange; font-weight: bold; font-size: 17px;">${s.p_name }</span><br><br>
   									<span style="color: #8C8C8C; font-size: 13px;font-weight: bold; font-size: 17px;">${s.p_type } / ${s.p_size } / ${s.p_price }</span>
							</a>
   								</div>
						
					</div>
      			</div>  
			</c:forEach>
    </div>
</body>
</html>