<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bean" class="pack.OfficeBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="pooling" class="pack.office_Pooling" />
<%
boolean b = pooling.insertFData(bean);

if(b){ //response.sendRedirect("office_gogek.jsp");
	response.sendRedirect("office_gogek_all.jsp");
}else{ //System.out.println(b);
%>
	<h2 style="margin-left: 150px; margin-top: 200px; color: red;">등록 실패</h2>
<%
}
%>
