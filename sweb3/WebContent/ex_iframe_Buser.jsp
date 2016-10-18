<%@page import="pack.ex_BuserDto"%>
<%@page import="pack.ex_SawonDto"%>
<%@page import="pack.ex_Pooling_sawon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pooling_buser" class="pack.ex_Pooling_buser"/>
<% String name= request.getParameter("name"); %>
<jsp:setProperty property="name" name="pooling_buser" value="<%=name %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2> * 부서 자료 * </h2>
<%
ArrayList<ex_BuserDto> list = pooling_buser.getDataBuser();
for(ex_BuserDto b : list){
%>
	부서번호: <%= b.getBuser_no() %><br/>
	부 서 명: <%= b.getBuser_name() %><br/>
	부서전화: <%= b.getBuser_tel() %><br/>
	부서위치: <%= b.getBuser_loc() %><br/>
<%
}
%>	
</body>
</html>