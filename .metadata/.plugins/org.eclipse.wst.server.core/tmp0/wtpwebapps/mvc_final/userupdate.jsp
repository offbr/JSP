<%@page import="net.mvc.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="logincheck.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
	document.getElementById("btnUpdateOk").addEventListener("click", updateFunc, false);
	document.getElementById("btnListOk").addEventListener("click", listFunc, false);
}

function updateFunc(){
	f.action = "updateok.do";
	f.submit();	
}

function listFunc(){
	f.command.value = "list";
	f.action = "userlist.do";
	f.submit();
}

</script>
</head>
<body>
<h2>** 사용자 정보 수정 **</h2>
<form name="f" method="post">
<input type="hidden" name="command" value="update">
<input type="hidden" name="userid" value="${user.userid}">
<table border="1">
	<tr><td>아이디</td><td>${user.userid}</td></tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password" value="${user.password}"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${user.name}"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="${user.email}"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button id="btnUpdateOk">수정확인</button>
			<button id="btnListOk">목록보기</button>
		</td>	
	</tr>
</table>
</form>

</body>
</html>
























