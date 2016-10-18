<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>** 선택 결과 확인 **</h2>
<%
request.setCharacterEncoding("utf-8");
String movie = request.getParameter("movie");
String id = (String)session.getAttribute("idkey");

if(id != null){
%>
<b><%= id %></b> 님이 좋아하는 영화는 <b><%= movie %></b> 입니다. <br/>
세션 아 이 디 : <b><%= session.getId() %></b><br/>
세션 유지시간 : <b><%= session.getMaxInactiveInterval() %></b><br/>
<%
}else{
	out.println("세션이 설정되지 않음");
}
%>
</body>
</html>























