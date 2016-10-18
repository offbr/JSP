<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<jsp:useBean id="dto" class="board.business.QnaDto"/>
<% 
String b_no = request.getParameter("b_no");
String b_pass = request.getParameter("b_pass");
String pageNum = request.getParameter("pageNum");
String pageList = request.getParameter("pageList");

Map<String, String> map = new HashMap<String, String>();
map.put("b_no", b_no);
map.put("b_pass", b_pass);

if(processDao.qnaCheckPass(map) == false){
	%>
	<script>
	alert("비밀번호가 틀립니다");
	location.href = "qnaList.jsp?page=<%=pageNum%>&pageList=<%=pageList%>";
	</script>
<%
}

dto = processDao.qnaView(b_no);

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
function qnaUpdate(){
	document.goFrm.action = "qnaUpdate.jsp";
	document.goFrm.submit();
}

function qnaDelete(){
	if(confirm("정말삭제하시겠습니까?")){
		document.goFrm.action = "qnaDelete.jsp";
		document.goFrm.submit();
	}
}

</script>

</head>
<div class="container">
<body>
<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->
<br><br>


<!-- 게시판리스트 -->
<div class="container">
<div class="panel panel-default table-responsive">

  <!-- Table -->
 	<table class="table table-sm" border="1">
  		<tr>
    		<th style="width: 100px">SUBJECT</th><td colspan="3"><%=dto.getB_title()%></td>
   		</tr>
   		<tr>
   			<th>NAME</th><td><%=dto.getB_name()%></td> <th style="width: 100px">DATE</th><td><%=dto.getB_date()%></td>
   		</tr>
   		<tr>
   			<th>Email</th><td><%=dto.getB_email()%></td> <th style="width: 100px">Tel</th><td><%=dto.getB_tel()%></td>
   		</tr>
   		<tr>
   			<th rowspan="4">CONTENT</th>
   			<td colspan="3" rowspan="4"><textarea rows="10" style="width: 100%; border: none;" readonly="readonly"><%=dto.getB_content()%></textarea></td>
   		</tr>
	</table>
  <!-- //table -->
  
</div>
</div>
<!-- //게시판리스트 -->

<form method="post" name="goFrm">
<div class="container text-center">
<div class="btn-group btn-group-sm" role="group" aria-label="...">
			<input type="hidden" name="b_no" value="<%=b_no%>">
        	<button type="button" onclick="javascript:history.back();" class="btn btn-default">Close</button>
        	<button type="button" onclick="javascript:qnaUpdate();" class="btn btn-default">Modify</button>
        	<button type="button" onclick="javascript:qnaDelete();" class="btn btn-default">Delete</button>
		</div>
</div>
</form>

<br><br>
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->
</body>
</div>
</html>













