<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%

boolean b = processDao.updateProduct(request);
if(b){
	%>
	<script>
	alert("수정되었습니다");
	opener.location.reload();
	window.close();
	</script>
	<%
}else{
	%>
	<script>
	alert("수정이 실패되었습니다");
	opener.location.reload();
	
	</script>
	<%
}
%>