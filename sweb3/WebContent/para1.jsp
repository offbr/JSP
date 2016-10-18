<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String message = request.getParameter("message"); //jsp:setProperty 사용 시 적을 필요 없다
%>
<jsp:useBean id="my" class="pack.Para1Class" /> <!-- id는 객체변수명 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>** 클래스 멤버 필드에 값 설정하고 가공된 결과 읽기 **</h2>
<%
//내가 알고 있는 기술 사용 //jsp에 용도는 view  //비즈니스로직은 서블릿 자바로 따로 뺀다
my.setMessage(message);
out.println(my.getMessage());
%>
<br>
<jsp:setProperty property="message" name="my"/> <!-- value="꼬꼬댁 연남" -->
<!-- setter, getter, 파라미터네임과 멤버필드명 규칙을 잘 지켜야한다 property=메소드명 자동화가능-->
<jsp:getProperty property="message" name="my"/>

</body>
</html>






















