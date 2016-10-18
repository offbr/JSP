<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"sawons":
[
<%
request.setCharacterEncoding("utf-8");

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
	
	
	pstmt = conn.prepareStatement("select sawon_no, sawon_name, gogek_damsano, gogek_name, gogek_tel, decode(substr(gogek_jumin, 8, 1), 1,'M',2,'F') gogek_jumin from sawon left join gogek on sawon_no=gogek_damsano" 
			+" where sawon_no ="+ request.getParameter("sabun") + " and sawon_name = '" + request.getParameter("name") +"' order by sawon_no");
	//pstmt.setString(1, request.getParameter("sabun"));
	//pstmt.setString(1, request.getParameter("name"));
	rs = pstmt.executeQuery();
	while(rs.next()){ 
		result += "{";
		result += "\"sawon_no\":" + "\"" + rs.getString("sawon_no") + "\",";
		result += "\"sawon_name\":" + "\"" + rs.getString("sawon_name") + "\",";
		result += "\"gogek_damsano\":" + "\"" + rs.getString("gogek_damsano") + "\",";
		result += "\"gogek_name\":" + "\"" + rs.getString("gogek_name") + "\",";
		result += "\"gogek_tel\":" + "\"" + rs.getString("gogek_tel") + "\",";
		result += "\"gogek_jumin\":" + "\"" + rs.getString("gogek_jumin") + "\"";
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