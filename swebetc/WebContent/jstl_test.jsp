<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL test</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>JSTL 연습</h2>
** 변수 ** <br>
<c:set var="irum" value="한국인" scope="page"/> <!-- scope = requset, session, application, page(default) -->
<c:out value="${irum}"/> ${irum} <br>

<c:set var="name">홍길동</c:set>
<c:out value="${name}"/> ${name} <br>

<c:set var="aa" value="${header['user-Agent']}" scope="page"/>
aa 변수값은 <c:out value="${aa}"/><br> ${aa} <br> 

<c:set var="su1" value="${10}"/>
<c:set var="su2">20.5</c:set>
합은 ${su1 + su2} <br>

** 조건판단문 ** <br>
<c:set var="bb" value="${'moon'}"/>
<c:if test="${bb == 'star'}">
if 연습 - bb 값은 : <c:out value="${bb}" />
<br> ${bb}
</c:if>
<c:if test="${bb == 'moon'}">
달빛 아래 편의점
</c:if>

<br> ** 조건판단문 ** <br>
<c:choose>
	<c:when test="${bb == 'moon'}">
		<c:out value="${bb}" />
	</c:when>
	<c:when test="${bb == 'star'}">
		밤하늘의 별
	</c:when>
	<c:otherwise>어떠한 조건도 맞지 않을 때 수행</c:otherwise>
</c:choose>
<br>
<c:choose>
	<c:when test="${empty param.ir}">
		<form>
		이름 : <input type="text" name="ir"><input type="submit" value="확인">
		</form>
	</c:when>
	<c:when test="${param.ir == 'admin' }">
	<a href = "http://www.naver.com">관리자</a>
	</c:when>
	<c:otherwise>
		환영합니다, 회원 <c:out value="${param.ir }"/>님
	</c:otherwise>
</c:choose>

</body>
</html>

























