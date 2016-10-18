<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if((id.equalsIgnoreCase("admin") && pwd.equals("123")) || 
	(id.equalsIgnoreCase("user") && pwd.equals("111"))){
	session.setAttribute("id", id);
	response.sendRedirect("loginok.jsp");
}else{
	response.sendRedirect("loginfail.html");
}
%>