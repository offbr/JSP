<%@page import="pack.OfficeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="pooling" class="pack.office_Pooling"/>
<%
String gogek_no = request.getParameter("gogek_no");
String gogek_name = request.getParameter("gogek_name");
ArrayList<OfficeBean> list = pooling.getDataGogek();
	for (OfficeBean s : list) {
	 	if (s.getGogek_no().equals(gogek_no) && s.getGogek_name().equalsIgnoreCase(gogek_name)) {
			session.setAttribute("gogekname", gogek_name);
			response.sendRedirect("office_gogek.jsp");
			return;
		} else {
			session.removeAttribute("gogekname"); //session.invalidate(); 전체삭제
		}
	}
	response.sendRedirect("office_gogek.jsp");
%>









