<%@page import="pack.OfficeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="pooling" class="pack.office_Pooling"/>
<%
String sawon_no = request.getParameter("sawon_no");
String sawon_name = request.getParameter("sawon_name");
ArrayList<OfficeBean> list = pooling.getDataSawon();
	for (OfficeBean s : list) {
		if (s.getSawon_no().equals(sawon_no) && s.getSawon_name().equalsIgnoreCase(sawon_name)) {
			session.setAttribute("sawonname", sawon_name);
			response.sendRedirect("office_sawon.jsp");
			return;
		} else {
			session.removeAttribute("sawonname"); //session.invalidate(); 전체삭제
		}
	}
	response.sendRedirect("office_sawon.jsp");
%>









