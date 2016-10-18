<%@page import="pack.Student"%>
<%@page import="pack.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
전통 : 안녕 <%= request.getAttribute("man") %><br>
EL : 안녕 ${requestScope.man}, ${man}<br>

전통 : <% Person p = (Person)request.getAttribute("person"); %> 
		<%= p.getName() %>
	<%= ((Student)request.getAttribute("student")).getAge() %><br>

EL : ${person.name} ${student.age}<p><br>

${animal[0]}, ${animal['1']}, ${animal["2"]}<br>

<c:forEach var="a" items="${list}">
	${a[0]}, ${a[1]}, ${a[2]}
</c:forEach>
<br>
<c:if test="${list != null}">
	<c:forEach var="a" items="${list}">
		${a[0]}, ${a[1]}, ${a[2]}
	</c:forEach>
</c:if>
<br>
<c:choose>
	<c:when test="${list eq null}">
		자료 없음
	</c:when>
	<c:otherwise>
		자료 있음
	</c:otherwise>
</c:choose>

<hr>
try ~ except 처리<br>
<c:catch var="myErr">
	<% int a = 10 / 0; out.println(a); %>
</c:catch>
<c:if test="${myErr != null}">
	에러 발생: ${myErr.message}
</c:if>

<br>
다른 문서 포함<br>
include 지시어 사용 : <%@ include file="poham.jsp" %> <!-- 소스자체를 가져옴 -->
jsp action tag 사용 : <jsp:include page="poham.jsp"/> <!-- 실행결과를 가져옴 -->
jstl 사용: <c:import url="poham.jsp"/> <!-- 실행결과를 가져옴 -->

<br>
<c:import url="http://www.daum.net"/>

<br>
<c:set var="url" value="http://naver.com"/>
<c:import url="${url}" var="u"/>
<c:out value="${url}"/> <!-- http://naver.com -->
<c:out value="${u}"/> <!-- 소스출력 -->
</body>
</html>
























