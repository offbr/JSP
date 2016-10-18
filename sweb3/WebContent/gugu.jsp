<%@page import="pack.Gugudan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2><a href="gugu.html">다시 입력</a></h2>
<h2>** 방법1 : 현재 내 기술로 처리하기 **</h2>
<br/>
<%
int dan = Integer.parseInt(request.getParameter("dan"));
out.println("<b>" + dan + "단 출력</b>");

//Gugudan gugudan = new Gugudan(); //클래스의 포함관계 : 클라이언트의 요청만큼 객체가 생성 (이렇게 쓰면 안된다)
Gugudan gugudan = Gugudan.getInstance(); //클래스의 포함관계 : singleton 객체는 한번만 만들어진다
int re[] = gugudan.computa(dan);
for(int a = 0; a < 9; a++){
	out.println(dan + " * " + (a + 1) + "= " + re[a] + "&nbsp;&nbsp;");
}
%>
<hr/>
<br/>
<h2>** 방법2 : 빈즈로 처리하기 **</h2>
<jsp:useBean id="gugu" class="pack.Gugudan" /> <!-- 클래스에 정확한 경로를 입력해줘야한다 -->
<%
System.out.println(gugu.toString()); //논리적인 주소는 바뀌나 물리적인 주소는 하나 
out.println("<b>" + dan + "단 출력</b>");
int re2[] = gugu.computa(dan);
for(int a = 0; a < 9; a++){
	out.println(dan + " * " + (a + 1) + "= <b>" + re2[a] + "</b>&nbsp;&nbsp;");
}
%>
<hr/>

</body>
</html>















