<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>

<%
boolean b = processDao.insertProduct(request);
if(b){
	%>
	<script>
	alert("추가되었습니다");
	opener.location.reload();
	window.close();
	</script>
	<%
}else{
	%>
	<script>
	alert("추가작업이 실패되었습니다");
	opener.location.reload();
	
	</script>
	<%
}
%>