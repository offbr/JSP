<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
	pstmt = conn.prepareStatement("select * from sangdata");
}catch(Exception e){
	System.out.println("db연결 실패 " + e);
	out.print("db연결 실패 " + e);
	return;
}

try{
	rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>* 상품 자료*</h2>
<table border="1">
	<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
	<% 
	while(rs.next()){
 	%>
 	<tr>
 		<td><%= rs.getString("code") %></td>
 		<td><%= rs.getString("sang") %></td>
 		<td><%= rs.getString("su") %></td>
 		<td><%= rs.getString("dan") %></td>
 	</tr>
	<%	
	}
	%>
 </table>
</body>
</html>
<%
}catch(Exception e){
	System.out.println("처리 실패 " + e);
	out.print("처리 실패 " + e);	
}finally{
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>



























