package pack;
import java.sql.*;
import java.util.ArrayList;

public class ConnBean {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ConnBean() {
		try {
			Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
		} catch (Exception e) {
			System.out.println("DB연결 에러 " + e);
		}
	}
	
	public ArrayList<SangpumDto> getData(){
		ArrayList<SangpumDto> list = new ArrayList<>();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
			String sql = "select * from sangdata";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SangpumDto dto = new SangpumDto();
				dto.setCode(rs.getString("code"));
				dto.setSang(rs.getString("sang"));
				dto.setSu(rs.getInt("su"));
				dto.setDan(rs.getInt("dan"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {

			}
		}
		return list;
	}
}























