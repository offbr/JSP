<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
자료 받아 출력하기
<p/>
<%
String irum = request.getParameter("irum");  //클라이언트의 값을 받을땐 request 값을 줄땐 response
out.println(irum);
%>
여기는 html 영역 : <% out.println(irum); %> <%= irum %> <!-- 출력전용 두개는 같은 뜻. -->

</body>
</html>