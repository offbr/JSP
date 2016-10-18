<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL test</title>
<link href="css/default.css" rel="stylesheet" title="Default Style">
</head>
<body>
<h2>--- 연산자 ---</h2>
\${3 + 4} --> ${3 + 4} <br>
\${5 / 4} --> ${5 / 4}<!--, ${5 div 4 } --> <br>
\${5 / 0} --> ${5 / 0} <br>
\${5 % 3} --> ${5 % 3}<!--, ${5 mod 3} --> <br>

\${5 > 3?10:20} --> ${5 > 3?10:20} <br>

\${5 > 3} --> ${5 > 3}, ${5 gt 3} <!-- gt,le,gr 등등 --><br>
\${5 >= 3 and 4 < 2} --> ${5 >= 3 and 4 < 2} <br>

<p>--- 내장 객체 --- <br>
<%
request.setAttribute("aa", "air");
session.setAttribute("bb", "book");
application.setAttribute("cc", "cat");
%>
<%= request.getAttribute("aa") %>, ${requestScope.aa} <br>
<%= session.getAttribute("bb") %>, ${sessionScope.bb} <br>
<%= application.getAttribute("cc") %>, ${applicationScope.cc} <br>
<br>
jsp 내장 객체 : <%=request.getHeader("host")%> <br>
EL 내장 객체 : ${header.host}, ${header["host"]}

<p>--- collection 객체 처리 --- <br>
<%
ArrayList list = new ArrayList();
list.add("kor");
list.add("eng");
request.setAttribute("list", list);
%>
${list[0]}, ${list["1"]}

<p>--- client 자료 읽기 --- <br>
<a href="eltest.html">html call</a><br>
이름 : ${param.irum}, ${param["irum"]}<br>
성격 : ${param.sung} <br>
${paramValues.sung[0]}, ${paramValues.sung["1"]}<br>







</body>
</html>




















