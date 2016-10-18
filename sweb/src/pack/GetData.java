package pack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetData")
public class GetData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	//받을때의 한글처리
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String age = request.getParameter("age");
		System.out.println("결과는 " + name + " " + age + " " + addr);
		
		response.setContentType("text/html;charset=utf-8");	//보낼때의 한글처리
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("결과 확인(get): <br/>");
		out.println(addr + "에 사는 " + name + "님은 " + age + "세 이다");
		out.println("<br><a href = 'getdata.html'>자료 다시 입력</a>");
		out.println("</body></html>");
		out.close();
		
		
	}

}
