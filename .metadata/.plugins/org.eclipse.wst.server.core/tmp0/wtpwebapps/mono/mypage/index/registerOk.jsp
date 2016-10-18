<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="mypage.business.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>

<% 
String m_email = request.getParameter("inputEmail");
String m_name = request.getParameter("inputName");
String m_pass = request.getParameter("inputPassword");
String m_tel = request.getParameter("inputTel");
String m_postcode = request.getParameter("postcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String m_address = address1 + " " + address2;

bean.setM_email(m_email);
bean.setM_name(m_name);
bean.setM_pass(m_pass);
bean.setM_tel(m_tel);
bean.setM_postcode(m_postcode);
bean.setM_address(m_address);

if(processDao.register(bean)){
	response.sendRedirect("mypageindex.jsp");
}else{
%>
 	<script>alert("다시 회원가입해주세요.");</script>
<%
	response.sendRedirect("mypageindex.jsp");
}
%>







