<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"sawons":
[
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
//System.out.println(keyword);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "scott", "tiger");
	String sql = "select to_char(sawon_ibsail, 'YYYY') as sawon_ibsail, sawon_no, sawon_name, gogek_damsano, gogek_name, gogek_jumin, gogek_tel from sawon" + 
			" left join gogek on sawon_no=gogek_damsano where to_char(sawon_ibsail, 'YYYY') like ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, keyword + "%");
	rs = pstmt.executeQuery();
	while(rs.next()){ 
		result += "{";
		result += "\"sawon_ibsail\":" + "\"" + rs.getString("sawon_ibsail") + "\",";
		result += "\"sawon_no\":" + "\"" + rs.getString("sawon_no") + "\",";
		result += "\"sawon_name\":" + "\"" + rs.getString("sawon_name") + "\",";
		result += "\"gogek_damsano\":" + "\"" + rs.getString("gogek_damsano") + "\",";
		result += "\"gogek_name\":" + "\"" + rs.getString("gogek_name") + "\",";
		result += "\"gogek_jumin\":" + "\"" + rs.getString("gogek_jumin") + "\",";
		result += "\"gogek_tel\":" + "\"" + rs.getString("gogek_tel") + "\"";
		result += "},";		
	}
	if(result.length() > 0){
		result = result.substring(0, result.length() -1);
	}
	out.print(result);
	//System.out.println(result);

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