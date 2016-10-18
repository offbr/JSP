package aa.bb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class ControllerServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String viewName = "";
		CommandInter inter = null;
		
		try {
			if(command.equals("message")){
				inter = new MessagePro(); //사실은 싱글톤으로 처리 해야함
			}else if(command.equals("date")){
				inter = new DataPro();
			}else{
				response.sendRedirect("err.html");
			}
			
			viewName = "/view/" + inter.showData(request, response) + ".jsp";
			request.getRequestDispatcher(viewName).forward(request, response);
			
		} catch (Exception e) {
			System.out.println("ControllerServlet err : " + e);
		}
	}

}
