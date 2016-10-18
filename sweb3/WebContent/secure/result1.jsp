<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>* XSS(Web상에서 악성스크립트를 활용한 공격) Test *</h2>
<% request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");

// <,> 꺽쇄문자를 &lt, &gt로 교체하라 
if(name != null){
	name = name.replaceAll("<", "&lt");
	name = name.replaceAll(">", "&gt");
}else{
	return;
}
%>
<p/>
이름은 <%= name %>
</body>
</html>