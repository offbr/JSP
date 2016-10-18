<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>** JSTL 반복문 **</h2>
<c:forEach var="a" begin="1" end ="10" step="1">
	<c:out value="${a}"/>&nbsp;
</c:forEach>
<br>문제 : 구구단 출력(3단)<br>
<c:set var="a" value="3"></c:set>
<c:forEach var="i" begin="1" end="9" step="1">
	${a} * ${i} = ${a * i}&nbsp;<br>
</c:forEach>
<p>
header 정보 출력 : <br>
<c:forEach var="h" items="${headerValues}">
	속성 : <c:out value="${h.key}"/>
	값 : <c:forEach var="i" items="${h.value}">
			<c:out value="${i}"></c:out>
		</c:forEach>
	<br>
</c:forEach>
<p/>
<%
HashMap map = new HashMap();
map.put("name", "홍길동");
map.put("today", new Date());
%>
<c:set var="m" value="<%=map%>"/>
<c:forEach var="i" items="${m}">
	${i.key} : ${i.value}<br>
</c:forEach>

<br>배열 자료 출력 : <br>
<c:set var="arr" value="<%= new int[]{1,2,3,4,5} %>"/>
<c:forEach var="i" items="${arr}" begin="2" step="2">
	${i} &nbsp;
</c:forEach>

<hr>
-- 문자열 분할 --<br>
<c:forTokens var="animal" items="hores,tiger,lion,dog,cat" delims=",">
	동물 : <b style="font-size: 24px"><c:out value="${animal}"/></b>
</c:forTokens>
<br>
<c:forTokens var="city" items="서울,대전,대구,부산*광주" delims=",*" varStatus="cou">
	도시 : <c:out value="${cou.count}/${city}"/><br>
</c:forTokens>

<p>
** 숫자 및 날짜 서식 사용**<br>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 타입이 바뀐건 아니다 표기만. -->
숫자 : <fmt:formatNumber value="12345.678" type="number"/><br>
통화 : <fmt:formatNumber value="12345.678" type="currency"/><br>
백분율 : <fmt:formatNumber value="12345.678" type="percent"/><br>
소수점 : <fmt:formatNumber value="12345.678" pattern="#,##0.0"/><br>
소수점 : <fmt:formatNumber value="12.678" pattern="#,##0.0"/><br>
소수점 : <fmt:formatNumber value="12.678" pattern="0,000.0"/><br> <!-- 0은 0으로 채움 #숫자로. -->
<br>
<c:set var="nalja" value="<%=new Date() %>"/>
<c:out value="${nalja}"/><br>
날짜 : <fmt:formatDate value="${nalja}" type="date"/><br>
날짜 : <fmt:formatDate value="${nalja}" type="time"/><br>
날짜 : <fmt:formatDate value="${nalja}" type="both"/><br>
날짜 : <fmt:formatDate value="${nalja}" type="both" dateStyle="full" timeStyle="full"/><br>
날짜 : <fmt:formatDate value="${nalja}" type="both" pattern="yyyy년 MM월 dd일"/><br>

</body>
</html>

















































