package pack2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DbServlet")
public class DbServlet extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
			pstmt = conn.prepareStatement("select * from sangdata");
		} catch (Exception e) {
			System.out.println("DB 연결 실패 : " + e);
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); //넘길 때
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2> * 상품 자료 *</h2>");
		try {
			rs = pstmt.executeQuery();
			while(rs.next()){
				out.println(rs.getString("code") + " " + 
						rs.getString("sang") + " " +
						rs.getString("su") + " " +
						rs.getString("dan") + "<br>");
			}
		} catch (Exception e) {
			System.out.println("service 에러 : " + e);
		}
		out.println("</body></html>");
		out.close();
	}

	@Override
	public void destroy() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			System.out.println("DB 닫기 실패 : " + e);
		}
	}
}
