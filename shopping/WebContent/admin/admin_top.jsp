<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String adminid = (String)session.getAttribute("adminKey");
if(adminid == null){
	response.sendRedirect("adminlogin.jsp");
}
%>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<table style="width: 100%; text-align: center;">
	<tr style="background-color: green; text-align: center;">
		<td><a href="../guest/guest_index.jsp" class='top'>홈페이지</a></td>
		<td><a href="adminlogout.jsp" class='top'>로그아웃</a></td>
		<td><a href="membermanager.jsp" class='top'>회원관리</a></td>
		<td><a href="productmanager.jsp" class='top'>상품관리</a></td>
		<td><a href="ordermanager.jsp" class='top'>주문관리</a></td>
	</tr>
</table>