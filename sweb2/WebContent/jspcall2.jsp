<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String data = request.getParameter("data");
String msg = "Mr." + data;

//1. ReDirect
//response.sendRedirect("jspcall3.jsp?data=" + msg);

//2. Forward
request.setAttribute("msg", msg);

ArrayList<String> list = new ArrayList<String>();
list.add("tom");
list.add("james");
list.add("alex");
request.setAttribute("msg2", list);

/* 자바로 갈 때
RequestDispatcher dispatcher = request.getRequestDispatcher("jspcall3.jsp");
dispatcher.forward(request, response);
 */
//request.getRequestDispatcher("jspcall3.jsp").forward(request, response);
%>
<jsp:forward page="jspcall3.jsp"></jsp:forward> <!-- jsp로 갈 때 -->

















