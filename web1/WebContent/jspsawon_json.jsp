<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"sawons":
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
	pstmt = conn.prepareStatement("select sawon_no, sawon_name, sawon_jik, sawon_gen, buser_num, buser_no, buser_name, buser_tel from sawon lfte join buser on buser_num = buser_no order by sawon_no");
	rs = pstmt.executeQuery();
	while(rs.next()){ 
		result += "{";
		result += "\"no\":" + "\"" + rs.getString("sawon_no") + "\",";
		result += "\"name\":" + "\"" + rs.getString("sawon_name") + "\",";
		result += "\"jik\":" + "\"" + rs.getString("sawon_jik") + "\",";
		result += "\"gen\":" + "\"" + rs.getString("sawon_gen") + "\",";
		result += "\"buser_no\":" + "\"" + rs.getString("buser_no") + "\",";
		result += "\"buser_num\":" + "\"" + rs.getString("buser_num") + "\",";
		result += "\"buser_name\":" + "\"" + rs.getString("buser_name") + "\",";
		result += "\"buser_tel\":" + "\"" + rs.getString("buser_tel") + "\"";
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