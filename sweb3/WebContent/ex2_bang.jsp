<%@page import="pack.ex2_bangDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="pack.ex2_bangConnBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
<script type="text/java-script" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h2>* 방명록 *</h2>
<a href="ex2_newbang.html"><b>글쓰기</b></a><p/>
<table border="1">
	<tr><th>코드</th><th>작성자</th><th>제목</th><th>내용</th></tr>
<%
ArrayList<ex2_bangDto> list = bean.getDataAll();
for(ex2_bangDto b : list){
%>
	<tr>
		<td><a href="ex2_delbang.jsp?code=<%= b.getCode() %>" onclick="return confirm('정말 삭제하시겠습니까?')"><%= b.getCode() %></a></td>
		<td><a href="ex2_upbang.jsp?code=<%= b.getCode() %>" onclick="return confirm('정말 수정하시겠습니까?')"><%= b.getName() %></a></td>
		<td><%= b.getSubject() %></td>
		<td><%= b.getContent() %></td>
	</tr>
<%	
}
%>
</table>
</body>
</html>