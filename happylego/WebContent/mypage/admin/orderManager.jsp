<%@page import="service.business.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"/>   
<jsp:useBean id="dao1" class="happy.mybatis.ProcessDao"/>
<% 
ArrayList<OrderDto> list = (ArrayList)dao1.orderAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<script type="text/javascript">
function legoReturnOk(o_no, o_pno) {
	document.oFrm.o_num.value = o_no;
	document.oFrm.o_pnum.value = o_pno;
	document.oFrm.submit();
}
</script>
</head>
<body>
<div class="default_con">
	<table class="i_table">
		<tr>
			<th>번호</th><th>회원아이디</th><th>상품</th><th>상품명(사이즈)</th><th>가격</th><th>대여날짜</th><th>반납날짜</th><th>남은기간</th><th>상태</th><th>처리</th>
		<tr>
	  <c:forEach var="o" items="<%=list%>">
	  <fmt:parseDate value="${o.o_edate}" var="dateFmt" pattern="yyyy-MM-dd"/>
 	  <%-- <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/> --%>
      <fmt:parseNumber value="${dateFmt.time / (1000*60*60*24)}" integerOnly="true" var="oldDays" scope="page"/>
      <c:set value="${oldDays - nowDays + 1}" var="dateDiff"/>
		<tr>
			<td>${o.o_no}</td>
			<td>${o.o_gid}</td>
			<td>${o.o_pno}</td>
			<td>${o.p_name}(${o.p_size})</td>
			<td>${o.p_price}</td>
			<td>${o.o_sdate}</td>
			<c:if test="${o.o_state eq '대여중'}">
				<td style="color: red">${o.o_edate}</td>
				<td style="color: red">${dateDiff}</td>
				<td style="color: red">${o.o_state}</td>
			<td><input type="button" name="legoReturnOk" value="반납확인" onclick="javascript:legoReturnOk('${o.o_no}', '${o.o_pno}');"></td>
			</c:if>
			<c:if test="${o.o_state eq '반납확인'}">
			<td>${o.o_edate}</td>
			<td colspan="3" style="color: blue; text-align: center;">반납완료</td>		
			</c:if>
		<c:set var= "sum" value="${sum + 1}"/>	
		<c:set var= "price" value="${price + o.p_price}"/>	
		</tr>
		</c:forEach>
		<tr><td colspan="10">총 주문 수 : ${sum} / 총 매출 : ${price}</td></tr>
	</table>
</div>
<form action="manager.jsp?gopage=order" name="oFrm" method="post">
<input type="hidden" name="o_num">
<input type="hidden" name="o_pnum">
</form>
</body>
</html>










