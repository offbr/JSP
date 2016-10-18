<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memid = (String)session.getAttribute("idKey");
String log = "";

if(memid == null)
	log = "<a href='login.jsp' class='top'>로그인</a>";
else
	log = "<a href='logout.jsp' class='top'>로그아웃</a>";
	
String mem = "";
if(memid == null)
	mem = "<a href='../member/register.jsp' class='top'>회원가입</a>";
else
	mem = "<a href='../member/memberupdate.jsp' class='top'>회원수정</a>";
%>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<table style="width: 100%;">
	<tr style="background-color: green; font-weight=bold; text-align: center;">
		<td><%= log %></td>
		<td><%= mem %></td>
		<td><a href="productlist.jsp" class="top">상품목록</a></td>
		<td><a href="cartlist.jsp" class="top">장바구니</a></td>
		<td><a href="orderlist.jsp" class="top">구매목록</a></td>
		<td><a href="../board/boardlist.jsp" class="top">게시판</a></td>
	</tr>
</table>