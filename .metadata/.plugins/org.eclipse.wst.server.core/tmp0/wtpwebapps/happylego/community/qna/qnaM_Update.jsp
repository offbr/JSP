<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mbean" class="communtity.business.QnaMBean"/>
<jsp:setProperty property="*" name="mbean"/>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%  
String b_no = request.getParameter("m_no");
String b_pass = request.getParameter("b_pass");
String sblock = request.getParameter("sblock");
String spage = request.getParameter("spage");

int result = processDao.qnaM_Update(mbean);

if(result > 0){
%>	
	<script>
	window.onload = function(){
		alert("답변수정 성공");
		document.qnaPwdFrm.submit();
	}
	</script>
<%}else{%>
	<script>
	window.onload = function(){
		alert("답변수정 실패");
		document.qnaPwdFrm.submit();
	}
	</script>
<%}%>

<form name="qnaPwdFrm" method="post" action="qnaView.jsp">   <!--되돌아갈때 들고 갈 파라미터 -->
		<input type="hidden" name="b_no" value="<%=b_no%>" />
		<input type="hidden" name="b_pass" value="<%=b_pass%>" /> 
		<input type="hidden" name="sblock" value="<%=sblock%>"/> 
		<input type="hidden" name="page" value="<%=spage%>"/>
</form>

