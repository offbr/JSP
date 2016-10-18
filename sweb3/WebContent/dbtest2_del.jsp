<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String code = request.getParameter("code"); %>
<jsp:useBean id="connbeanPooling" class="pack.ConnbeanPooling" />
<%

if(connbeanPooling.deleteData(code))
	response.sendRedirect("dbtest2.jsp");
else
	response.sendRedirect("dbtest2_fail.html");

%>