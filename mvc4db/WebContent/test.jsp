<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
String ss = request.getRequestURI(); 
out.println("요청 URI: " + ss);

//요청 URI에서 파일명 얻기 방법1 
int idx = ss.lastIndexOf('/');
out.println("<br/>결과1: " + ss.substring(idx + 1));  //test.jsp

StringTokenizer st = new StringTokenizer(ss.substring(idx + 1),".");
ss = st.nextToken();
out.println("<br/>결과2: " + ss);   //test

// 방법2
String ss2 = request.getRequestURI();
if(ss2.indexOf(request.getContextPath()) == 0){
	ss2 = ss2.substring(request.getContextPath().length());
}
out.println("<br/>결과3: " + ss2); // /test.jsp
%>
</body>
</html>