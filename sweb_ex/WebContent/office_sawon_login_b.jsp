<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="default.css" rel="stylesheet" title="Default Style">
<div id="aa" style="margin: 10 10 auto">
	<form action="office_sawon_login_ok.jsp" method="post">
		<b>강남물산 직원&nbsp;&nbsp;</b>
		환영합니다 <b><%= session.getAttribute("sawonname")%></b> 님
		<input type="hidden" name="sawon_no" size="5"/>
		<input type="hidden" name="sawon_name" size="5"/>
		<input type="submit" value="로그아웃"> <p/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="office_sawon_gogek.jsp" target="iframe">전체고객</a>&nbsp;&nbsp;&nbsp;
		<a href="office_sawon_gogek.jsp?name=<%= session.getAttribute("sawonname")%>" target="iframe">내관리고객</a>&nbsp;&nbsp;&nbsp;
		<a href="office_main.html">홈페이지</a>
	</form>
</div>