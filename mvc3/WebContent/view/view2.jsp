<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
뷰2 처리 결과 :
<c:forEach var="a" items="${data}">
	${a}&nbsp;&nbsp;
</c:forEach>
</body>
</html>