<%@page import="pack.OfficeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pooling" class="pack.office_Pooling"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
<script type="text/javascript">
function funcUp(){
	//alert(document.getElementById("f_bun").value + "삭제");
	if(document.getElementById("f_bun").value != "" && document.getElementById("f_bun").value != null){
		location.href="office_gogek_up.jsp?f_bun="+document.getElementById("f_bun").value;
	}else{
		document.getElementById("disp").innerText = "번호 확인바람";
	}
}
function funcDel(){
	//alert(document.getElementById("f_bun").value + "삭제");
	location.href="office_gogek_del.jsp?f_bun="+document.getElementById("f_bun").value;
}
</script>
</head>
<body>
<table border="1">
	<tr>
		<th>가족번호</th><th>가족명</th><th>전화</th>
	</tr>
	
	<%
	ArrayList<OfficeBean> list = pooling.getGajok();
	for(OfficeBean s : list){
	%>
		<tr>	
		<td><%=s.getF_bun() %></td>
		<td><%=s.getF_irum() %></td>
		<td><%=s.getF_tel() %></td>
		</tr>
	<%
	}
	 %>
</table>
가족번호: <input type="text" id="f_bun" name="f_bun" size="5">
<input type="button" name="btnUp" value="수정" onclick="funcUp()">
<input type="button" name="btnDel" value="삭제" onclick="funcDel()"><br/>
<div id="disp" style="color: red"></div>
</body>
</html>












