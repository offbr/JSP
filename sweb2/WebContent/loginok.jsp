<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<table>
	<tr>
		<td colspan="2">
			해당 페이지로 이동
		</td>
	</tr>
	<%
	String id = (String)session.getAttribute("id");
	if(id.equals("admin")){
	%>
	<tr>
		<td><%= id %></td>
		<td><a href="http://daum.net">관리자</a></td>		
	</tr>
	<%	
	}else{
	%>
	<tr>
		<td><%= id %></td>
		<td><a href="http://naver.com">사용자</a></td>		
	</tr>
	<%	
	}
	%>
</table>
<p> application 객체:</p>
<%= application.getRealPath("/") %>
</body>
</html>













