<%@page 
	language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String pa = request.getParameter("pa"); //페이지 번호 얻기
if((pa == null) || pa.equals("")) pa = "1";

try{
	Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");

}catch(Exception e){
	System.out.println("db연결 실패 " + e);
	out.print("db연결 실패 " + e);
	return; //메소드라 리턴으로 빠져나감
}

try{
	//페이지 당 제한된 자료 출력 준비 작업 -----------------------
	pstmt = conn.prepareStatement("select count(*) from sangdata");
	rs = pstmt.executeQuery();
	rs.next();
	int rectotal = rs.getInt(1); //전체 레코드 수 얻기
	int pageSize = 5; // 한 페이지 당 출력 자료 수
	int totalPage = rectotal / pageSize; //전체 페이지 수 얻기
	int re = rectotal % pageSize;
	if(re != 0) totalPage += 1; //자투리 페이지수 얻기
	//System.out.println(totalPage);
	
	pstmt = conn.prepareStatement("select * from sangdata order by code desc");	
	rs = pstmt.executeQuery();
	
	//각 페이지 시작번호얻고 이동하기 준비작업 ----------------
	//시작번호
	int startNum = (Integer.parseInt(pa) - 1) * pageSize + 1; //1, 6, 11, 16.....
	for(int p = 1; p < startNum; p++){
		rs.next(); // 레코드 포인터 위치 : 0, 5, 10, 15.....
	}
	//----------------------------------------------------
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../default.css" rel="stylesheet" title="Default Style">
<script type="text/javascript">
function delCode(data){
	if(confirm("정말 삭제하시겠습니까? ") == false) return false;
}
</script>
</head>
<body>
<h2>** 상품자료 **</h2>
<a href="sangins.html">상품 추가</a><br/><br/>
<table border="1">
	<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
	<% 
	int i = 1;
	while(rs.next() && i <= pageSize){
 	%>
 	<tr>
 		<!-- <td><a href="dbsangdel.jsp?delCode=<%= rs.getString("code") %>" onclick="return delCode(<%= rs.getString("code") %>)"><%= rs.getString("code") %></a></td> -->
 		<td><a href="dbsangdel.jsp?delCode=<%= rs.getString("code") %>" onclick='return confirm("정말 삭제하시겠습니까? ")'><%= rs.getString("code") %></a></td>  
 		<td><%= rs.getString("sang") %></td>
 		<td><%= rs.getString("su") %></td>
 		<td><%= rs.getString("dan") %></td>
 	</tr>
	<%	
		i++;
	}
	%>
	<tr>
		<td colspan="4" style="text-align: center;">
		<%
		if(totalPage > 0){
			for(int pNo = 1; pNo <= totalPage; pNo++){
	 	%>
				[<a href="dbsangpum.jsp?pa=<%= pNo %>"><%= pNo %></a>]	
		<%
			}
		}
		%>
		</td>
	</tr>
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












