<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.business.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="processDao" class="mono.mybatis.ProcessDao"/>
<% 

int pageNum = 1; //하단 페이지 수
int pageList = 10; //1페이지에 보여질 게시글 수
int b_pageList = 10; //1블럭에 보여질 페이지 수;
int block = 1; //블럭 수

// 하단 페이지수
try{
	 pageNum = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){
	pageNum = 1; //parameter page값이 제대로 안들어오면 1;
}
if(pageNum <= 0) pageNum = 1; //parameter page값 이상한값 들어오면 1;
// /하단 페이지수

// 게시글수
try{
	pageList = Integer.parseInt(request.getParameter("pageList"));
}catch(Exception e){
	pageList = 10; //parameter pageList값이 제대로 안들어오면 1;
}
if(pageList <= 0) pageList = 1; //parameter pageList값 이상한값 들어오면 1;
// /게시글수

// 블럭수
try{
	block = Integer.parseInt(request.getParameter("block"));
}catch(Exception e){
	block = 1; //parameter pageList값이 제대로 안들어오면 1;
}
if(block <= 0) block = 1; //parameter pageList값 이상한값 들어오면 1;
// //블럭수

block = (int)Math.ceil((double)pageNum/b_pageList); // 계산된 블럭수

int b_start_page = ((block-1) * b_pageList) + 1; //현재 블럭에서 시작 페이지 번호;
int b_end_page = b_start_page + b_pageList - 1; //현재 블럭에서 마지막 페이지 번호;

int totalPage = (int)Math.ceil((double)processDao.qnaCount()/pageList); //총 페이지 = 게시글의 총갯수 / 1뷰에 보여질 게시글 수;
if (b_end_page > totalPage) b_end_page = totalPage; //총 페이지수가 15인데 블럭 2개 만들어지면 마지막 페이지가 20이므로 공백 페이지가 생겼을때 처리;

int totalBlock = (int)Math.ceil((double)totalPage/b_pageList); //총 블럭수 = 총 페이지 갯수 / 블럭에 나타날 페이지 수

//DB limit (db는 시작페이지가 0);
int pageChoice = (pageNum - 1) * pageList; //
%>

<%
//검색이 있는 경우
String stype = request.getParameter("stype");
String sword = request.getParameter("sword");

Map<String, String> mapSerach = new HashMap<String, String>();

mapSerach.put("stype", stype);
mapSerach.put("sword", sword);
%>

<% 
ArrayList<QnaBean> list = null;
if(sword == null) 
	list = (ArrayList)processDao.qnaList(pageChoice); //검색이 없을 경우
else
	list = (ArrayList)processDao.qnaSearch(mapSerach); //검색이 있을 경우
%>


<% String m_email = (String)session.getAttribute("email_key"); // 세션값으로 자기글 읽기 %>
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

<!-- 메인 메뉴바 가운데 정렬 -->
<style>
table {
	font-family: 'Abel', sans-serif;
}
.example .pagination>li>a,
.example .pagination>li>span {
  	color: black;
}
.pagination>li.active>a {
	border-color: #ddd;
  	background: #949494;
  	color: black;
}
</style>

<script type="text/javascript">
function getPassword(b_no) {
	var f = document.qnaPwdFrm;
	f.b_no.value = b_no;
	$('#b_pass').focus();
	$('#myModal').modal('show');	
}

function checkPwdFrm() {
	var f = document.qnaPwdFrm;
	if (f.b_pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		f.b_pass.focus();
		return;
	}
	f.submit();
}

function closePwd() {
	$('#myModal').modal('hide');
}

function serach(){
	if(document.searchFrm.sword.value == ""){
		document.searchFrm.sword.focus();
		alert("검색어를 입력하세요!");
		return;
	}
	document.searchFrm.submit();
}
</script>

</head>
<div class="container">
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->
<br>

<!-- 검색창 -->
<div class="container text-right">

<form action="qnaList.jsp" name="searchFrm" method="post" class="form-inline">
	<div class="form-group">
	
	<select name="stype" class="form-control input-sm">
		<option value="b_title" selected="selected">글제목</option>
		<option value="b_name">글작성자</option>
	</select>
	<input type="text" name="sword" placeholder="검색어를 입력하세요" class="form-control input-sm">
	<a href="javascript:serach();"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>&nbsp;&nbsp;
	<a href="qnaWrite.jsp"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>  
	</div>
</form>

</div>
<!-- //검색창 -->

<br>

