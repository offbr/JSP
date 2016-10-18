
<%@page import="mypage.business.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="happy.mybatis.ProcessDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao" />
<%
	String g_id = request.getParameter("g_id");
	String g_pass = request.getParameter("g_pass");
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("g_id", g_id);
	map.put("g_pass", g_pass);
	List<GuestDto> list = (ArrayList)processdao.logincheck(map);
	
	if(list.size() > 0){
		session.setAttribute("idkey", g_id);
		if(g_id.equals("manager")){
			response.sendRedirect("../admin/manager.jsp");
		}else{
			response.sendRedirect("myinfo.jsp");			
		}
	}else{
		out.println("정보확인바람");
		response.sendRedirect("login.jsp");
	}
%>