<%@page import="mypage.business.GuestBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="happy.mybatis.ProcessDao"/>
<% 
ArrayList<GuestBean> list = (ArrayList)dao.guestAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<script type="text/javascript">
function deleteOk(gid) {
	if(confirm("정말 탈퇴처리 하시겠습니까?")){
	document.gFrm.gid.value = gid;
	document.gFrm.submit();
	}
}
</script>
</head>
<body>
<div class="default_con">
	<table class="i_table">
		<tr>
			<th>회원아이디</th><th>비밀번호</th><th>이름</th><th>우편번호</th><th>주소</th><th>연락처</th><th>메일</th><th>*</th>
		<tr>
		<c:forEach var="g" items="<%=list%>">
		<tr>
			<td>${g.g_id}</td>
			<td>${g.g_pass}</td>
			<td>${g.g_name}</td>
			<td>${g.zipcode}</td>
			<td>${g.g_address}</td>
			<td>${g.g_phone}</td>
			<td>${g.g_mail}</td>
			<td><input type="button" name="legoReturnOk" value="탈퇴" onclick="javascript:deleteOk('${g.g_id}')"></td>
		</tr>
		<c:set var= "sum" value="${sum + 1}"/>
		</c:forEach>
		<tr><td colspan="8">총 회원 수 : ${sum}</td></tr>
	</table>
</div>
<form action="manager.jsp?gopage=guest" name="gFrm" method="post">
<input type="hidden" name="gid">
</form>
</body>
</html>