<!-- 게시판리스트 -->
<div class="container">
<div class="panel panel-default">

  <!-- Table -->
 	<table class="table" border="1">
  		<tr style="font-weight: bold;">
    		<th style="width: 100px">NO</th><th>SUBJECT</th><th style="width: 150px">NAME</th><th style="width: 150px">DATE</th>
   		</tr>
	<c:forEach var="q" items="<%=list%>">
   		<tr style="color: #949494;">
   			<td>${q.b_no}</td>
   			<td>
   			<a href= "javascript:getPassword('${q.b_no}')">${q.b_title}</a> <img src="../../images/icon_lock.gif" alt="Q">
   			<c:if test="${q.b_state == '1'}"> <img src="../../images/icon-angle-down.png" alt="A"></c:if>
   			</td>
   			<td>${q.b_name}</td>
   			<td>${q.b_date}</td>
   		</tr>
   	</c:forEach>
   	
	</table>
  <!-- //table -->
  
</div>
</div>
<!-- //게시판리스트 -->


<div class="container text-center">
<div class="example">
<nav>
	<ul class="pagination pagination-sm">
	
		<!-- 첫페이지로 가기 -->
			<% 
		if(pageNum <= 1){  // 페이지번호가 1보다 작거나 같다면 클릭x 
		%>
		<li class="disabled"><a href="#">First</a></li>
		<% 
		}else{ // 1보다 크면 클릭o
		%>
		<li><a href="qnaList.jsp?page=&pageList=<%=pageList%>">First</a></li>
		<% 
		}
		%>
		<!-- //첫페이지로 가기 -->
		
		<!-- 이전 10개 -->	
		<%
		if(block <= 1){ // 블럭이 1보다 작거나 같다면 클릭x
		%>
		<li class="disabled"><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
		<%
		}else{ //  1보다 크면 클릭o
		%>
		<li><a href="qnaList.jsp?page=<%=b_start_page - 1%>&pageList=<%=pageList%>" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
		<%
		}
		%>
		<!-- //이전 10개 -->
		
		<!-- 페이지 리스트 -->
		<%
		for(int i = b_start_page; i <= b_end_page; i++){ //시작페이지부터 마지막페이지까지 반복문
			if(pageNum == i){ // 현재페이지와 i가 같으면 클릭 x
				%>
				<li class="active"><a href="#"><%=i%></a></li>
				<%
			}else{
				%>
				<li><a href="qnaList.jsp?page=<%=i%>&pageList=<%=pageList%>"><%=i%></a></li>
				<%
			}
		}
		%>
		<!-- //페이지 리스트 -->
		
		<!-- 다음 10개 -->
		<%
		if(block >= totalBlock){ //현재 블럭과 총 블럭갯수가 같으면 클릭x
		%>
		<li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
		<%
		}else{
		%>
		<li><a href="qnaList.jsp?page=<%=b_end_page + 1%>&pageList=<%=pageList%>" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
		<%	
		}
		%>
		<!-- //다음 10개 -->
		
		<!-- 마지막페이지 -->
		<%
		if(pageNum >= totalPage){ //현재페이지의 수와 총페이지수가 같다면 클릭x
		%>
		<li class="disabled"><a href="#">Last</a></li>
		<%	
		}else{
		%>
		<li><a href="qnaList.jsp?page=<%=totalPage%>&pageList=<%=pageList%>">Last</a></li>
		<%
		}
		%>
		<!-- //마지막페이지 -->
	</ul>

</nav>
</div>
</div>

<!-- 비밀번호 폼 -->
<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

<div class="form-group text-center">
<form name="qnaPwdFrm" id="qnaPwdFrm"  method="post" action="qnaView.jsp" class="form-inline">
	<input type="hidden" name="b_no" value="${b_no}" /> 
	<input type="hidden" name="pageNum" value="<%=pageNum%>" /> 
	<input type="hidden" name="pageList" value="<%=pageList%>" />
	<input type="hidden" name="b_state" value="${b_state}" />
	<div class="modal-body">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="gridSystemModalLabel">비밀번호</h4>
		<label for="recipient-name" class="control-label">해당 게시글의 비밀번호를 입력해주세요</label>
            <input type="password" maxlength="20" name="b_pass" id="b_pass" class="form-control input-sm" id="recipient-name">
        <div class="btn-group btn-group-sm" role="group" aria-label="...">
        	<button type="button" onclick="javascript:closePwd();" class="btn btn-default" data-dismiss="modal">Close</button>
        	<button type="button" onclick="javascript:checkPwdFrm();" class="btn btn-default">OK</button>
		</div>
	</div>
</form>
</div>

   </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- //비밀번호 폼 -->


<br><br>
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</div>
</html>






