package pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GoMvc")
public class GoMvc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//컨트롤러 역할
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name, result = null, viewName = null;
		RequestDispatcher dispatcher = null;
		try {
			//클라이언트의 요청
			name = request.getParameter("name");			
		} catch (Exception e) {
			name = null;
		}
		
		if(name == null || name.equals("")){
			result = "환영합니다."; //model 을 수행했다고 가정;
			viewName = "/view/gomvc_view1.jsp"; 
		}else if(name.equalsIgnoreCase("korea")){
			result = "한국인."; //model 을 수행했다고 가정;
			viewName = "/view/gomvc_view2.jsp"; 
		}else{
			result = name + "님 메시지입니다"; //model 을 수행했다고 가정;
			viewName = "/view/gomvc_view3.jsp"; 
		}
		
		dispatcher = request.getRequestDispatcher(viewName);
		request.setAttribute("result", result);
		dispatcher.forward(request, response);
	}

}


























