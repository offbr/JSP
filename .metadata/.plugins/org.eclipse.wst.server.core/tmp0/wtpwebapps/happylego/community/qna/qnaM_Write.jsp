<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%
String idkey = request.getParameter("idkey");
String b_no = request.getParameter("b_no");
String b_pass = request.getParameter("b_pass");
String b_state = request.getParameter("b_state");
String sblock = request.getParameter("sblock");
String spage = request.getParameter("spage");
String m_title = request.getParameter("m_title");
String m_content = request.getParameter("m_content");

Map<String, String> map = new HashMap<String, String>();
map.put("b_no", b_no);
map.put("b_state", b_state);

processDao.qnaUpstate(map); //관리자가 답변 달았을때 상태변경

Map<String, String> managerMap = new HashMap<String, String>();
managerMap.put("m_no", b_no);
managerMap.put("m_id", idkey);
managerMap.put("m_title", m_title);
managerMap.put("m_content", m_content);

if(processDao.qnaM_Write(managerMap)){
%>	
	<script>
	window.onload = function(){
		alert("답변등록 성공");
		document.qnaPwdFrm.submit();
	}
	</script>
<%}else{%>
	<script>
	window.onload = function(){
		alert("답변등록 실패");
		document.qnaPwdFrm.submit();
	}
	</script>
<%}%>

<form name="qnaPwdFrm" method="post" action="qnaView.jsp">  <!--되돌아갈때 들고 갈 파라미터 -->
		<input type="hidden" name="b_no" value="<%=b_no%>" />
		<input type="hidden" name="b_pass" value="<%=b_pass%>" /> 
		<input type="hidden" name="sblock" value="<%=sblock%>"/> 
		<input type="hidden" name="page" value="<%=spage%>"/>
</form>
