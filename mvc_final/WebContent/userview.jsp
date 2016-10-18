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
	document.getElementById("btnUpdate").addEventListener("click", updateFunc, false);
	document.getElementById("btnDelete").addEventListener("click", deleteFunc, false);
	document.getElementById("btnList").addEventListener("click", listFunc, false);
}

function updateFunc(){
	f.command.value = "updateform";
	f.action = "updateform.do";
	f.submit();	
}

function deleteFunc(){
	if(confirm("정말 삭제할까요?")){
		f.command.value = "delete";
		f.action = "delete.do";
		f.submit();		
	}
}

function listFunc(){
	f.command.value = "list";
	f.action = "userlist.do";
	f.submit();
}

</script>
</head>
<body>
<h2>** 사용자 상세 보기 **</h2>
<% UserDto dto = (UserDto)request.getAttribute("user"); %>
<table border="1">
	<!-- <tr><td>아이디</td><td><%= dto.getUserid()%></td></tr> -->
	<tr><td>아이디</td><td>${user.userid}</td></tr>
	<tr><td>비밀번호</td><td>${user.password}</td></tr>
	<tr><td>이름</td><td>${user.name}</td></tr>
	<tr><td>이메일</td><td>${user.email}</td></tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button id="btnUpdate">수정</button>
			<button id="btnDelete">삭제</button>
			<button id="btnList">목록</button>
		</td>	
	</tr>
</table>

<form name="f" method="post">
	<input type="hidden" name="command">
	<input type="hidden" name="userid" value="${user.userid}">
</form>

</body>
</html>
























