<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>** 사용자 추가 **</h2>
<form action="insert.do" name="f" method="post">
<input type="hidden" name="command" value="insert">
<table border="1">
	<tr>
		<th>아이디</th><td><input type="text" name="userid"></td>
	</tr>
	<tr>
		<th>비밀번호</th><td><input type="text" name="password"></td>
	</tr>
	<tr>
		<th>이름</th><td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>이메일</th><td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="등록">
			<button onclick="javascript:history.back()">돌아가기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>