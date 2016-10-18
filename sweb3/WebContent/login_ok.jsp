<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(id.equalsIgnoreCase("aa") && pwd.equals("11")){
	session.setAttribute("id", id);
}else{
	session.removeAttribute("id"); //session.invalidate(); 전체삭제
}
response.sendRedirect("login_main.jsp");
%>










