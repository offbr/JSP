<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="happy.mybatis.ProcessDao"/>
<% request.setCharacterEncoding("utf-8");%>
<% 

String id = (String)session.getAttribute("idkey");
if(!id.equals("manager")){
	response.sendRedirect("../member/login.jsp");
}

String gopage = request.getParameter("gopage"); 
if(gopage == null) gopage = "index";

String o_no = request.getParameter("o_num");
String o_pno = request.getParameter("o_pnum");
if(o_no != null && o_pno != null){
	processDao.manager_ProductUpdate(o_pno);  // 반납시 재고 변경
	processDao.manager_OrderUpdate(o_no); //반납 상태 변경
}

String o_gid = request.getParameter("gid");
if(o_gid != null){
	if(processDao.manager_GuestOrderDelete(o_gid)){ // 탈퇴전 주문리스트 삭제 
		processDao.delete(o_gid); // 주문리스트 삭제 후 탈퇴 처리
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link rel="shortcut icon" href="../../images/lego_32.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
function go(mode){
	document.frm.gopage.value = mode;
	document.frm.submit();
}

</script>
</head>
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>

<!-- //header -->
<article class="sub_visual sub01">
    <div class="btn_list">
    	<h2>관리자</h2><br><br>
		<a href="javascript:go('guest')" class="type02">회원정보관리</a> 
		<a href="javascript:go('order')" class="type02">이용현황</a>
		<a href="javascript:go('product')" class="type02">상품관리</a>
		<a href="javascript:go('bestchart')" class="type02">베스트상품</a>
		<a href="javascript:go('saleschart')" class="type02">총 매출</a>
	</div>
</article>
<form action="manager.jsp" name="frm" method="get">
<input type="hidden" name="gopage" value="">
</form>
<br>

<%if(gopage.equals("guest")){%>
	<%@ include file="guestManager.jsp" %>
<%}else if(gopage.equals("order")){%>
	<%@ include file="orderManager.jsp" %>
<%}else if(gopage.equals("product")){%>
	<iframe width="600" height="800" style="border: none;" 
	src="../productmanager/productManager.jsp"></iframe>
<%}else if(gopage.equals("bestchart")){%>
	<iframe width="800" height="500" style="border: none;" 
	src="../chartmanager/bestChart.jsp"></iframe>
<%}else if(gopage.equals("saleschart")){%>
	<iframe width="800" height="500" style="border: none;" 
	src="../chartmanager/salesChart.jsp"></iframe>
<%}else{%>
	
<%}%>
	

<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->


</body>
</html>