package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Buy")
public class Buy extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); //결제하는 곳이라 읽기만 가능 새로 만들지 않는다
		
		if(session == null) return;
		
		ArrayList<Goods> glist = (ArrayList<Goods>)session.getAttribute("list");
		
		if(glist == null) return;
		
		response.setContentType("text/html;charset=utf-8"); //넘길 때
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<p><table width='80%' border='1'>");
		out.println("<tr><th>상품명</th><th>가격</th></tr>");
		int tot = 0;
		for (int i = 0; i < glist.size(); i++) {
			Goods goods = glist.get(i); //빠져나옴
			out.println("<tr><td>" + goods.getName() + "</td>");
			out.println("<td>" + goods.getPrice() + "</td></tr>");
			tot += goods.getPrice();
		}
		out.println("<tr><td colspan='2'>결제 총액:" + tot + "</td></tr>");
		out.println("</table>");
		out.println("<br>고객님 감사합니다");
		out.println("<br><a href='shop.html'>돌아가기</a>");
		out.println("</body></html>");
		//session.invalidate(); //해당 클라이언트의 모든 세션 삭제 
		session.removeAttribute("list"); //특정 세션 키값 삭제
		out.close();
	}

}
