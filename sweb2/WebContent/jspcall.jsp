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
<h2>서블릿에 의해 호출된 파일</h2>
<%
request.setCharacterEncoding("utf-8");
//ReDirect 방식
String data = request.getParameter("data");
out.println("<b>ReDirect으로 넘어온 자료는 : " + data + "</b>");

out.println("<br>");
//Forwarding으로 넘어온 값
String data2 = (String)request.getAttribute("mydata");
out.println("<b>Forwarding으로 넘어온 자료는 : " + data2 + "</b>");
%>
</body>
</html>








