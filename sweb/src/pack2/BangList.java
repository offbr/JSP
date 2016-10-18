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

@WebServlet("/BangList")
public class BangList extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
			pstmt = conn.prepareStatement("select * from guest");
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
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); //넘길 때
		PrintWriter out = response.getWriter();
		out.println("<html>");
		
		out.println("<style type='text/css'>" +
					"#trColor{background-color: blue; color: lime;}" +
					"</style>");
		
		out.println("<body>");
		out.println("<h2>방명록 전체글</h2>");
		out.println("<a href='bang.html'>새글 입력</a>");
		out.println("<a href='index.html'>메인화면 돌아가기</a><br><br>");
		try {
			rs = pstmt.executeQuery();
			String str = "<table border='1'>";
			while(rs.next()){
				//str += "<tr style='background-color: blue; color: lime'><td>코드: "+ rs.getString("code") + "</td>";
				str += "<tr id='trColor'><td>코드: "+ rs.getString("code") + "</td>";
				str += "<td>작성자: "+ rs.getString("name") + "</td></tr>";
				str += "<tr><td colspan='2'>제목: "+ rs.getString("subject") + "</td></tr>";
				str += "<tr><td colspan='2'>"+ rs.getString("content") + "</td></tr>";
			}
			str += "</table>";
			out.println(str);
		} catch (Exception e) {
			System.out.println("doPost err : " + e);
		}
		out.println("</body></html>");
		out.close();
	}
}




