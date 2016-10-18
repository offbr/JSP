package kr.co.company.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class ControllerServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		  
		  String uri = request.getRequestURI();
		  String contextPath = request.getContextPath();

		  ModelAndView modelAndView = null;
		  Controller controller = null;
		  
		  try { 
	         if(uri.equals(contextPath + "/buserlist.do")){
	       	  	controller = new BuserListAction();
	         }else if(uri.equals(contextPath + "/sawonlist.do")){
	       	  	controller = new SawonListAction();
	         }

	         modelAndView = controller.execute(request, response);
	      } catch (Exception e) {
	         System.out.println("ControllerServlet err : " + e);
	      }
	      
	      //파일 호출방식 결정.
	      if(modelAndView.isRedirect()){
	         response.sendRedirect(modelAndView.getPath());
	      }else{
	         RequestDispatcher dispatcher = request.getRequestDispatcher(modelAndView.getPath());
	         dispatcher.forward(request, response);
	      }
	      
	   }

}
