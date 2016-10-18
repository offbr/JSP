<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}
</script>
</head>
<body>
<br>
<table class="table">
<tr>
	<td align="center" valign="middle" style="background-color: #black"> <!-- #FFFFCC -->
		<form name="regForm" method="post" action="registerproc.jsp">
			<table border="1">
				<tr align="center" style="background-color: green;"> <!-- #8899aa -->
					<td colspan="2"><b style="color: #FFFFFF">회원 가입</b></td>
				</tr>
				<tr>
					<td width="16%">아이디</td>
					<td width="57%"><input type="text" name="id" size="15">
						<input type="button" value="ID중복확인" id="btnId"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="passwd" size="15"></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td><input type="password" name="repasswd" size="15"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="15"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" size="27"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" size="20"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="zipcode" size="7"> 
						<input type="button" value="우편번호찾기" id="btnZip">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" size="60"></td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name=job>
							<option value="0">선택하세요</option>
							<option value="회사원">회사원</option>
							<option value="학생">학생</option>
							<option value="자영업">자영업</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="회원가입" id="btnSubmit">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="reset" value="다시쓰기">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="reset" value="홈페이지" onclick="javascript:location.href='../guest/guest_index.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</td>
</tr>
</table>
</body>
</html>