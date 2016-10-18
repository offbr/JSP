<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.business.OrderDto"%>
<%@page import="mypage.business.GuestDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%

String gopage = request.getParameter("gopage"); 
if(gopage == null) gopage = "index";

   String g_id = (String)session.getAttribute("idkey");

   if(g_id == null){
		response.sendRedirect("../member/login.jsp");
}
 
   
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>

<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

<link rel="shortcut icon" href="../../images/lego_32.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function go(mode){
	document.frm.gopage.value = mode;
	document.frm.submit();
}
</script>
</head>
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>

<!-- //header -->

<article class="sub_visual sub01">
    <h3 class="big_title">마이페이지</h3>
    <h4 class="sub_title">해피레고를 찾아주셔서 감사합니다.</h4>
</article>

<div class="btn_list">
	<a href="javascript:go('memberUpdate')" class="type02">정보수정</a>
	<a href="javascript:go('orderList')" class="type02">이용현황</a>
</div>
<form action="myinfo.jsp" name="frm" method="post">
<input type="hidden" name="gopage" value="">
<input type="hidden" name="g_id" value="<%=g_id%>">
</form>

<%if(gopage.equals("memberUpdate")){%>
	<%@ include file="memberUpdate.jsp" %>
<%}else if(gopage.equals("orderList")){%>
	<%@ include file="orderList.jsp" %>
<%}%>



<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->
  
</body>
</html>





