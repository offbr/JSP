<%@page import="pack.OfficeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
	String name = "";
	if(request.getParameter("name") == null) name = "%";
	else name = request.getParameter("name");
%>
<jsp:useBean id="pooling" class="pack.office_Pooling"/>
<link href="default.css" rel="stylesheet" title="Default Style">
<table border="1">
	<tr>
		<th>고객번호</th><th>고객명</th><th>주민번호</th><th>고객전화</th>
	</tr>
	
	<%
	ArrayList<OfficeBean> list = pooling.getGogek(name);
	for(OfficeBean s : list){
	%>
		<tr>	
		<td><%=s.getGogek_no() %></td>
		<td><%=s.getGogek_name() %></td>
		<td><%=s.getGogek_jumin() %></td>
		<td><%=s.getGogek_tel() %></td>
		</tr>
	<%
	}
	 %>
</table>