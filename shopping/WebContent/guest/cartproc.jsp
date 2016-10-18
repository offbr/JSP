<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session" />
<jsp:useBean id="order" class="shop.order.OrderBean" />
<jsp:setProperty property="*" name="order"/>

<%
String flag = request.getParameter("flag"); //구매목록, 보기, 수정, 삭제 판단용
String id = (String)session.getAttribute("idKey");
//out.println(order.getProduct_no() + " 주문수 " + order.getQuantity());
if(id == null){
	response.sendRedirect("login.jsp"); //로그인 안한 경우
}else{
	if(flag == null){
		order.setId(id);
		cartMgr.addCart(order); //카트에 주문상품 담기
%>
		<script>
		alert("장바구니에 담았습니다.");
		location.href = "cartlist.jsp";
		</script>
<%
	}else if(flag.equals("update")){
		order.setId(id);
		cartMgr.updateCart(order);
%>	
		<script>
		alert("장바구니에 담긴 상품을 수정했습니다.");
		location.href = "cartlist.jsp";
		</script>
<%
	}else if(flag.equals("delete")){
		cartMgr.deleteCart(order);
%>	
		<script>
		alert("장바구니에 담긴 상품을 삭제했습니다.");
		location.href = "cartlist.jsp";
		</script>	
<%
	}
}
%>
