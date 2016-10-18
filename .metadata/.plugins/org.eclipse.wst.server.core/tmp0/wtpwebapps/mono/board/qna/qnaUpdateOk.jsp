<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bean" class="board.business.QnaBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<% 
String b_no = request.getParameter("b_no");

if(processDao.qnaUpdate(bean)){
	response.sendRedirect("qnaList.jsp");
}else{
%>
	<script>
		alert("수정 실패했습니다");
		location.href = "qnaList.jsp";
	</script>
<%	
}
%>
