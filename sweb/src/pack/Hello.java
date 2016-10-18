package pack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("success");
		response.setContentType("text/html;charset=utf-8");	//너에게 보낼문서는 html타입이고 utf-8이다
		PrintWriter out = response.getWriter();	//겟롸이터는 프린트롸이터의 객체를 만들어줌
		out.println("<html><body>");
		out.println("<h1>밥먹으러 가자</h1>");
		out.println("</body></html>");
		out.close();
	}

}
