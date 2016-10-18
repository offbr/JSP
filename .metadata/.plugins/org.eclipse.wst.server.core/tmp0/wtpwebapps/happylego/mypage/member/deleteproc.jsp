<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao"/>
<%
	String g_id = request.getParameter("g_id");

	
	boolean b = processdao.delete(g_id);
	
	if(b){
		session.removeAttribute("idkey");
		response.sendRedirect("login.jsp");
	}else{
%>
		<script>
			alert("대여중인 레고가 있습니다\n 반납 후 탈퇴 바랍니다.");
		</script>	
<%	
		response.sendRedirect("myinfo.jsp");
	}
%>