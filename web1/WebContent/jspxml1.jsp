<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<sangpums>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}catch(Exception e){
	System.out.println("연결 에러: " + e);
	return;
}

try{	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "scott", "tiger");
	pstmt = conn.prepareStatement("select * from sangdata order by code");
	rs = pstmt.executeQuery();
	while(rs.next()){ 
%>
		<sangpum>
			<code><%=rs.getString("code") %></code> 
			<sang><%=rs.getString("sang") %></sang>
			<su><%=rs.getString("su") %></su>
			<dan><%=rs.getString("dan") %></dan>
		</sangpum>
<%		
	}
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e2){
	System.out.println("에러: " + e2);
	return;
}
%>
</sangpums>
















