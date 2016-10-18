<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
** 취미 선택 결과 **<p/>

legacy : <br>
<%
ArrayList<String> myList = (ArrayList)request.getAttribute("data"); 
for(String i : myList){
	out.println(i);
}
%>

<hr>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

jstl : <br>
<c:forEach var="h" items="${data}">
	${h}<br>
</c:forEach>

</body>
</html>