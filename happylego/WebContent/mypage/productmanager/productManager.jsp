<%@page import="happy.mybatis.ProcessDao"%>
<%@page import="service.business.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao" />
<%ArrayList<ProductDto> list = (ArrayList)processDao.selectDataAll();%>

<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	 
	$("#search").click(function(){
		var search = $("#text").val();
		$("#div").load("sel2.jsp?type="+ search);
		$("#div").hide().load("sel2.jsp",function(){
			$(this).fadeIn();
		});
	});
	
	
});

function func(a){
	if(confirm("정말삭제하시겠습니까?")){
		window.open("delete.jsp?pno=" + a, "rr", "width=350,height=500,top=300,left=800");
	}
}

function func2(a){
	window.open("update.jsp?pno=" + a, "rr", "width=350,height=500,top=300,left=800");
}

function func3(a){
	
	window.open("insert.jsp?pno=" + a, "rr", "width=350,height=500,top=300,left=800");
}
</script>
</head>
<body>

검색 : <input type="text" id="text" size="20">&nbsp;&nbsp;<input type="button" value="검색" id="search">&nbsp;
<input type="button" onclick="func3(<%=list.size() %>)" value="상품추가">
<br><br>
<div id="div">
<table border="1" style="text-align: center;">
<tr><th>상품번호</th><th>상품명(수정할 상품을 클릭)</th><th>삭제</th><th>총상품재고</th><th>현재재고</th></tr>
<c:forEach var="s" items="<%=list %>">
<tr>
<td>${s.p_no }</td>
<td><a href="javascript:func2(${s.p_no })">${s.p_name }</a></td>
<td><a href="javascript:func(${s.p_no })">삭제</a></td>
<td style="color: gray;">3</td>
<td style="color: fuchsia;">${s.p_stock }</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>