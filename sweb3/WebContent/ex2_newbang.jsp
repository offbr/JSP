<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bangDto" class="pack.ex2_bangDto"/>
<jsp:setProperty property="*" name="bangDto"/>
<jsp:useBean id="bean" class="pack.ex2_bangConnBean" />
<% 
	if(bean.insertData(bangDto))
		response.sendRedirect("ex2_bang.jsp");
	else
		response.sendRedirect("ex2_bang_fail.html");
	%>
}

