<%@page import="mypage.business.ZiptabBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	String check = request.getParameter("check");	//y or n
	String p_area3 = request.getParameter("area3");	//동 이름
	ArrayList<ZiptabBean> list = processdao.zipserch(p_area3);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호검색</title>
<script type="text/javascript">
	
	window.onload = function(){
		
		document.getElementById("btnzipfind").onclick = dongcheck;
		document.getElementById("btnzipclose").onclick = function(){
			window.close();
		};
	}
	
	function dongcheck(){
		if(zipform.area3.value == ""){
			alert("동이름을 입력해주세요");
			zipform.area3.focus();
			return;
		}
		zipform.submit();
	}
	
	function send(zipcode, area1, area2, area3, area4){
		if(zipform.check.value === 'y'){
			opener.document.joinfrm.zipcode.value = zipcode;
			var addr = area1 + " " + area2 + " " + area3 + " " + area4;
			opener.document.joinfrm.g_address.value = addr;
			window.close();
		}else if(zipform.check.value === 'd'){
			opener.document.updatefrm.zipcode.value = zipcode;
			var addr = area1 + " " + area2 + " " + area3 + " " + area4;
			opener.document.updatefrm.g_address.value = addr;
			window.close();
		}
		
	}
</script>
</head>
<body>
<b style="text-align: center">** 우편번호 찾기 **</b><br>
<form action="zipcheck.jsp" name = "zipform" method="post">
<table>
	<tr>
		<td>
			동이름 입력 : <input type = "text" name = "area3">
			<input type ="button" value = "검색" id = "btnzipfind">
			<input type ="button" value = "닫기" id = "btnzipclose">
			<input type ="hidden" value = "<%=check %>" name = "check">
		</td>
	</tr>
</table>
</form>
<table>
	<c:forEach var = "d" items = "<%= list %>">
	<tr>
		<a href = "javascript:send('${d.zipcode }', '${d.area1 }', '${d.area2 }', '${d.area3 }', '${d.area4 }')">
										${d.zipcode } ${d.area1 } ${d.area2 } ${d.area3 } ${d.area4 }</a><br>
	</tr>
	</c:forEach>
</table>
</body>
</html>



















