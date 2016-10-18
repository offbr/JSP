<%@page import="mypage.business.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mono.mybatis.ProcessDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.getParameter("utf-8"); %>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<% 

String m_email = request.getParameter("email");

ArrayList<MemberBean> list = processDao.emailCheck(m_email);


if(list.size() == 0){
%>
사용 가능한 이메일입니다
<a href ="#" onclick = "opener.document.register.inputEmail.focus(); window.close();">사용하기</a>
<%	
}else{
%>
이미 사용중인 이메일입니다.
<a href ="#" onclick = "opener.document.register.inputEmail.value=''; window.close();">재입력</a>
<%	
}
%>




