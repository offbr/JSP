<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.business.ProductDto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao" />
<%ArrayList<ProductDto> list = (ArrayList)processDao.selectDataAll();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String productid = (String)session.getAttribute("idkey");
if(productid == null) productid = "1";

String no = request.getParameter("no");
//날짜형식지정
SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
//지역설정
Calendar cal = new GregorianCalendar(Locale.KOREA);
//현재시간설정
cal.setTime(new Date());
String date = fm.format(cal.getTime());
cal.add(Calendar.DAY_OF_YEAR, 14);
String strDate = fm.format(cal.getTime());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서비스신청</title>
<!-- Compiled and minified CSS -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>


<link rel="shortcut icon" href="../../images/lego_32.ico">
<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script type="text/javascript" src="../../js/product.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.scrollspy').scrollSpy();

	
	$(".t20").click(function(){
		var sea = $("#sea").val();
		$("#div").load("sel2.jsp?type="+ sea);
		$("#div").hide().load("sel2.jsp",function(){
			$(this).fadeIn();
		});
	});
	
	$("#sea").on("keypress", function (event) {
		   if (event.keyCode == 13) {
			   var sea = $("#sea").val();
				$("#div").load("sel2.jsp?type="+ sea);
				$("#div").hide().load("sel2.jsp",function(){
					$(this).fadeIn();
				});
		   }
		});
	
	
});


  
	/* for (a = 0; a < 379; a++) {
		$('#modal'+a).openModal({
		      dismissible: false, // Modal can be dismissed by clicking outside of the modal
		     
		    });
	} */

function func(aa){
		 $('#modal'+aa).closeModal();
		var b = '<%=productid%>'; 
	      if(b == '1' || b == ""){
	      
	         location.href = "../../mypage/member/login.jsp";
	         
	      }else{
	       $('#modall'+aa).openModal({
	             dismissible: true
	       });    
	      }
}
function func2(a){
	
	window.open("payok.jsp?pno=" + a, "a", "width=0,height=0,top=0,left=0");
	$('#modall'+a).closeModal();
	$('#modalll').openModal({
	    dismissible: false, // Modal can be dismissed by clicking outside of the modal
	    ready: function() {asd();}, // Callback for Modal open
	    complete: function() {} // Callback for Modal close
	    
	  });
}

function asd(){
	setTimeout("location.reload()", 1000);
}
</script>
<script type="text/javascript">
 var stmnLEFT = 150; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 200; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 10; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
#zzz:HOVER{
border: 1px solid #FFE08C;

}
</style>


</head>
<body bgcolor="#D5D5D5" onload="InitializeStaticMenu();">

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->

<input type="hidden" name="name" value="<%=idkey%>">


<br><br>
<article class="sub_visual sub01">
<div style="background-image: url('../../serviceimage/back1.jpg'); background-repeat: no-repeat; background-position: center; background-size:1200px 200px;
 height: 200px; width: 100%; border: 1px solid white; margin: auto;">
	
    
	<div class="row" style="width: 600px; margin-top: 27px; margin-left: auto;">
		<div class="col s3" style="height: 30px; margin: auto;"><a style="color: white; cursor: pointer;" class="t0">전체</a></div>
    	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;" class="t1">씨티</a></div>
     	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;" class="t2">넥소나이츠</a></div>
 		<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;" class="t3">마인크래프트</a></div>
  		<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t4">아키텍처</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t5">프렌즈</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t6">닌자고</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t7">히어로팩토리</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t8">스타워즈</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t9">듀플로</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t10">크리에이터</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t11">테크닉</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t12">주니어</a></div>
	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t13">디즈니프린세스</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t14">슈퍼히어로</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t15">키마의전설</a></div>
 	 	<div class="col s3" style="height: 30px"><a style="color: white; cursor: pointer;"class="t16">엘프</a></div>
	</div>
    <div class="row" style="height: 50px; width: 400px; text-align: center; float: right; margin-right: 10px;">
    	<div class="col s5" style="margin-top: 17px; text-align: right; color: #6799FF; font-weight: bold;">레고 검색</div>
    	<div class="col s6" style="height: 25px;"><input type="text" id="sea" style="position: static; height: 45px"></div>
    	<div class="col s1" style="margin-top: 17px;"><a style="cursor: pointer;" class="t20"><i class="material-icons">search</i></a></div>
	</div>
