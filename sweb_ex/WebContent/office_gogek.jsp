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
<h2>강남물산 고객용 뷰</h2>
<table border="1" style="width: 450px;">
<tr>
	<td>
		<% if(session.getAttribute("gogekname") == null){%>
			<%@include file="office_gogek_login_a.jsp" %>
		<%}else{ %>
			<%@include file="office_gogek_login_b.jsp" %>
		<%} %>
	</td>
</tr>
<tr>
	<td>
		<iframe name="iframe" width="100%" height="500px;" style="border-style: none;"></iframe>
	</td>
</tr>
</table>
</body>
</html>

