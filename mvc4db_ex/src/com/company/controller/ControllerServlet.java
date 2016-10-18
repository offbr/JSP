package com.company.controller;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class ControllerServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			if(command.equals("buser")){
				inter = BuserImpl.getinstance();
				viewName = prefix + inter.showData(request, response) + surfix;
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("sawon")){
				inter = SawonImpl.getinstance();
				viewName = prefix + inter.showData(request, response) + surfix;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			/*else{
				inter = SawonImpl.getinstance();
				SawonImpl.buser_num = command; 
				viewName = prefix + inter.showData(request, response) + surfix;
				request.getRequestDispatcher(viewName).forward(request, response);
			}*/
		} catch (Exception e) {
			System.out.println("ControllerServlet err : " + e);
		}
		
	}

}
