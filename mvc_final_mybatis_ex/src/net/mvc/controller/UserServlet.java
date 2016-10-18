package net.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelAndView modelAndView = null;
		Controller controller = null;
		
		try {
		String	command = request.getParameter("command");
		if(command == null || command.equals("")){
			command = "buser";	//command에 값 없을 경우 목록보기로 
		}
		controller = getAction(command);
		modelAndView = controller.execute(request, response);
			
		} catch (Exception e) {
			System.out.println("service err:" + e);
		}
		
		//파일 호출방식 결정
		if(modelAndView.isRedirect()){
			response.sendRedirect(modelAndView.getPath());
		}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher(modelAndView.getPath());
			dispatcher.forward(request,response);
		}
	}
	
	public Controller getAction(String command){
		Controller controller = null;
		if(command.equals("buser")){
			controller = new BuserAction();
		}else if(command.equals("sawon")){
			controller = new SawonAction();
		}
		return controller;
	}

}
