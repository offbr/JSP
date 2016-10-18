<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
뷰1 결과 : <br>
old : <%= request.getAttribute("result") %><br>
el : ${requestScope.result}
</body>
</html>