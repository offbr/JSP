<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class = "mypage.business.GuestBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao" />
<%

	String g_id = request.getParameter("g_id");
	Map<String, String> map = new HashMap<String, String>();
	map.put("g_id", bean.getG_id());
	map.put("g_pass", bean.getG_pass());
	map.put("zipcode", bean.getZipcode());
	map.put("g_address", bean.getG_address());
	map.put("g_phone", bean.getG_phone());
	map.put("g_mail", bean.getG_mail());

	boolean b = processdao.update(map);
	
	if(b){
		response.sendRedirect("myinfo.jsp");
	}else{
		response.sendRedirect("myinfo.jsp");
	}
%>