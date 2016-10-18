<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="default.css" rel="stylesheet" title="Default Style">
<div id="bb">
	<form action="login_ok.jsp" method="post">
		<h2>교육센터</h2>
		<%= session.getAttribute("id") + "님이 로그인 중"%>
		<input type="hidden" name="id" />
		<input type="hidden" name="pwd" />
		<input type="submit" value="로그아웃"><p/>
		<a href="loginjiwon.jsp" target="frame"><b>자료보기</b></a>
	</form>
</div>