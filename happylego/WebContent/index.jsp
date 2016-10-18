<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String idkey = (String)session.getAttribute("idkey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="css/base.css" media="screen">

<link rel="stylesheet" type="text/css" href="css/main.css" media="screen">
<link rel="shortcut icon" href="images/lego_32.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>
<body>


<!-- wrap -->
<section id="wrap">
    
	<!-- main_con -->
	<section id="main_con">	
		<!-- txt_wrap -->
		<div class="txt_wrap">
			<h1><img src="images/lego.png" alt="해피레고" width="200"/></h1>
			<p><img src="images/main_sub_title.png" width="350" alt="레고와 동심 그리고 해피레고 해피레고에서 처음 만나는 기분 좋은 설레임!"/></p>
			<ul class="main_list">
			
				<li class="list01">
					<div class="d_t">
						<div class="d_c">
							<a href="service/product/product.jsp">서비스신청</a>
						</div>
					</div>
				</li>
				
				<li class="list02">
					<div class="d_t">
						<div class="d_c">
							<a href="company/happy/companyindex.jsp">회사소개</a>
						</div>
					</div>
				</li>
				
				<li class="list03">
					<div class="d_t">
						<div class="d_c">
							<a href="guide/guidelist/guideindex.jsp">이용안내</a>
						</div>
					</div>
				</li>
				
				<li class="list04">
					<div class="d_t">
						<div class="d_c">
							<a href="community/qna/qnaList.jsp">Q&amp;A</a>
						</div>
					</div>
				</li>
				
				<li class="list05">
					<div class="d_t">
						<div class="d_c">
							<%if(idkey == null){%>
							<a href="mypage/member/login.jsp">마이페이지</a>
               				<%}else if(idkey.equals("manager")){%>
             		       	<a href="mypage/admin/manager.jsp" title="마이페이지">관리자</a>
							<%}else{%>
							<a href="mypage/member/myinfo.jsp" title="마이페이지">마이페이지</a>
							<%}%>
						</div>
					</div>
				</li>
							
			</ul>
		</div>
		<!-- //txt_wrap -->

		<!-- av_wrap -->
		<div class="av_wrap">			
			<video autoplay loop muted poster="images/av_bg.jpg" id="av">
				<source src="images/Swing.mp4">
				<source src="images/av_bg.webm">
				<img src="images/av_bg.jpg"/>
			</video>
			<p class="dot"></p>
		</div>
		<!-- //av_wrap -->

	</section>
	<!-- //main_con -->

	<script>
	$(document).ready(function(){		
		//guideH();
		$('#footer').css('margin-top',0);
		resize();

	});

	$(window).resize(function(){		
		resize();
	});

 var resize = function() {
	//console.log('resize');
	var $node = $('.av_wrap');
	var ratio = 16/9;
	var width = $node.parent().width(),
		pWidth, // player width, to be defined
		height = $node.parent().height(),
		pHeight, // player height, tbd
		$av = $('#av');

	// when screen aspect ratio differs from video, video must center and underlay one dimension

	if (width / ratio < height) { // if new video height < window height (gap underneath)
		pWidth = Math.ceil(height * ratio); // get new player width
		$av.width(pWidth).height(height).css({left: (width - pWidth) / 2, top: 0}); // player width is greater, offset left; reset top
	} else { // new video width < window width (gap to right)
		pHeight = Math.ceil(width / ratio); // get new player height
		$av.width(width).height(pHeight).css({left: 0, top: (height - pHeight) / 2}); // player height is greater, offset top; reset left
	}
}


	</script>



    <aside id="pop" style="display:none;">
        <!-- pop_table -->
        <section class="pop_table">
            <!-- pop_cell -->
            <div class="pop_cell" id="popdetail">

            </div>
        </section>
    </aside>
    <div id="commonLayer">
        
    </div>
</section>
<!-- //wrap -->

<!-- //wrap -->
<aside id="lnb">
    <p class="lnb_bg" ></p>
   <!-- lnb_wrap -->
    <div class="lnb_wrap">
        <!-- lnb_group -->
        <div class="lnb_group">
            <!-- lnb_top -->
            <div class="lnb_top">

                <p class="top03"><a href="/member/nonmember.jsp" title="예약확인"><span>서비스신청</span></a></p>
            </div>
            <!-- //lnb_top -->
            <!--
            //	li 태그에 actived 클래스 추가시 활성화
            -->
            <ul>
                <li >
                    <p class="one_depth" ><a href="/reservation/index.jsp" class="btn_one" title="실시간예약">서비스신청</a></p>
                </li>
                <li >
                    <p class="one_depth" ><a href="/service/" class="btn_one" title="해피렌트카">해피렌트카</a></p>						
                </li>
                <li >
                    <p class="one_depth" ><a href="/premium/" class="btn_one" title="편의장비">편의장비</a></p>						
                </li>
                <li >
                    <p class="one_depth" ><a href="/guide/guideList.jsp" class="btn_one" title="대여가이드">대여가이드</a></p>
                </li>
                <li >
                    <p class="one_depth" ><a href="#" class="btn_one kor" title="커뮤니티">커뮤니티</a></p>
                    <ul class="snb">
						<li><a href="/community/qna/qnaList.jsp" title="QnA">Q&amp;A</a></li>
						<li><a href="/community/faq/faqList.jsp" title="자주묻는질문">자주묻는질문</a></li>
                        <li><a href="/community/notice/noticeList.jsp" title="공지사항">공지사항</a></li>
                    </ul>
                </li>
                <li >
                    <p class="one_depth" ><a href="/events/eventList.jsp" class="btn_one" title="이벤트">마이페이지</a></p>
                </li>
            </ul>
        </div>
        <!-- //lnb_group -->
    </div>
    <!-- //lnb_wrap -->
</aside>



<!-- footer -->
<footer id="footer">
	<section class="footer_wrap">
		<h2>
			<img src="images/lego_128.png" alt="해피레고" width="5%" />
		</h2>
		<address>
			해피레고&nbsp;&nbsp;|&nbsp;&nbsp; 프로젝트
			&nbsp;&nbsp;|&nbsp;&nbsp;팀: 장현진, 이연남, 이동규, 오현은
			&nbsp;&nbsp;|&nbsp;&nbsp;주소지 : 서울특별시 강남 에이콘아카데미<br>
			사업자등록번호 : 000-0000-0000&nbsp;&nbsp;|&nbsp;&nbsp;통신판매신고번호 : 제
			0000-서울강남-0000호&nbsp;&nbsp;|&nbsp;&nbsp;<span class="letter">TEL
			: 1004-1004</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="letter">Fax
			: 000-000-0000</span><br> <span class="letter">COPYRIGHT©2016
			HAPPY LEGO. ALL RIGHTS RESERVED.</span>
		</address>
	</section>
</footer>
<!-- //footer -->


</body>
</html>