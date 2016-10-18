<%@page import="mypage.business.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<jsp:useBean id="dto" class="mypage.business.MemberDto"/>
<%

String m_email = (String)session.getAttribute("email_key"); 

if(m_email == null){
	response.sendRedirect("../../mypage/index/mypageindex.jsp");
}else{
	dto = processDao.myinfo(m_email);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>mono</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>

<style>
th {
	font-weight: bold;	
}
td {
	font-family: 'Abel', sans-serif;
}

</style>

<script>
function checkFrm(){
	var f = document.qnaWriteFrm;
	if (f.b_title.value == "") {
		alert("제목을 입력하세요.");
		f.b_title.focus();
		return;
	}
	if (f.b_content.value == "") {
		alert("내용을 입력하세요.");
		f.b_content.focus();
		return;
	}
	if (f.b_pass.value == "") {
		alert("해당 게시글의 비밀번호를 등록하세요.");
		f.b_pass.focus();
		return;
	}
	f.submit();
}

</script>

</head>
<div class="container">
<body>
<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->
<br><br>


<!-- 글쓰기 -->
  <form action="qnaWriteOk.jsp" method="post" name="qnaWriteFrm">
  
<div class="container">
<div class="panel panel-default table-responsive">

  	<input type="hidden" value="<%=dto.getM_name()%>" name="b_name">
  	<input type="hidden" value="<%=dto.getM_email()%>" name="b_email">
  	<input type="hidden" value="<%=dto.getM_tel()%>" name="b_tel">
  	
  <!-- Table -->
 	<table class="table" border="1">
  		<tr>
    		<th style="width: 100px">SUBJECT</th><td colspan="3"><input type="text" style="width: 100%;" name="b_title"></td>
   		</tr>
   		<tr>
   			<th>NAME</th><td colspan="3"><%=dto.getM_name()%></td>
   		</tr>
   		<tr>
   			<th>Email</th><td><%=dto.getM_email()%></td> <th style="width: 100px">Tel</th><td><%=dto.getM_tel()%></td>
   		</tr>
   		<tr>
   			<th>CONTENT</th>
   			<td colspan="4"><textarea rows="10" style="width: 100%;" name="b_content"></textarea></td>
   		</tr>
   		<tr>
   			<th>Password</th>
   			<td colspan="4"><input type="password" style="width: 100%;" maxlength="8" name="b_pass"></td>
   		</tr> 		
	</table>
  <!-- //table -->
  
</div>
</div>

  </form>
<!-- //게시판리스트 -->
<div class="container text-center">
<div class="btn-group btn-group-sm" role="group" aria-label="...">
        	<button type="button" onclick="javascript:history.back();" class="btn btn-default">Close</button>
        	<button type="button" onclick="javascript:checkFrm();" class="btn btn-default">OK</button>
		</div>
</div>


<br><br>
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->
</body>
</div>
</html>