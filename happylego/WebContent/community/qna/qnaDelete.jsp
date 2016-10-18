<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%
String b_no = request.getParameter("b_no");
String b_pass = request.getParameter("b_pass");
String sblock = request.getParameter("block");
String spage = request.getParameter("page");
String password = request.getParameter("password"); //수정이나 삭제시 입력한 값;

Map<String, String> map = new HashMap<String, String>();
map.put("b_no", b_no);
map.put("b_pass", password);

if(processDao.qnaCheckPass(map) == false){
%>
	<script>
	window.onload = function(){
		alert("비밀번호가 틀립니다");
		document.qnaPwdFrm.submit();
		//location.href = "qnaList.jsp";	
	}
	</script>
<% 
}else{
	processDao.qnaM_Delete(b_no); //관리자 답변도 삭제;
	boolean result = processDao.qnaDelete(b_no);
	if(result == true){
		response.sendRedirect("qnaList.jsp");
	}else{
		%>
		<script>
			alert("삭제에 실패했습니다");
			location.href = "qnaList.jsp";
		</script>
	<%	
	}
}
%>
    
<form name="qnaPwdFrm" method="post" action="qnaView.jsp">  <!--view 에서 수정할 때 패스워스 틀렸으면 되돌아가기 -->
	<input type="hidden" name="b_no" value="<%=b_no%>" />
	<input type="hidden" name="b_pass" value="<%=b_pass%>" /> 
	<input type="hidden" name="sblock" value="<%=sblock%>"/> 
	<input type="hidden" name="page" value="<%=spage%>"/>
</form>


