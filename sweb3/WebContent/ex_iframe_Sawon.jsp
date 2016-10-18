<%@page import="pack.ex_SawonDto"%>
<%@page import="pack.ex_Pooling_sawon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pooling_sawon" class="pack.ex_Pooling_sawon"/>
<jsp:useBean id="pooling_buser" class="pack.ex_Pooling_buser"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2> * 직원 자료 * </h2>
<table border="1">
	<tr><th>사번</th><th>이름</th><th>직급</th></tr>
<%
ArrayList<ex_SawonDto> list = pooling_sawon.getDataSawon();
for(ex_SawonDto s : list){
%>
	<tr>
		<td><%= s.getSawon_no()%></td>
		<td><a href="http://localhost/sweb3/ex_iframe_Buser.jsp?name=<%= s.getSawon_name()%>" target="iframe"><%= s.getSawon_name()%></a></td>
		<td><%= s.getSawon_jik()%></td>
		<!--<jsp:setProperty property="name" name="pooling_buser" value="<%= s.getSawon_name()%>"/>-->
	</tr>
<%
}
%>	
</table>
<iframe width="200" height="200" name="iframe"></iframe>
</body>
</html>