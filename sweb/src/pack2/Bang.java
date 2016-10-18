package pack2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Bang")
public class Bang extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
			pstmt = conn.prepareStatement("insert into guest(name,subject,content) values(?,?,?)");
		} catch (Exception e) {
			System.out.println("DB 연결 실패 : " + e);
		}
	}

	public void destroy() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			System.out.println("DB 닫기 실패 : " + e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//System.out.println(name + " " + subject + " " + content);
		
		try {
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
			//response.sendRedirect("bang.html"); //서버가 클라이언트 화면을 통해 파일을 호출한 것. //되돌아가기 로케이션. 서블릿은 루트에 있다
			
			response.setContentType("text/html;charset=utf-8"); //넘길 때
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<b>" + name + "</b>님 등록완료!");
			out.println("<br><a href='bang.html'>새글 입력</a>");
			out.println("<a href='BangList'>글 내용보기</a>");
			out.println("<br><a href='index.html'>메인화면 돌아가기</a>");
			out.println("</body></html>");
			out.close();
		} catch (Exception e) {
			System.out.println("doPost err : " + e);
		}
		
	}
}



































