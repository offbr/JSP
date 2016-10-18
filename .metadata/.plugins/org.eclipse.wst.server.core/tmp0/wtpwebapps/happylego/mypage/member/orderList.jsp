<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.business.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"/>
<jsp:useBean id="processDao1" class = "happy.mybatis.ProcessDao" />
 <%
    String id = request.getParameter("g_id");
   ArrayList<OrderDto> list = processDao1.listall(id);
   String sdate = "";
   String edate = "";
   long rday = 0;
   if(list.size() > 0){
      
   for(OrderDto s : list){
       sdate = s.getO_sdate();
      edate = s.getO_edate(); 
   }
   //현재날짜
   SimpleDateFormat formatter03 = new SimpleDateFormat("yyyy-MM-dd");
   String todate = formatter03.format(new Date());
   Date today = formatter03.parse(todate);
   
   //반납일
   Date endday = formatter03.parse(edate);
   
   //날짜계산
   long cday = endday.getTime() - today.getTime() ;
   rday = cday / (24 * 60 * 60 * 1000);
   
} 
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
</head>
<body>
<div class="default_con">
<table class="i_table">
         <tr>
            <th>레고이름</th><th>레고사이즈</th><th>대여가격</th><th>대여일</th><th>반납일</th><th>남은기간</th><th>상태</th>
         <tr>
         <c:set var = "size" value = "<%=list.size() %>" />
      <c:forEach var = "s" items = "<%= list %>">
      <fmt:parseDate value="${s.o_edate}" var="dateFmt" pattern="yyyy-MM-dd"/>
 	  <%-- <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/> --%>
      <fmt:parseNumber value="${dateFmt.time / (1000*60*60*24)}" integerOnly="true" var="oldDays" scope="page"/>
      <c:set value="${oldDays - nowDays + 1}" var="dateDiff"/>
         <c:choose>
            <c:when test="${size == 0 }">
               <tr><td colspan="4">이용 현황이 없습니다</td></tr>            
            </c:when>
            <c:when test="${size > 0 }">
               <tr>
                  <td>${s.p_name }</td>
                  <td>${s.p_size }</td>
                  <td>${s.p_price }</td>
                  <td>${s.o_sdate }</td>
                  <c:if test="${s.o_state eq '대여중'}">
                  <td style="color: red;">${s.o_edate }</td>
                  <td style = "color : red;">${dateDiff }</td>
                  <td style="color: red;">${s.o_state}</td>
                  </c:if>
                  <c:if test="${s.o_state eq '반납확인'}">
                  <td style="color: black;">${s.o_edate }</td>
                  <td colspan="2" style="color: blue; text-align: center;">${s.o_state}</td>
                  </c:if>
               </tr>
            </c:when>
         </c:choose>
         
      </c:forEach>
</table>      
</div>
</body>
</html>