</div>
</article>
<br><br><br><br><br><br>
<div id="STATICMENU">
<div class="col hide-on-small-only m3 l2">
     				<ul class="section table-of-contents">
     			 	 <li><a href="#1">씨티</a></li>
       			     <li><a href="#2">넥소나이츠</a></li>
      		 		 <li><a href="#3">마인크래프트</a></li>
      		 		 <li><a href="#4">아키텍처</a></li>
      		 		 <li><a href="#5">프렌즈</a></li>
      		 		 <li><a href="#6">닌자고</a></li>
      		 		 <li><a href="#7">히어로팩토리</a></li>
      		 		 <li><a href="#8">스타워즈</a></li>
      		 		 <li><a href="#9">듀플로</a></li>
      		 		 <li><a href="#10">크리에이터</a></li>
      		 		 <li><a href="#11">테크닉</a></li>
      		 		 <li><a href="#12">주니어</a></li>
      		 		 <li><a href="#13">디즈니프린세스</a></li>
      		 		 <li><a href="#14">슈퍼히어로</a></li>
      		 		 <li><a href="#15">키마의전설</a></li>
      		 		 <li><a href="#16">엘프</a></li>
   			 		</ul>
  			 		</div>
</div>

					

    <div class="row" style="width: 60%;"id="div">
      		<c:forEach var="s" items="<%=list %>">	      
      			<div class="col s3" style=" height: 440px; text-align: center;">
      				<div style=" margin-top: 40px; height: 400px; background-color: white; border: 1px solid #EAEAEA;">
      						<div style="height: 400px;" id="zzz">
                        <br><br><br>
                         <div style="margin-top: 40px;">
                      <a href="javascript:$('#modal${s.p_no }').openModal({dismissible: false});" class="waves-effect waves-light modal-trigger">
                              <img src="../../serviceimage/${s.p_image }.jpg" width="230px" height="170px">
                              <br><br><br>
                              <span style="color: orange; font-weight: bold; font-size: 17px;">${s.p_name }</span><br><br>
                              <span style="color: #8C8C8C; font-size: 13px;font-weight: bold; font-size: 17px;">${s.p_type } / ${s.p_size } / ${s.p_price }</span>
                     </a>
                           </div>
                  </div>
						
					</div>
      			</div>  
      			
      			<c:if test="${s.p_no == 1}">
      			<div id="1" class="section scrollspy" style="position: absolute;color: white;">
				<br>
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 63}">
      			<div id="2" class="section scrollspy" style="position: absolute; top: 17%;left: 10%;color: white;">
				aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 71}">
      			<div id="3" class="section scrollspy" style="position: absolute; top: 19%;left: 10%;color: white;">
				aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 80}">
      			<div id="4" class="section scrollspy" style="position: absolute; top: 22%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 89}">
      			<div id="5" class="section scrollspy" style="position: absolute; top: 23%;left: 10%;color: white;">
      			<span>a</span>
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 129}">
      			<div id="6" class="section scrollspy" style="position: absolute; top: 34%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 162}">
      			<div id="7" class="section scrollspy" style="position: absolute; top: 43%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 173}">
      			<div id="8" class="section scrollspy" style="position: absolute; top: 46%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 220}">
      			<div id="9" class="section scrollspy" style="position: absolute; top: 58%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 277}">
      			<div id="10" class="section scrollspy" style="position: absolute; top: 73%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 294}">
      			<div id="11" class="section scrollspy" style="position: absolute; top: 77%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 308}">
      			<div id="12" class="section scrollspy" style="position: absolute; top: 81%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 326}">
      			<div id="13" class="section scrollspy" style="position: absolute; top: 85%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 338}">
      			<div id="14" class="section scrollspy" style="position: absolute; top: 88%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 347}">
      			<div id="15" class="section scrollspy" style="position: absolute; top: 91%;left: 10%;color: white;">
      			aaa
      			</div>
      			</c:if>
      			<c:if test="${s.p_no == 374}">
      			<div id="16" class="section scrollspy"  style="position: absolute; top: 97%;left: 10%;color: white;">    			
      			aaa
      			</div>
      			</c:if> 
			</c:forEach>
    </div>
       
	
	
      
	
