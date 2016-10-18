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
<h2>XSS 연습</h2>
<form action="result1.jsp" method="post"> 
<!--  <script>alert('안녕')</script> <script>location.href="http://daum.net"</script> -->
이름 : <input type="text" name="name">
<input type="submit">
</form>
</body>
</html>

















