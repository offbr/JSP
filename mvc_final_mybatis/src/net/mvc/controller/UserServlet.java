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
	  request.setCharacterEncoding("utf-8");
	  ModelAndView modelAndView = null;
	  Controller controller = null;
	  
      try {
         String command = request.getParameter("command");
         if(command == null || command.equals("")){
            command = "list";   //command의 값이 없을 경우에는 list보기.
         }
         controller = getAction(command);
         modelAndView = controller.execute(request, response);
      } catch (Exception e) {
         System.out.println("servlet err : " + e);
      }
      
      //파일 호출방식 결정.
      if(modelAndView.isRedirect()){
         response.sendRedirect(modelAndView.getPath());
      }else{
         RequestDispatcher dispatcher = request.getRequestDispatcher(modelAndView.getPath());
         dispatcher.forward(request, response);
      }
      
   }
   
   public Controller getAction(String command){
	  Controller controller = null;
      if(command.equals("login")){
    	  controller = new LoginAction();
      }else if(command.equals("list")){
    	  controller = new ListAction();
      }else if(command.equals("view")){
    	  controller = new ViewAction();
      }else if(command.equals("updateform")){
    	  controller = new UpdateFormAction();
      }else if(command.equals("update")){
    	  controller = new UpdateAction();
      }else if(command.equals("insert")){
    	  controller = new InsertAction();
      }else if(command.equals("delete")){
    	  controller = new DeleteAction();
      }else if(command.equals("out")){
    	  controller = new LogoutAction();
      }
      return controller;
   }

}



























