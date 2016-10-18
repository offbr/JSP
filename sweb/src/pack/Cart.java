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

@WebServlet("/Cart")
public class Cart extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		
		System.out.println(name + " " + price);
		HttpSession session = request.getSession(true); //있으면 읽고 없으면 만든다 //false 는 없으면 안만듬

		ArrayList<Goods> glist = (ArrayList<Goods>)session.getAttribute("list");
		if(glist == null) glist = new ArrayList<Goods>(); //상품정보를 담을 컬렉션 생성
		
		glist.add(new Goods(name, price));
		session.setAttribute("list", glist); //세션에 상품이 컬렉션에 담겨 저장됨 list 키값을 가진 배열
		
		response.setContentType("text/html;charset=utf-8"); //넘길 때
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>☞  " + name + " 구입하셨습니다");
		out.println("<br>[<a href='shop.html'>계속 쇼핑하기</a>]");
		out.println("[<a href='Buy'>결제하기</a>]");
		out.println("<p><table width='80%'>");
		out.println("<tr><th>상품명</th><th>가격</th></tr>");
		for (int i = 0; i < glist.size(); i++) {
			Goods goods = glist.get(i); //빠져나옴
			out.println("<tr><td>" + goods.getName() + "</td>");
			out.println("<td>" + goods.getPrice() + "</td></tr>");
		}
		out.println("</table>");
		out.println("</body></html>");
		out.close();
	}	
}





