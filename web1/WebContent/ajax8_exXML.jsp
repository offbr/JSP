<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<gogeks>
<%
request.setCharacterEncoding("utf-8");
String who = request.getParameter("who");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "scott", "tiger");
	String sql = "select gogek_name, gogek_tel, sawon_name, buser_tel from sawon" + 
				" left join gogek on sawon_no=gogek_damsano"+
				" left join buser on buser_no=buser_num where gogek_jumin like ?" ;
	pstmt = conn.prepareStatement(sql);
	if(who.equals("남자")){
		pstmt.setString(1, "%-1%");		
	}else if(who.equals("여자")){
		pstmt.setString(1, "%-2%");
	}else{
		pstmt.setString(1, "%");
	}
	rs = pstmt.executeQuery();
	while(rs.next()){ 
%>
	<gogek>
		<gogek_name><%=rs.getString("gogek_name") %></gogek_name> 
		<gogek_tel><%=rs.getString("gogek_tel") %></gogek_tel>
		<sawon_name><%=rs.getString("sawon_name") %></sawon_name>
		<buser_tel><%=rs.getString("buser_tel") %></buser_tel>
	</gogek>
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
</gogeks>
