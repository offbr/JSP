<%@page import="pack.OfficeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String f_bun = request.getParameter("f_bun");
%>
<jsp:useBean id="pooling" class="pack.office_Pooling" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<%
OfficeBean dto = pooling.updateFList(f_bun);
if(dto == null){
%>
	<script>
		alert("등록된 코드가 아닙니다\n확인 바람");
		location.href = "office_gogek_all.jsp";
	</script>
<%
	return;
}
%>
<h2>** 가족 수정 **</h2>
<form action="office_gogek_upok.jsp" method="post" name="frm">
관련가족 : <%= dto.getF_gogek_no() %><input type="hidden" name="f_gogek_no" value="<%= dto.getF_gogek_no() %>"><br/>
가족번호 : <%= dto.getF_bun() %><input type="hidden" name="f_bun" value="<%= dto.getF_bun()%>"><br/>
가 족 명 : <input type="text" name="f_irum" value="<%= dto.getF_irum() %>"><br/>
전 화  : <input type="text" name="f_tel" value="<%= dto.getF_tel() %>"><br/>
<input type="submit" value="수정완료"> 
</form>
</body>
</html>