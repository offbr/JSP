<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
%>   
<!DOCTYPE html>
<html>
<hread>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background-color: black; color: white; 
}
h1{
	color: red; font-size: 80px;
}
</style>
</head>
<body>
<h1>쉬발 에러 발생!</h1>
<%= exception.getMessage() %> <!-- exception : 내장객체 -->
</body>
</html>