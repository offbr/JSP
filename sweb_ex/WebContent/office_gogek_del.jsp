<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String f_bun = request.getParameter("f_bun"); %>
<jsp:useBean id="pooling" class="pack.office_Pooling" />
<%
boolean b = pooling.deleteFData(f_bun);

if(b){
	response.sendRedirect("office_gogek_all.jsp");	
}
else{
%>
	<h2 style="margin-left: 150px; margin-top: 200px; color: red;">삭제 실패</h2>
<%
}
%>