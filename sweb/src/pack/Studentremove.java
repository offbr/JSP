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

@WebServlet("/Studentremove")
public class Studentremove extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); //결제하는 곳이라 읽기만 가능 새로 만들지 않는다
		
		if(session == null) return;
		
		ArrayList<StudentList> slist = (ArrayList<StudentList>)session.getAttribute("key"); //key값을 가져온다 없을경우
		if(slist == null) slist = new ArrayList<StudentList>(); //학생정보를 담을 컬렉션 생성
		response.setContentType("text/html;charset=utf-8"); //넘길 때
		PrintWriter out = response.getWriter();
		session.removeAttribute("key"); //특정 세션 키값 삭제
		out.println("<html><body>");
		out.println("<br/><a href='student.html'>돌아가기</a>");
		out.println("</body></html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
