<%@page import="pack.Bean_ex_Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bean" class="pack.Bean_ex_Conn" />
<jsp:setProperty property="buserName" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
<style type="text/css">
.man{
	color: blue;
}
.woman{
	color: fuchsia;
}
</style>
</head>
<body>
<h2><jsp:getProperty property="buserName" name="bean"/></h2>
<table border="1">
	<tr><th>사번</th><th>직원명</th><th>직급</th><th>성별</th></tr>
<%
ArrayList<Bean_ex_Dto> list = bean.getData();
for(Bean_ex_Dto i : list){
	%>
	<tr>
		<td><%= i.getNo() %></td>
		<td><%= i.getName() %></td>
		<td><%= i.getJik() %></td>
	<% 
		if(i.getGen().equals("남")){
			out.println("<td class='man'>" + i.getGen() + "</td>");
		}else{
			out.println("<td class='woman'>" + i.getGen() + "</td>");
		}
	%>
	</tr>
<%	
}
%>
</table>
근무 인원수 : <%= bean.getCount() %> &nbsp;
평균급여 : <%= bean.getPay() %> 
<hr>
<a href="bean_ex.html">재검색</a>
</body>
</html>














