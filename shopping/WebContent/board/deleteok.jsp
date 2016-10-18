<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="shop.board.BoardMgr" />

<%
String spage = request.getParameter("page");
String num = request.getParameter("num");
String pass = request.getParameter("pass");

boolean b = boardMgr.checkPass(Integer.parseInt(num), pass);

if(b){
	boardMgr.delData(num);
	response.sendRedirect("boardlist.jsp?page=" + spage);	
}else{
%>
	<script>
		alert("비밀번호 불일치!"); //실제웹상에선 alert말고 다른걸 쓴다.
		history.back();
	</script>
<%
}
%>