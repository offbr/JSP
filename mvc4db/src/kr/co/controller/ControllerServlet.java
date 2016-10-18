package kr.co.controller;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ControllerServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//방법1 : parameter로 클라이언트 요청 구분
		//String command = request.getParameter("command");
		
		//방법2 : 요청 URL로 클라이언트 요청 구분
		String ss = request.getRequestURI();
		int idx = ss.lastIndexOf("/");
		StringTokenizer st = new StringTokenizer(ss.substring(idx + 1), ".");
		ss = st.nextToken();
		String command = ss;
		
		CommandInter inter = null;
		String prefix = "/view/"; //접두어(경로) 
		String surfix = ".jsp"; //접미어(확장자)
		String viewName = "";
		
		try {
			if(command.equals("sang")){
				inter = SangpumImpl.instance();
				viewName = prefix + inter.showData(request, response) + surfix;
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("jikwon")){
				inter = SawonImpl.instance();
				viewName = prefix + inter.showData(request, response) + surfix;
				request.getRequestDispatcher(viewName).forward(request, response);
			}else{
				viewName= "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		}
	}
}
