<%@page import="communtity.business.QnaMDto"%>
<%@page import="communtity.business.QnaDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="communtity.business.QnaBean"/>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<%

String b_no = request.getParameter("b_no");
String b_pass = request.getParameter("b_pass");
String b_state = request.getParameter("b_state");
String sblock = request.getParameter("block");
String spage = request.getParameter("page");

Map<String, String> map = new HashMap<String, String>();
map.put("b_no", b_no);
map.put("b_pass", b_pass);

if(processDao.qnaCheckPass(map) == false){
%>
	<script>
	alert("비밀번호가 틀립니다");
	location.href = "qnaList.jsp?block=<%=sblock%>&page=<%=spage%>";
	</script>
<%
}

processDao.qnaViewRead(b_no); //조회수증가
ArrayList<QnaDto> list = (ArrayList)processDao.qnaView(map); //게시글 읽기

ArrayList<QnaMDto> mlist = (ArrayList)processDao.qnaM_View(b_no); //답변게시글 읽기 	

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
	function getPassword(mode) {
		var f = document.qnaPwdFrm;
		f.mode.value = mode;
		f.password.value = '';

		$("#qna_pwd").show();
	}

	function checkPwdFrm() {
		var f = document.qnaPwdFrm;

		if (f.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			f.password.focus();
			return;
		}

		if (f.mode.value == "del") {
			f.action = "qnaDelete.jsp";
			if (!confirm("정말 삭제하시겠습니까?")) {
				return;
			}
		} else {
			f.action = "qnaUpdate.jsp";
		}

		f.submit();
	}

	function closePwd() {
		$("#qna_pwd").hide();
	}

	function m_Write() {
		document.qnaM.submit();
	}
	
</script>
<body>

<c:forEach var="d" items="<%=list%>"> <!-- 게시글 -->
	<c:set var="b_no" value="${d.b_no}"/>
	<c:set var="b_gid" value="${d.b_id}"/>
	<c:set var="b_pass" value="${d.b_pass}"/>
	<c:set var="b_title" value="${d.b_title}"/>
	<c:set var="b_content" value="${d.b_content}"/>
	<c:set var="b_date" value="${d.b_date}"/>	
	<c:set var="b_read" value="${d.b_read}"/>
	<c:set var="b_state" value="${d.b_state}"/>
</c:forEach>

<c:forEach var="m" items="<%=mlist%>"> <!-- 답변 -->
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
	<!-- list_view -->
	<div class="list_view">
    	<!-- view_top -->
		<div class="view_top">
		<h3><img src="../../images/icon_q.png"  class="vtm m_r_5" width="31">${b_title}</h3>
		<ul class="v_t_info">
			<li><span class="f_play_R">${b_id}</span></li>
			<li><span class="f_play_R">${b_date}</span></li>
			<li><span class="f_play_R">${b_read}</span></li>
		</ul>
	</div>
	<!-- //view_top -->
    <!-- view_con -->
	<div class="view_con"><p>${b_content}</p><p>&nbsp;</p></div>
	</div>
	<!-- //list_view -->
	
	
<!-- 관리자 답변 남기기 -->


<c:if test="${idkey == 'manager' && b_state == '0'}">
<div class="list_view answer_view">
	<form action="qnaM_Write.jsp" name="qnaM" method="post">
		<input type="hidden" name="idkey" value="${idkey}">
		<input type="hidden" name="b_no" value="${b_no}">
		<input type="hidden" name="b_pass" value="<%=b_pass%>"> 
		<input type="hidden" name="sblock" value="<%=sblock%>">
		<input type="hidden" name="spage" value="<%=spage%>">
		<div class="view_top">
    		<h3><img src="../../images/icon_a.png" alt="A" class="vtm m_r_5" width="31"></h3>
    		<input type="text" name="m_title" style="font-size: 20px; margin-left: 60px;">
    			<ul class="v_t_info">
        			<li><span class="f_play_R">관리자</span></li>
        			<li><span class="f_play_R">날짜 자동입력</span></li>
    			</ul>
		</div>
	<div class="view_con">
	<p><textarea name="m_content" rows="10" cols="20" style="font-size: 20px"></textarea></p>
	<div class="btn_list">
	<a href="javascript:m_Write();" title="답변 등록" class="type02">답변 등록</a>
	</div> <br>비밀번호 : ${b_pass}
	</div> 
	</form>
</div>
</c:if>
<!-- //관리자 답변 남기기-->

<!-- list_view -->
<c:if test="${b_state == '1'}">
<div class="list_view answer_view">
    <!-- view_top -->
	<div class="view_top">
    	<h3><img src="../../images/icon_a.png" alt="A" class="vtm m_r_5" width="31">${m_title}</h3>
    		<ul class="v_t_info">
        		<li><span class="f_play_R">관리자</span></li>
        		<li><span class="f_play_R">${m_date}</span></li>
    		</ul>
	</div>
<!-- //view_top -->

<!-- view_con -->
<div class="view_con"><p>${m_content}</p></div> 
<!-- //view_con -->	
<c:if test="${idkey == 'manager'}">
<br>비밀번호 : ${b_pass}
</c:if>
</div>
</c:if>
<!-- //list_view -->






	<div class="btn_list">
		<a href="qnaList.jsp?block=<%=sblock%>&page=<%=spage%>" title="목록" class="type02">목록</a> 
		<a href="javascript:getPassword('mod');" title="수정" class="type01">수정</a>
		<a href="javascript:getPassword('del');" title="삭제" class="type01">삭제</a>
	</div>
	<form name="qnaPwdFrm" method="post" action="qnaView.jsp">
		<input type="hidden" name="b_no" value="${b_no}" />
		<input type="hidden" name="b_pass" value="${b_pass}" /> 
		<input type="hidden" name="sblock" value="<%=sblock%>" /> 
		<input type="hidden" name="page" value="<%=spage%>" />
		<input type="hidden" name="mode" value="" /> <!--수정 삭제값을 가지고 체크 한다 --> 
		<div class="pw_pop" id="qna_pwd" style="display: none;">
			<p class="title f_play_R">PASSWORD</p>
			<p class="input_pw"><input type="password" maxlength="20" name="password" id="" /></p>
			<p class="btn_list">
				<a href="javascript:checkPwdFrm();" onclick="" title="확인" class="type02">확인</a> 
				<a href="javascript:closePwd();" title="취소" class="type01">취소</a>
			</p>
		</div>
	</form>
        </div>
        <!-- //default_con -->
    </section>
    <!-- //contents -->
</section>
<!-- //container -->

<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->
</html>
</body>