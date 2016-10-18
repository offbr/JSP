<%@page import="pack.ex2_bangDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String code = request.getParameter("code");
	//out.println(code);
%>
<jsp:useBean id="bean" class="pack.ex2_bangConnBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnOk").onclick = function(){
		if(frm.name.value === "" || frm.subject.value === ""){
			alert("작성자 또는 제목을 입력하셍");
			frm.name.focus();
			return false;
		}
			frm.submit(); 
	}
}
</script>
</head>
<body>
<% ex2_bangDto dto = bean.updateList(code);
if(dto == null){
%>
	<script>
		alert("등록된 코드가 아닙니다\n확인 바람");
		location.href = "ex2_bang.jsp";
	</script>
<%
	return;
}
%>
<h2>* 방명록 수정*</h2>
<form action="ex2_upokbang.jsp" name="frm">
<input type="hidden" name="code" size="29" value="<%= dto.getCode() %>">
<table>
  <tr>
    <td>작성자 : </td>
    <td><input type="text" name="name" size="29" value="<%= dto.getName() %>"><td>
  </tr>
  <tr>
    <td>제목 : </td>
    <td><input type="text" name="subject" size="29" value="<%= dto.getSubject() %>"><td>
  </tr>
  <tr>
    <td>내용 : </td>
    <td><textarea rows="5" cols="30" name="content"><%= dto.getContent() %></textarea><td>
  </tr>
  <tr>
    <td style="text-align: center">
    	<input type="button" value=" 등  록 " id="btnOk">
    </td>
    <td style="text-align: center">
    	<input type="button" value=" 목  록 " onclick="javascript:location.href='ex2_bang.jsp'">
    </td>
  </tr>
</table>
</form> 
</body>
</html>











