<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class = "mypage.business.GuestBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao"/>
<%
	
 	boolean b = processdao.joinok(bean);
	if(b){
		//System.out.println("성공");
		response.sendRedirect("login.jsp");
	}else{
		//System.out.println("실패");
		response.sendRedirect("login.jsp");
	}
%>