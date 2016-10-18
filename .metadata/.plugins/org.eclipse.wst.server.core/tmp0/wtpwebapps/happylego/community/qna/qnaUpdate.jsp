<%@page import="communtity.business.QnaMDto"%>
<%@page import="communtity.business.QnaDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="communtity.business.QnaBean"/>
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
<% }
ArrayList<QnaDto> list = (ArrayList)processDao.qnaView(map); //해당 수정게시글 읽기

ArrayList<QnaMDto> mlist = (ArrayList)processDao.qnaM_View(b_no); //해당 수정 답변 읽기
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
<script>
function checkFrm() {
	var b_passOk = <%=b_pass%>;
	var f = document.qnaFrm;
	if (f.b_id.value == "") {
		alert(b_passOk);
		alert("이름을 입력하세요.");
		f.b_id.focus();
		return;
	}

	if (f.b_mail1.value == "") {
		alert("이메일을 입력해 주세요.");
		f.b_mail1.focus();
		return;
	}

	if (f.b_mail2.value == "" && f.b_mail3.value == "") {
		alert("이메일을 입력해 주세요.");
		f.b_mail2.focus();
		return;
	}

	if (f.b_mail2.value != "") {
		var b_mail = f.b_mail1.value + "@" + f.b_mail2.value;

		if (!(b_mail) == 1) { //정규표현식 확인
			alert("이메일 형식이 틀립니다.");
			f.b_mail2.focus();
			return;
		}
	}

	if (f.b_phone2.value == "") {
		alert("휴대폰을 입력해 주세요.");
		f.b_phone2.focus();
		return;
	}

	if (f.b_phone3.value == "") {
		alert("휴대폰을 입력해 주세요.");
		f.b_phone3.focus();
		return;
	}

	if (f.b_pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		f.b_pass.focus();
		return;
	}

	if (f.b_title.value == "") {
		alert("제목을 입력하세요.");
		f.b_title.focus();
		return;
	}
	
	if(f.b_pass.value == b_passOk){
		f.submit();
	}else{
		alert("비밀번호가 틀립니다.");
		f.b_pass.value = "";
		f.b_pass.focus();
		return;
	}
		
}
function setEmail() {
	var f = document.qnaFrm;
	f.b_mail2.value = f.b_mail3.value;
}

function m_Update() {
	document.qnaU.submit();
}

</script>
</head>
<body>



<c:forEach var="d" items="<%=list%>"> <!-- 게시글 읽기 -->
	<c:set var="b_no" value="${d.b_no}"/>
	<c:set var="b_id" value="${d.b_id}"/>
	<c:set var="b_pass" value="${d.b_pass}"/>
	<c:set var="b_mail" value="${d.b_mail}"/>
	<c:set var="b_phone" value="${d.b_phone}"/>
	<c:set var="b_title" value="${d.b_title}"/>
	<c:set var="b_content" value="${d.b_content}"/>
	<c:set var="b_date" value="${d.b_date}"/>	
	<c:set var="b_read" value="${d.b_read}"/>
	<c:set var="b_state" value="${d.b_state}"/>
</c:forEach>

<c:forEach var="m" items="<%=mlist%>"> <!-- 답변 읽기 -->
	<c:set var="m_no" value="${m.m_no}"/>
	<c:set var="m_id" value="${m.m_id}"/>
	<c:set var="m_title" value="${m.m_title}"/>
	<c:set var="m_content" value="${m.m_content}"/>
	<c:set var="m_date" value="${m.m_date}"/>	
</c:forEach>

<!-- header -->
<%@ include file="../../header.jsp" %>
<c:set var="idkey" value="<%=idkey%>"/><!-- 관리자키 -->
<!-- //header -->

<article class="sub_visual sub01">
    <h3 class="big_title">커뮤니티</h3>
    <h4 class="sub_title">해피레고를 찾아주셔서 감사합니다.</h4>
</article>

<!-- container -->
<section id="container">
<!-- contents -->
<section id="contents" class="icon_sub nomember">
	<p class="icon_title"><img src="../../images/icon_community.png" alt=""/></p>

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

