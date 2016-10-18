<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="communtity.business.QnaDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="communtity.business.QnaBean"/>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<% 


int spage = 0; //현재페이지
int pageCount = 10; // 1페이지에 10개 칼럼
int sblock = 0; //현재 블럭
int blockCount = 10; //1블럭에 10개 페이수

int totalPage = processDao.totalPage(); //총페이지수
int totalBlock = processDao.totalBlock(totalPage); // 총블럭

try{
	sblock = Integer.parseInt(request.getParameter("block"));
}catch(Exception e){
	sblock = 1; //parameter pageBlock의 값이 제대로 안들어오면 1;
}
if(sblock <= 0) sblock = 1; //parameter pageBlock의 값이 이상한 값이면 1; 
 
try{
	spage = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){
	spage = 1; //parameter page의 값이 제대로 안들어오면 1;
}
if(spage <= 0) spage = 1; //parameter page의 값이 이상한 값이면 1; 

int startPage = ((sblock-1)*pageCount)+1; //이전페이지 = ((현재블록-1)*10개칼럼)+1 항상 10의배수만 설정
int endPage = startPage + pageCount -1; //다음 페이지 

if (endPage > totalPage) endPage = totalPage; //10개씩 페이지를 생성하다보면 총 페이지보다 (빈페이지) 많이 생길수 있으므로 넘어갈경우 재설정; 

//검색이 있는 경우
String stype = request.getParameter("stype");
String sword = request.getParameter("sword");

Map<String, String> mapSerach = new HashMap<String, String>();

mapSerach.put("stype", stype);
mapSerach.put("sword", sword);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link rel="shortcut icon" href="../../images/lego_32.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
function getPassword(b_no) {
	var f = document.qnaPwdFrm;
	f.b_no.value = b_no;

	$("#qna_pwd").show();

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
	$("#qna_pwd").hide();
}

function serach(){
	if(document.searchFrm.sword.value == ""){
		document.searchFrm.sword.focus();
		alert("검색어를 입력하시오!");
		return;
	}
	document.searchFrm.submit();
}

</script>
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<c:set var="idkey" value="<%=idkey%>"/> <!-- 관리자키 -->
<!-- //header -->

<article class="sub_visual sub01">
    <h3 class="big_title">커뮤니티</h3>
    <h4 class="sub_title">해피레고를 찾아주셔서 감사합니다.</h4>
</article>

<section id="container">
    <section id="contents" class="icon_sub nomember">

<p>
	<img src="../../images/icon_community.png" alt="" />
</p>
<!-- sub_tab -->
<div class="sub_tab review_tab">
	<ul>
		<li class="actived"><a href="qnaList.jsp" title="Q&A" class="letter">Q&amp;A</a></li>
		<li><a href="../faq/faqList.jsp" title="자주묻는질문">자주묻는질문</a></li>
		<li class="last"><a href="../notice/noticeList.jsp" title="공지사항">공지사항</a></li>
	</ul>
</div>
<!-- //sub_tab -->		
    <!-- default_con -->
	<div class="default_con">
<!-- list_sort_wrap -->
<div>
<form action="qnaList.jsp" name="searchFrm" method="post">
<div class="list_sort_wrap">
	<div style="margin-left: 1000px"><select name="stype">
		<option value="b_title" selected="selected">글제목</option>
		<option value="b_id">글작성자</option>
	</select>
	</div>
	<div class="list_search">
	<p class="l_s_input"><input type="text" name="sword" placeholder="검색어를 입력하세요"></p>
	<p class="l_s_btn"><a href="javascript:serach();"><img src="../../images/btn_list_search.gif" alt="" width=""></a></p>
	</div>
</div>
</form>
</div>
<div>
<!-- qna_list -->
<div class="qna_list">
    <table class="c_table_01">
        <caption>테이블 제목</caption>
		<colgroup>
		<col class="t_layout_c qna_01">
		<col class="m_layout_c qna_02">
		<col class="m_layout_c qna_03">
		<col class="t_layout_c qna_04">
		<col class="d_layout_c qna_05">
		</colgroup>
<thead>
    <tr>
        <th scope="col" class="t_layout_t bl">번호</th>
        <th scope="col" class="m_layout_t ml">제목</th>
        <th scope="col" class="m_layout_t mr">작성자</th>
        <th scope="col" class="t_layout_t mr">등록일</th>
        <th scope="col" class="d_layout_t br">조회수</th>
    </tr>
