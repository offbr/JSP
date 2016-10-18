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

@WebServlet("/StudentRank")
public class StudentRank extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		
		System.out.println(no + " " + name + " " + kor + " " + eng);
		HttpSession session = request.getSession(true); //있으면 읽고 없으면 만든다 //false 는 없으면 안만듬
		ArrayList<StudentList> slist = (ArrayList<StudentList>)session.getAttribute("key"); //key값을 가져온다 없을경우
		if(slist == null) slist = new ArrayList<StudentList>(); //학생정보를 담을 컬렉션 생성
		
		slist.add(new StudentList(no, name, kor, eng));
		session.setAttribute("key", slist); //세션에 학생정보가 컬렉션에 담겨 저장됨 키값을 가진 배열
		
		response.setContentType("text/html;charset=utf-8"); //넘길 때
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>학생 종합 성적표</h2>");
		out.println("<table border='1'><tr><td>번호</td><td>이름</td><td>국어</td><td>영어</td><td>총점</td></tr>");
		for (int i = 0; i < slist.size(); i++) {
			StudentList studentList = slist.get(i); //빠져나옴
			out.println("<tr><td>" + studentList.getNo() + "</td>");
			out.println("<td>" + studentList.getName() + "</td>");
			out.println("<td>" + studentList.getKor() + "</td>");
			out.println("<td>" + studentList.getEng() + "</td>");
			out.println("<td>" + (Integer.valueOf(studentList.getKor()) + Integer.valueOf(studentList.getEng())) + "</td></tr>");
		}
		out.println("</table>");
		out.println("<b>인원 수: " + slist.size() + "</b>");
		out.println("<br/><a href='student.html'>새로 입력</a>");
		String str = "세션 삭제";
		out.println("<a href='Studentremove'>세션삭제</a>");
		//System.out.println(aa + " / " + count + "a: " + a);
		/*if(count > 0){
			//session.invalidate(); //해당 클라이언트의 모든 세션 삭제 
			session.removeAttribute("key"); //특정 세션 키값 삭제
			}
		*/
		out.println("</body></html>");
		out.close();
	}
}
