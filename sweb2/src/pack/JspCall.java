package pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/irum.go")
public class JspCall extends HttpServlet { //비즈니스로직만 담당
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String data = request.getParameter("data");
		//넘어온 자료로 다양한 일을 하다가....
		
		//파일을 호출 방법 1 : Redirect - Client를 통해 Server에 있는 파일 호출 (사실 다 Server에 파일이 있다)
		//response.sendRedirect("jspcall.jsp?data=" + data); //Stirng만 넘길 수 있다
		
		//파일을 호출 방법 1 : Forward - Server에서 Server 있는 파일 호출 (사실 다 Server에 파일이 있다)
		
		request.setAttribute("mydata", data + " 안녕"); //key value 형식으로 String 이외의 형식도 넘길 수 있다
		/*
		RequestDispatcher dispatcher = request.getRequestDispatcher("jspcall.jsp"); //내부적으로 싱글톤
		dispatcher.forward(request, response);
		*/
		
		request.getRequestDispatcher("jspcall.jsp").forward(request, response);
	}

}





