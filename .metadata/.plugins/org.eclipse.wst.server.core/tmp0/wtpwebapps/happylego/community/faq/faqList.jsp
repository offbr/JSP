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
		<li><a href="../qna/qnaList.jsp" title="Q&A">Q&amp;A</a></li>
		<li class="actived"><a href="../faq/faqList.jsp" title="자주묻는질문" class="letter">자주묻는질문</a></li>
		<li class="last"><a href="../notice/noticeList.jsp" title="공지사항">공지사항</a></li>
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
                 <span class="r_icon"></span>Q&nbsp;영업시간은&nbsp;어떻게&nbsp;되나요?&nbsp;</a>
             </p>
     </div>
     <!-- //f_request -->
     
     <!-- f_answer -->
     <div class="f_answer"><p>&nbsp;</p><p>
     
     <span style="color: black; font-family: 돋움,dotum;">
     <font size="2">본사 영업시간은 09:30 ~ 18:30 까지 운영되고 있으며,</font>
     </span>&nbsp;</p><p style="line-height: 1.4;">
     
     <span style="font-family: 돋움,dotum;">
     <font color="#000000">해피레고&nbsp;레고 배송가능시간 : 09:30 ~ 18:30 까지, 반납가능시간 : 09:30 ~ 18:30 까지 입니다.</font>
     </span>&nbsp;</p><p style="line-height: 1.4;">
     
     <span style="font-family: 돋움,dotum;">단, 18:30 이후 반납을 원하시는 고객님은 반드시 본사 고객센터 1004-1004 로 연락주시어 반납가능시간을 체크하여 주시기 바랍니다.
     </span>&nbsp;</p><p style="line-height: 1.4;">
     
     <span style="font-family: 돋움,dotum;">(09:30 이전 반납을 원하시는 고객님은 고객센터로 전화주시어 반드시 상담원에게 해당내용을 전달하시고 직원이 출근하기 전인 관계로 레고체크 및 반납확인이 불가하여 업무시간 이후에 처리되어집니다</span>&nbsp;
     <span style="font-family: 돋움,dotum;">반드시 본사 고객센터 1004-1004 상담 하셔야 반납이 가능합니다. )</span></p><p><p>&nbsp;</p><p>&nbsp;</p>
     
     </div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
      <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>Q 레고는 깨끗한가요?﻿</a>
             </p>
     </div>
     <!-- //f_request -->
     
     <!-- f_answer -->
     <div class="f_answer">
     <p>네. 모든 레고는 고온에서 살균 세척하여 철저하게 위생 관리하고 있습니다.</p>
     <p>※ 장난감 전용 소독기, 고온 세척기, 고온 건조기, 세척용 물티슈 등을 활용하여 청결 유지합니다</p>
     </div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
     
      <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>
                 ﻿Q 레고 부품을 분실하면 어떻게 되나요?</a>
 			 </p>
     </div>
     <!-- //f_request -->
     
     <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     부품을 분실해도 과금하지 않습니다. 오히려 부품을 분실하지 않을 경우 적립금을 드립니다
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick=""><span class="r_icon"></span>﻿Q  사용연장을 원할때에는?﻿ </a>
                                         </p>
     </div>
     <!-- //f_request -->
   
     <!-- f_answer -->
     <div class="f_answer">
     <p><span style="color: black; font-family: 돋움,dotum;">
     사용연장은 대기자유무에 따라 가능하며 재고가 없을 경우<br>
     본사 콜센터 1004-1004&nbsp;내선번호1번으로&nbsp;연락을 하고 연장가능여부를 확인하여야 합니다.</span>
     <span style="font-family: 돋움,dotum;"> </span>&nbsp;</p><p style="line-height: 1.4;">
     <span style="font-family: 돋움,dotum;">만약, 본사와의 연락없이 임의적인 연장을 하신 경우, 추가과금등 불이익이 있을 수 있습니다.﻿</span>&nbsp;</p><p>&nbsp;</p>
     <p style="line-height: 1.4;"><font size="2"><font face="맑은 고딕"><span style="color: black; font-family: dotum;"></span></font></font>
     <font size="2"><font face="맑은 고딕"><span style="color: black; font-family: dotum;"><span lang="EN-US" style="font-family: 돋움,dotum;">﻿</span></span></font></font>
     <span style="font-family: 돋움,dotum;"> </span></p><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
	<!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick=""><span class="r_icon"></span>﻿Q 예약취소시 환불규정은 어떻게 되나요?﻿ </a>
                                         </p>
     </div>
     <!-- //f_request -->
     
     <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     결제하신 방법에 따라 환불을 해드리고 있습니다.
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
     
     <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>Q 주문하면 언제 받아 볼수 있나요?</a>
             </p>
     </div>
     <!-- //f_request -->
     
     <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
	 주문일로부터 3영업일 이내 (주말, 공휴일 제외) 출고되며, 출고 후 1~2일 이내 수령하실 수 있습니다
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
     <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>Q 반납은 어떻게 하나요</a>
             </p>
     </div>
     <!-- //f_request -->
	 <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     반납일에 맞춰 택배 기사님을 보내드립니다. 기사님께서 바로 수거하실 수 있도록 미리 박스 포장 부탁드립니다
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
     <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>
                 Q 서비스 이용료가 어떻게 되나요?</a>
             </p>
     </div>
     <!-- //f_request -->
      <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     10,000원, 20,000원, 30,000원으로 구성되어 있습니다. 부품 수, 소비자 가격, 조립 난이도에 따라 제품이 구분됩니다
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
          
      <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>
                 Q 결제는 어떻게 하면 되나요?</a>
			 </p>
     </div>
     <!-- //f_request -->
     <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     신용/체크카드로 결제하시면 됩니다
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
     
     
     
     <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>
                 Q 2세트 이상 빌릴수 없나요?</a>
			 </p>
     </div>
     <!-- //f_request -->
     <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     2세트 이상 대여는 어렵습니다.<br>
     원하는 레고를 지정 대여할 수 있는 '레고선택'에서 선택한 제품을 보내드리기 위해 최대 1세트까지 제한한 점 양해 부탁드립니다
     </span>
     <span style="font-family: 돋움,dotum;"> </span><p>&nbsp;</p></div>
     <!-- //f_answer -->
     
     
     
     
     
     
     
     
      <!-- f_request -->
     <div class="f_request" onclick="faqView(this);">
             <p class="f_category"><span></span></p>
             <p class="f_r_title">
                 <a href="javascript:;" onclick="">
                 <span class="r_icon"></span>
                 Q 대여중인 레고를 꼭 반납해야 다음 레고를 고를 수 있나요?</a>
			 </p>
     </div>
     <!-- //f_request -->
     <!-- f_answer -->
     <div class="f_answer">
     <span style="color: black; font-family: 돋움,dotum;">
     네. 반납 확인 후 다음 레고를 선택 할 수 있습니다
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















