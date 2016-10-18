<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>** 회원 자료(myBatis) **</h2>
<a href="ins.jsp">회원 추가</a><p/>
<table border="1">
	<tr>
		<th>id</th><th>name</th><th>password</th><th>regdate</th>
	</tr>
<% 
ArrayList<DataDto> list = (ArrayList)processDao.selectDataAll();

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시:mm");
if(list == null){
	out.println("<tr><td colspan='4'>자료 없음</td></tr>");
}else{
%>
<c:forEach var="s" items="<%=list %>">
	<tr>
		<td><a href="del.jsp?id=${s.id}">${s.id}</a></td>
		<td><a href="up.jsp?id=${s.id}">${s.name}</a></td>
		<td>${s.password}</td>
		<td><%// dateFormat.format()%>${s.regdate}</td>
	</tr>
</c:forEach>
<%	
}
%>
<tr><td colspan="4">id 클릭은 삭제, name은 수정</td></tr>
</table>
</body>
</html>
