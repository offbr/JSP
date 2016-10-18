<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String idkey = (String)session.getAttribute("idkey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- wrap -->
<section id="wrap">
    <!-- header -->
    <header id="header" >
		<!-- <h1><a href="http://localhost/happylego"><img src="../../images/lego_128.png" alt="해피레고" /></a></h1>  -->
		<h1><a href="http://localhost:8080/happylego"><img src="../../images/lego_128.png" alt="해피레고" /></a></h1>
        <!-- header_wrap -->
        <section class="header_wrap">            
            <!-- gnb -->
            <nav class="gnb" style="background-color: white; box-shadow: none;">
                <ul>
                    <li ><a href="../../service/product/product.jsp" title="서비스 신청">서비스 신청</a></li>
                    <li ><a href="../../company/happy/companyindex.jsp" title="해피레고">해피레고</a></li>
                    <li ><a href="../../guide/guidelist/guideindex.jsp" title="이용가이드"> 이용안내</a></li>
                    <li ><a href="../../community/qna/qnaList.jsp" title="커뮤니티">커뮤니티</a></li>
                    <%if(idkey == null){%>
                    <li ><a href="../../mypage/member/login.jsp" title="마이페이지">마이페이지</a></li>
                    <%}else if(idkey.equals("manager")){%>
                    <li ><a href="../../mypage/admin/manager.jsp" title="마이페이지">관리자</a></li>
					<%}else if(idkey != null){%>
					<li ><a href="../../mypage/member/myinfo.jsp" title="마이페이지">마이페이지</a></li>
					<%}%>
                </ul>
            </nav>
            <!-- //gnb -->
            <!--<p class="top_tel"><span class="title">고객센터</span><span class="num f_play_R">(064)746-0700</span></p>-->           
        </section>
        <!-- //header_wrap -->
		<!-- global_menu -->
            <ul class="global_menu">
      			<%if(idkey == null){%>
               	<li><a href="../../mypage/member/login.jsp" title="로그인">로그인</a></li>
				<%}else if(idkey != null){%>
				<li ><a href="../../mypage/member/logout.jsp" title="로그아웃">로그아웃</a></li>
				<%}%>
               
			   <li class="last"><a href="../../company/happy/companyindex.jsp" title="찾아오시는길">찾아오시는길</a></li>
            </ul>
            <!-- //global_menu -->
    </header>
    <!-- //header -->
    
    
  <!-- //footer -->
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


<!--   -->


    

</body>
</html>