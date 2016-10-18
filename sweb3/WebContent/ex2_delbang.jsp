<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% String code = request.getParameter("code"); %>
<jsp:useBean id="bean" class="pack.ex2_bangConnBean" />
<% 
	if(bean.deleteData(code))
		response.sendRedirect("ex2_bang.jsp");
	else
		response.sendRedirect("ex2_bang_fail.html");
%>
