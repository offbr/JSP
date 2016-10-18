<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP test</title>
<style type="text/css">
body{
	background-color: black; color: white;
}
</style>
</head>
<body>
안녕 난 jsp 문서야
<br>
<% //scriptlet : 자유롭게 자바의 코드를 기술 //jsp는 전체가 서비스메소드. get과 post를 구분해서 부를순 없다(서블릿으로 만들면 가능)
String ir = "홍길동";
out.println(ir + "의 홈페이지!");  //out : 클라이언트에 자료를 내보내는 내장객체
for(int i = 1; i < 7; i++){
	out.print("<h" + i + ">"); //자바를 이용한 태그처리
	out.print("이연남을 잡아라 얍얍얍");
	out.print("</h" + i + ">");
}
out.println("자료 출력");
%>
<br>
<%="자료 출력(표현식)"%>
<br>
<% out.println("자료 출력"); %>
<br>
<%= new java.util.Date() %>
<br>
<%
int a = 0, sum = 0;
do{
	a++;
	sum +=a;
}while(a< 10);
%>
<%= "10까지의 합 " + sum %>
<br>
<%= ir + "님의 전화번호는 " + tel %>
<%! String tel = "111 - 1234"; // %! 선언 : 멤버필드(전역변수) %>

<br>
<%! //사용 자제
public int add(int m, int n){ //메소드 안에 메소드는 안된다 //jsp는 전체가 서비스 메소드 <%!로 선언해주면 멤버메소드가 되므로 사용가능
	return m + n;
}
%>
<%=add(100, 200) %>
</body>
</html>












