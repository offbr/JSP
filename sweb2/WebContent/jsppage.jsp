<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Calendar, java.util.*"
    import="java.sql.*"
    session="true" 
    buffer="8kb" 
    autoFlush="true"
    isThreadSafe="true"
    info="jsp문서 정보 담아둠, 검색로봇을 통한 자료 검색시 사용할 수도 있다"
    isELIgnored="false"
  
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directive</title>
</head>
<body>
* 페이지 지시어는 JSP 문서의 앞에서 뭔가를 지시하는 역할 * <p/>
날짜 및 시간 출력:
<%
Calendar dt = Calendar.getInstance();
int y = dt.get(Calendar.YEAR);
int m = dt.get(Calendar.MONTH) + 1;
int d = dt.get(Calendar.DATE);
out.println("오늘은 " + y + "년 " + m + "월 " + d + "일");
%> 
<br>
<%= this.getServletInfo() %>
<hr>
<%
int a = 10 / 2;
out.println("나누기 결과 : " + a);
%>
</body>
</html>

