</thead>
<%
	ArrayList<QnaDto> list = null;
	int start = (spage-1) * pageCount;
	if(sword == null) 
		list = (ArrayList)processDao.qnaAll(start);
	else
		list = (ArrayList)processDao.qnaSearch(mapSerach);
%> 
	<c:forEach var="d" items="<%=list %>">
		<tr>
		<td class="t_layout_t bl"><span class="f_play_R">${d.b_no}</span></td>
		<td class="m_layout_t ml tl"><img src="../../images/icon_q.png" alt="Q" class="vtm" width="31">
		<c:if test="${d.b_state eq 1}"> <!-- 답변이 달렸을 때 1 안달렸을 때 0-->
		<img src="../../images/icon_a.png" alt="A" width="31">
		</c:if>
		<a href= "javascript:getPassword('${d.b_no}')" class="vtm m_l_5">${d.b_title}</a>
		<img src="../../images/icon_lock.png" alt="" class="m_l_10" width="14" width="14">
		<c:if test="${idkey == 'manager'}"> : ${d.b_pass}</c:if>
		</td>
		<td class="m_layout_t mr">${d.b_id}</td>
		<td class="t_layout_t mr"><span class="f_play_R">${d.b_date}</span></td>
		<td class="d_layout_t br"><span class="f_play_R">${d.b_read}</span></td>
		</tr>
		<c:set var="b_state" value="${d.b_state}"></c:set>
	</c:forEach>	
	</tbody>
</table>
</div>
	<div class="btn_list b_r">
		<a href="qnaWrite.jsp" title="등록하기" class="type02">등록하기</a>
	</div>
<div class="paging">
<%
out.print("<a href='qnaList.jsp?block=1&page=1' class='prevEnd'><img src='../../images/prevEnd.gif' alt='맨처음'></a>");
if(sblock <= 1){
	out.print("<span class='prev'><img src='../../images/prev.gif' alt='이전 10개'></span>" );
}else{ //(startPage-1) 은 startPage는 항상 10의 배수만 가리키므로 이전을 누르면 (10-9)로 9페이지이동 (20-1) 19페이지 이동
	out.print("<a href='qnaList.jsp?block=" + (sblock-1) + "&page=" + (startPage-1) + "' class='prev'>"+ 
				"<img src='../../images/prev.gif' alt='이전 10개'></a>");
}
for(int i = startPage; i <= endPage; i++){
	if(i == spage){ //spage 현재페이지
		out.print("<strong class='border'>" + i + "</strong>");					
	}else{
		out.print("&nbsp;<a href='qnaList.jsp?block=" + sblock + "&page=" + i + "'>" +i+ "</a>&nbsp;");
	}
}
if(sblock >= totalBlock){ 
	out.print("<span class='next'><img src='../../images/next.gif' alt='다음 10개'></span");
}else{ //(endPage+1) 은 endPage는 항상 10의 배수만 가리키므로 다음을 가리면 (10+1)로 11페이지이동 (20+1) 21페이지이동(endPage가 totalPage보다 넘어갈경우 같게 설정)
	out.print("<a href='qnaList.jsp?block=" + (sblock+1) + "&page=" + (endPage+1) + "' class='next'>"+
				"<img src='../../images/next.gif' alt='다음 10개'></a>");
}
out.print("<a href='qnaList.jsp?block=" + totalBlock + "&page=" + (totalPage) + "' class='nextEnd'>" +
			"<img src='../../images/nextEnd.gif' alt='맨마지막'></a>");
%>
</div>
 <!-- //list_view -->
<div>
<form name="qnaPwdFrm" method="post" action="qnaView.jsp">
	<input type="hidden" name="b_no" value="${b_no}" /> 
	<input type="hidden" name="page" value="<%=spage%>" /> 
	<input type="hidden" name="block" value="<%=sblock%>" />
	<input type="hidden" name="b_state" value="${b_state}" />
		<div class="pw_pop" id="qna_pwd" style="display: none;">
		<p class="title">비밀번호 확인</p>
		<p class="info">이 게시글의 비밀번호를 입력해주세요</p>
		<p class="input_pw">
			<input type="password" maxlength="20" name="b_pass" id="" /> 
			<a href="javascript:checkPwdFrm();" onclick="" title="확인" class="btn_com">확인</a>
		</p>
			<a href="javascript:closePwd();" class="btn_close"><img src="../../images/btn_pop_close.png" alt=""></a>
		</div>
</form>
</div>
     </div>
     <!-- //qna_list -->
        </div>
        <!-- //default_con -->
    </section>
    <!-- //contents -->
</section>
<!-- //container -->

<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->


</body>
</html>