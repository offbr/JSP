<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<jsp:useBean id="bean" class="pack.Para_exBean"/>
<jsp:setProperty property="*" name="bean"/>

<jsp:useBean id="process" class="pack.Para_exProcess"></jsp:useBean>
<jsp:setProperty property="para_exBean" name="process" value="<%= bean %>"/>

선택하신 과일은 <b><jsp:getProperty property="fruit" name="bean"/></b> 
<br/>
정가 <b><jsp:getProperty property="money" name="bean"/></b> 원
<br/>
할인율 <b><jsp:getProperty property="sale" name="bean"/></b>%
<br/>
할인가격 <b><jsp:getProperty property="saleMoney" name="process"/></b> 원
<br/>
총 구매가는 <b><jsp:getProperty property="tot" name="process"/></b> 원
<hr>
<a href="para_ex.html">다시 구매하기</a>
</body>
</html>




