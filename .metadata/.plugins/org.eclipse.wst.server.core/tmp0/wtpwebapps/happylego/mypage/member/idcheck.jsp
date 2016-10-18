<%@page import="mypage.business.GuestDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
%>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao" />

<%
   ArrayList<GuestDto> list = processdao.idcheck(id); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복검사</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel = "stylesheet" type = "text/css" href = "../../css/mypage.css">
<script type="text/javascript" src = "../../js/mypage.js"></script>
</head>
<body>

<table>
<%
   if(list.size() == 0){
%>
   <tr>
      <td>
         사용가능한 아이디 입니다
         <a href ="#" onclick = "opener.document.joinfrm.g_pass.focus(); window.close();">사용하기</a>
      </td>
   </tr>
<%      
   }else{
%>
   <tr>
      <td>
         이미 사용중인 아이디입니다.
         <a href = "#" onclick = "opener.document.joinfrm.g_id.focus(); window.close();">재입력</a>
      </td>
   </tr>
<%
   }
%>

</table>
</body>
</html>