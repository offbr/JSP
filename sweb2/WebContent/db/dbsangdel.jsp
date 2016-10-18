<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*"
%>
<%
request.setCharacterEncoding("utf-8");
String delCode = request.getParameter("delCode");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
}catch(Exception e){
	System.out.println("DB 연결 실패 " + e);
	out.print("DB 연결 실패 " + e);
	return; //메소드라 리턴으로 빠져나감
}

try{
	pstmt = conn.prepareStatement("delete from sangdata where code=?");
	pstmt.setString(1, delCode);

	int rsok = pstmt.executeUpdate(); //성공하면 1 실패하면 0
	if(rsok == 1){
		//request.getRequestDispatcher("dbsangpum.jsp").forward(request, response); 데이터 다 지워진다
		response.sendRedirect("dbsangpum.jsp");
	}else{
		
	}
}catch(Exception e){
	System.out.println("처리 실패 " + e);
	out.print("처리 실패 " + e);	
}finally{
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>

















