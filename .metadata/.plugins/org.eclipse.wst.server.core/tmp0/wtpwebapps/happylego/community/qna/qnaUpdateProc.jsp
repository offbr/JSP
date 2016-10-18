<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="communtity.business.QnaBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>

<% 
String b_pass = request.getParameter("b_pass");
String b_phone1 = request.getParameter("b_phone1");
String b_phone2 = request.getParameter("b_phone2");
String b_phone3 = request.getParameter("b_phone3");
String b_phone = b_phone1 + "-" + b_phone2 + "-" + b_phone3;

String b_mail1 = request.getParameter("b_mail1");
String b_mail2 = request.getParameter("b_mail2");
String b_mail = b_mail1 + "@" + b_mail2;

bean.setB_mail(b_mail);
bean.setB_phone(b_phone);

int result = processDao.qnaUpdate(bean);

if(result > 0){
	response.sendRedirect("qnaList.jsp");
}else{
	%>
	<script>
		alert("수정에 실패했습니다");
		location.href = "qnaList.jsp";
	</script>
<%	
}
%>





