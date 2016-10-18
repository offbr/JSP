<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"sangpum":
[
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";

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
		result += "{";
		result += "\"code\":" + "\"" + rs.getString("code") + "\",";
		result += "\"sang\":" + "\"" + rs.getString("sang") + "\",";
		result += "\"su\":" + "\"" + rs.getString("su") + "\",";
		result += "\"dan\":" + "\"" + rs.getString("dan") + "\"";
		result += "},";		
	}
	if(result.length() > 0){
		result = result.substring(0, result.length() -1);
	}
	out.print(result);
	
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e2){
	System.out.println("에러: " + e2);
	return;
}
%>
]
}















