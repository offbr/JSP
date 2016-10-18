<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/earlyaccess/notosanskr.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link rel="shortcut icon" href="../../images/lego_32.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>
<body>
<!-- header -->
<%@ include file="../../header.jsp" %>
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
		<li class="last"><a href="../qna/qnaList.jsp" title="Q&A">Q&amp;A</a></li>
		<li><a href="../faq/faqList.jsp" title="자주묻는질문" class="letter">자주묻는질문</a></li>
		<li class="actived"><a href="../notice/noticeList.jsp" title="공지사항">공지사항</a></li>
	</ul>
</div>
<!-- //sub_tab -->		
    <!-- default_con -->
	<div class="default_con">


 <!-- faq_list -->
 <div class="faq_list">
 
 
 
     
      <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon_no"></span>
                 해피레고만의 특별한 혜택!</a>
			 </p>
     </div>
     <!-- //f_request -->
     <!-- f_answer -->
     <div class="f_answer_no">
     <span style="color: black; font-family: 돋움,dotum;">
     해피레고에서 준비했습니다.<br>
     선택한 레고를 바로 받아볼 수 있는 해피레고퀵!<br>
     신청은 콜센터에서 가능합니다.
     <br><br><p/>
     
     <b>해피레고 콜센터 1004 - 1004</b>
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     




     <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon_no"></span>
                  새로운 해피레고 탄생!</a>
			 </p>
     </div>
     <!-- //f_request -->
     <!-- f_answer -->
     <div class="f_answer_no">
     <span style="color: black; font-family: 돋움,dotum;">
     더 편리하고 ~ 더 간편하게! <br>
     해피레고에서는 웹과 모바일에서 간단한 회원가입후 간편한 실시간 서비스 신청 가능하며<br><p/>
     회원가입 없이 편리하게 문의하실수 있는 게시판을 이용하실 수 있습니다.<br><br><p/>
     
     <b>해피레고 콜센터 1004 - 1004</b>
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
 
     
   
   
</div>
 <!-- //faq_list -->
            
            
        </div>
        <!-- //default_con -->
    </section>
    <!-- //contents -->
</section>
<!-- //container -->

<script>
    function faqView(_t)
    {
        var __t = $(_t);
        $('div.faq_list').find('.f_request').each(function(){
            if($(this).index() == __t.index()){
                    $(this).next().stop(true).fadeIn(300);
                    $(this).addClass('open');
            }else{
                    $(this).next().stop(true).hide();
                    $(this).removeClass('open');
            }
        });
    }
</script>

<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</html>















