package hobby.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hobby.model.HobbyModel;

//@WebServlet("/hobby.do")
//@WebServlet({"hobby.do", "hobby2.do"})
public class HobbyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hobby = request.getParameter("hobby");
		
		//컨트롤러는 제어담당
		
		// 모델 호출 로직담당
		HobbyModel hobbyModel = HobbyModel.getInstance();
		ArrayList<String> list = hobbyModel.getHobby(hobby);
		request.setAttribute("data", list); //jsp파일에 넘겨줄떄
		String viewName = "/view/hobby_view.jsp";
		
		// 뷰 호출 출력담당
		request.getRequestDispatcher(viewName).forward(request, response);
	}

}

























