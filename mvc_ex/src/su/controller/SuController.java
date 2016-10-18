package su.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import su.model.DanModel;
import su.model.SuModel;

@WebServlet("*.do")
public class SuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		SuModel suModel = SuModel.getInstance();
		DanModel danModel = DanModel.getInstance();
		int su = Integer.parseInt(request.getParameter("su"));
		ArrayList<String> list = null;
		 
		
		//로컬호스트 다음 이름
		String contextPath = request.getContextPath();
		
		//controller
		if(uri.equals(contextPath + "/gugudan.do")){
			list = danModel.getDan(su);
		}else if(uri.equals(contextPath + "/su.do")){
			list = suModel.getSu(su);
		}
		
		request.setAttribute("data", list);
		String viewName = "/view/suview.jsp";
		
		//view
		request.getRequestDispatcher(viewName).forward(request, response);
	}

}








