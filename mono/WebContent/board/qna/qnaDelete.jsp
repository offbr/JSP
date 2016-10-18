<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<% 
String b_no = request.getParameter("b_no");

if(processDao.qnaDelete(b_no)){
	response.sendRedirect("qnaList.jsp");
}else{
%>
	<script>
		alert("삭제 실패했습니다");
		location.href = "qnaList.jsp";
	</script>
<%	
}
%>