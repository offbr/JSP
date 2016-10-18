<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"gogeks":
[
<%
request.setCharacterEncoding("utf-8");
String who = request.getParameter("who");
//String who = "남자";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";

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
		result += "{";
		result += "\"gogek_name\":" + "\"" + rs.getString("gogek_name") + "\",";
		result += "\"gogek_tel\":" + "\"" + rs.getString("gogek_tel") + "\",";
		result += "\"sawon_name\":" + "\"" + rs.getString("sawon_name") + "\",";
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