<!-- Modal Structure -->
	<c:forEach var="ss" items="<%=list %>">
  <div id="modal${ss.p_no }" class="modal modal-fixed-footer" style="width:800px; height: 520px; margin-top: auto; border: 4px solid #BDBDBD; overflow: hidden;">
    <div class="row"style="margin-top: 40px">
    
    	<div class="col s6" style="height: 420px; border-right : 1px solid #BDBDBD; margin-top: 20px;">
    		<img src="../../serviceimage/${ss.p_image }.jpg" width="300px" height="200px" style="margin-top: 100px; margin-left: 7px">
    	</div>
    	
   		<div class="col s6" style="height: 450px; text-align: left; margin-top: 20px; padding-left: 30px; padding-right: 30px;">
   			<div style="color: red;">
   				<br><h5>${ss.p_name }</h5><br>
   				<i class="tiny material-icons">shopping_cart</i> ${ss.p_type} / <i class="tiny material-icons">search</i> ${ss.p_size} / <i class="material-icons" style="font-size: 15px;">&#xE263;</i> ${ss.p_price}
   				<br><br><br>
   			</div>  			
   			<div style="color: black; font-size: 15px; line-height: 23px;">
   			설명<br><br>
   			${ss.p_content }
   			</div>
   		</div>
   		
    </div>
    <div class="modal-footer">
    	<c:if test="${ss.p_stock == 0}">
    		<a href="#!" class="modal-action modal-close waves-effect waves-white btn-flat">닫기</a>
    		<div><a class="btn" style="background-color: #FF5A5A; cursor: default;"><i class="material-icons left" style="color: white;">lock</i>대여불가</a></div>
    	</c:if>
    	<c:if test="${ss.p_stock != 0}">
      		<a href="#!" class="modal-action modal-close waves-effect waves-white btn-flat">닫기</a>
    		<div><a class="waves-effect waves-light btn" style="background-color: #4374D9; color: white;" href="javascript:func(${ss.p_no })"><i class="material-icons left" style="color: white;">shopping_cart</i>대여하기</a></div>
    	</c:if>
    </div>
  </div>
  <!--모달2 -->
  <div id="modall${ss.p_no }" class="modal" style="width: 350px;height: 500px; overflow: hidden;">
    <div class="row" style="text-align: left; width: 350px; height: 500px;">
        	<div class="col s12" style="margin-left: 50px; margin-top: 50px;"><img src="../../serviceimage/${ss.p_image}.jpg" width="230px" height="170px"></div>
        	<div style="margin-left: 50px; color: black; line-height: 25px; font-size: 15px;">
        		<div class="col s12"><br></div>
      			<div class="col s3">레고명 :</div>
      			<div class="col s7">${ ss.p_name} </div>
      			<div class="col s3">사이즈 : </div>
      			<div class="col s7">${ss.p_size} </div>
      			<div class="col s3">가&nbsp;&nbsp;&nbsp;&nbsp;격 : </div>
      			<div class="col s7">${ss.p_price} </div>
      			<div class="col s12">대여기간 : &nbsp;&nbsp;<%=date %> ~ <%=strDate %></div>
      			<div class="col s12" style="margin-top: 60px; margin-left: 58px; width: 150px;">
      				<a href="javascript:func2(${ss.p_no })" class="waves-effect waves-light btn" style="color: white;">예약하기</a>
      			</div>
      		</div>
  </div>
  </div>
	</c:forEach>
	
	<!--모달3  -->
	<div id="modalll" class="modal bottom-sheet" style="margin-top: 0px;">
    <div class="modal-content" style="text-align: center; color: #003399;">
      <h4>예약이 완료되었습니다</h4>
      <p>마이페이지에서 확인바랍니다.</p>

    </div>
    <div class="modal-footer">
      <a href="javascript:window.close()" class=" modal-action modal-close waves-effect waves-green btn-flat" style="color: #003399;">닫기</a>
    </div>
  </div>
  
  <table border="3" bordercolor="red">
  <tr><td></td>
  <td></td><td></td><td></td><td></td>
  </tr>
  </table>
	
<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->
	
	
</body>
</html>