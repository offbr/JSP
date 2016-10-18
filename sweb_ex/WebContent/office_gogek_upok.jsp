<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<link href="default.css" rel="stylesheet" title="Default Style">
<jsp:useBean id="bean" class="pack.OfficeBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="pooling" class="pack.office_Pooling" />
<%
boolean b = pooling.updateFData(bean);

if(b){
	response.sendRedirect("office_gogek_all.jsp");	
}
else{
%>
	<h2 style="margin-left: 150px; margin-top: 200px; color: red;">수정 실패</h2>
<%
}
%>