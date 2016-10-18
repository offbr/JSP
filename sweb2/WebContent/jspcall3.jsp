<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background-color: black; color: lime;	
}
</style>
</head>
<body>
<h2>Server가 넘겨준 값</h2>
<%
// ReDirect
String data = request.getParameter("data");
out.println("ReDirect 자료는 " + data);
%>
<br>
<%
//Forward
String msg = (String)request.getAttribute("msg");
out.println("Forward 자료는 " + msg);

out.println("<br>");
ArrayList<String> mylist = (ArrayList)request.getAttribute("msg2");
out.println("나의 친구들 : ");
for(String f:mylist){
	out.println(f + " ");	
}
%>
</body>
</html>








