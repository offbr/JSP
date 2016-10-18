<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="default.css" rel="stylesheet" title="Default Style">
<div id="aa" style="margin: 10 10 auto">
	<form action="office_gogek_login_ok.jsp" method="post">
		<b>강남물산 고객&nbsp;&nbsp;</b>
		환영합니다 <b><%= session.getAttribute("gogekname")%></b> 님
		<input type="hidden" name="gogek_no" size="5"/>
		<input type="hidden" name="gogek_name" size="5"/>
		<input type="submit" value="로그아웃"><p/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="office_gogek_all.jsp" target="iframe">가족목록</a>&nbsp;&nbsp;&nbsp;
		<a href="office_gogek_ins.html" target="iframe">가족등록</a>&nbsp;&nbsp;&nbsp;
		<a href="office_main.html">홈페이지</a>
	</form>
</div>