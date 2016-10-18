<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*"
%>
<%
request.setCharacterEncoding("utf-8");
String sang = request.getParameter("sang");
String su = request.getParameter("su");
String dan = request.getParameter("dan");
//자료 검사 2차 - / 1차는 js에서 수행
if(sang.equals("") || sang == null || 
	su.equals("") || su == null ||
	dan.equals("") || dan == null){
	response.sendRedirect("sangins.html");
	return;
}
try{
	//수량과 단가는 숫자만 허용
	int su_num = Integer.parseInt(su);
	su = Integer.toString(su_num);
	int dan_num = Integer.parseInt(dan);
	dan = Integer.toString(dan_num);
}catch(Exception e){
	response.sendRedirect("sangins.html");
	return;
}

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
}catch(Exception e){
	System.out.println("Driver loading 실패 " + e);
	out.print("Driver loading 실패 " + e);
	return; //메소드라 리턴으로 빠져나감
}

try{
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
	//신상 코드를 구함
	pstmt = conn.prepareStatement("select max(code) from sangdata");
	rs = pstmt.executeQuery();
	int maxCode = 0;
	if(rs.next()){ // rs.next는 값이 있으면 트루 값이 없으면 에러가 떨어짐으로 if문으로 해야한다 
		maxCode = rs.getInt(1);
		//System.out.println(maxCode);	
	}else{
		
	}
	pstmt = conn.prepareStatement("insert into sangdata values(?,?,?,?)");
	pstmt.setInt(1, maxCode + 1);
	pstmt.setString(2, sang);
	pstmt.setString(3, su);
	pstmt.setString(4, dan);
	int rsok = pstmt.executeUpdate(); //성공하면 1 실패하면 0
	if(rsok == 1){
		//request.getRequestDispatcher("dbsangpum.jsp").forward(request, response);
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

















