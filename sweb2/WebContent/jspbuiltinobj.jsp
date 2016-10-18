<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id"); // request : 내장객체
String pwd = request.getParameter("pwd"); // request : 내장객체
	if(!(id.equals("aa") && pwd.equals("11"))){
		response.sendRedirect("jspbuiltin.html"); //response : 내장객체
	}
String[] names = request.getParameterValues("name");
String job = request.getParameter("job");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp</title>
<style type="text/css">
body{
	background-color: black; color: lime;
}
</style>
</head>
<body>
** 입력한 자료 확인 **<br>
아이디 : <% out.println(id + "<br>"); %> <!-- out : 내장객체 -->
비밀번호 : <%=pwd %><br>
이 름 : <% out.println(names[0] + ", 닉네임은 " + names[1] + "<br>"); %>
직업은 <%=job %>
<hr>
기타 정보 : <br>
client ip : <%= request.getRemoteAddr() %><br/>
client domain :<%= request.getRemoteHost() %><br/>
protocol : <%= request.getProtocol() %><br/>
method : <%= request.getMethod() %><br/>
<br/>
server domain : <%= request.getServerName() %><br/>
server buffer size : <%= response.getBufferSize() %><br/>
server charset : <%= response.getCharacterEncoding() %><br/>
<br/>
context path : <%= application.getContextPath() %><br> <!-- application : 내장객체 -->
session : <%= pageContext.getSession() %> <!-- pageContext : 내장객체  -->
<!--  session, page(현재페이지), config, exception --> 
</body>
</html>





















