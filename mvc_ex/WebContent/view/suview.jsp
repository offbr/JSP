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
<h2>결과</h2>
<%
ArrayList<String> myList = (ArrayList)request.getAttribute("data"); 
for(String i : myList){
	out.println(i);
}
%>

</body>
</html>