<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bean" class="board.business.QnaBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<% 

String b_no = String.valueOf(processDao.max_b_no() + 1);
bean.setB_no(b_no);

if(processDao.qnaInsert(bean)){
	response.sendRedirect("qnaList.jsp");
}else{
%>
	<script>
		alert("등록 실패했습니다");
		location.href = "qnaList.jsp";
	</script>
<%	
}
%>
