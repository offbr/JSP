<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
session = request.getSession(false); //있으면 읽고 없으면 안만든다
if(session == null || session.getAttribute("userid") == null){
	//response.sendRedirect("login.jsp");
	out.println("<script>alert('로그인 후 목록보기 가능');");
	out.println("location.href='login.jsp';</script>");
	return;
}
%>