<form name="qnaFrm" method="post" action="qnaUpdateProc.jsp">
	<input type="hidden" name="b_no" id="" value="${b_no}">
	<input type="hidden" name="b_read" id="" value="${b_read}">
	<input type="hidden" name="b_state" id="" value="${b_state}">
	<div class="review_write">
		<table class="i_table">
			<colgroup>
				<col class="i_t_01">
				<col class="i_t_02">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><em class="color_01">*</em> 작성자</th>
					<td><input type="text" name="b_id" maxlength="100" id="" value="${b_id}" class="type_02"></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 이메일</th>
					<td>
						<p class="email_wrap">
							<input type="text" name="b_mail1" maxlength="25" value="${fn:substringBefore(b_mail, '@')}" id="" class="email_01">
							<span class="char">@</span> 
							<input type="text" name="b_mail2" maxlength="25" value="${fn:substringAfter(b_mail, '@')}" id="" class="email_02">
								<select class="email_03 i_select" name="b_mail3" onchange="setEmail()">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>
							</select>
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 휴대폰</th>
					<td>
						<p class="phone_wrap">
							<select class="number_01 i_select" name="b_phone1">
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<span class="under">-</span> 			
							<input type="text" name="b_phone2" maxlength="4" value="${fn:substring(b_phone, 4, 8)}" id=""  class="number_02"> 
							<span class="under">-</span> 
							<input type="text" name="b_phone3" maxlength="4" value="${fn:substring(b_phone, 9, 13)}" id=""  class="number_02">
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 비밀번호</th>
					<td>
					<input type="password" name="b_pass" maxlength="15" id="" class="type_01"> 
					<span class="table_info_01">글 작성시 입력한 비밀번호를 입력해 주세요</span>
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 제목</th>
					<td>
					<input type="text" name="b_title" maxlength="100" id="" value="${b_title}" class="type_02"> 
					<input type="hidden" name="issecret" value="1" />
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td><textarea name="b_content" id="ir1" style="height: 600px;">${b_content}</textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>

<c:if test="${idkey == 'manager'}">
<div class="list_view answer_view">
	<form action="qnaM_Update.jsp" name="qnaU" method="post">
		<input type="hidden" name="m_no" value="${m_no}">
		<input type="hidden" name="b_no" value="${b_no}">
		<input type="hidden" name="b_pass" value="<%=b_pass%>" /> 
		<input type="hidden" name="sblock" value="<%=sblock%>"/> 
		<input type="hidden" name="page" value="<%=spage%>"/>
		<div class="view_top">
    		<h3><img src="../../images/icon_a.png" alt="A" class="vtm m_r_5" width="31"></h3>
    		<input type="text" name="m_title" style="font-size: 20px; margin-left: 60px;" value="${m_title}">
    			<ul class="v_t_info">
        			<li><span class="f_play_R">관리자</span></li>
        			<li><span class="f_play_R">날짜 자동입력</span></li>
    			</ul>
		</div>
	<div class="view_con">
	<p><textarea name="m_content" rows="10" cols="20" style="font-size: 20px">${m_content}</textarea></p>
	<div class="btn_list">
	<a href="javascript:m_Update();" title="답변 수정" class="type02">답변 수정</a>
	</div> <br>비밀번호 : ${b_pass}
	</div> 
	</form>
</div>
</c:if>
<!-- //관리자 답변 남기기-->



<div class="btn_list">
	<a href="javascript:checkFrm();" title="수정" class="type02">수정</a>
	<a href="javascript:history.back();" title="취소" class="type01">취소</a>
</div>

</div>
<!-- //default_con -->
</section>
<!-- //contents -->
</section>
<!-- //container -->


	<form name="qnaPwdFrm" method="post" action="qnaView.jsp">  <!--view 에서 수정할 때 패스워스 틀렸으면 되돌아가기 -->
		<input type="hidden" name="b_no" value="<%=b_no%>" />
		<input type="hidden" name="b_pass" value="<%=b_pass%>" /> 
		<input type="hidden" name="sblock" value="<%=sblock%>"/> 
		<input type="hidden" name="page" value="<%=spage%>"/>
	</form>
	
	
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</html>



