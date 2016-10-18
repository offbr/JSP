<%@page import="mypage.business.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>

<%
String m_email = request.getParameter("inputEmail");
String m_pass = request.getParameter("inputPassword");
Map<String, String> map = new HashMap<String, String>();
map.put("m_email", m_email);
map.put("m_pass", m_pass);

ArrayList<MemberDto> list = (ArrayList)processDao.loginCheck(map);
if(list.size() > 0){
	session.setAttribute("email_key", m_email);
	if(m_email.equals("admin")){
		response.sendRedirect("../admin/adminindex.jsp");
	}else{
		response.sendRedirect("mypageindex.jsp");			
	}
}else{
	%>
		<script>alert("이메일 또는 비밀번호가 틀립니다.");</script>
	<%
	response.sendRedirect("mypageindex.jsp");
}
%>