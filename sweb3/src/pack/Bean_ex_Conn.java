package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Bean_ex_Conn {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String buserName; 
	private int count, pay;

	public Bean_ex_Conn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");      // Mysql 드라이버 이용
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "123");
		} catch (Exception e) {
			System.out.println("DB연결 에러 " + e);
		}
	}
	
	public void setBuserName(String buserName) {
		this.buserName = buserName;
	}
	
	public String getBuserName() {
		return buserName;
	}
	
	public int getCount() {
		return count;
	}

	public int getPay() {
		return pay / count;
	}

	
	public ArrayList<Bean_ex_Dto> getData(){
		ArrayList<Bean_ex_Dto> list = new ArrayList<>();
		try {
			String sql = "select sawon_no, sawon_name, sawon_jik, sawon_gen, sawon_pay from sawon inner join buser on buser_num=buser_no where buser_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buserName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Bean_ex_Dto dto = new Bean_ex_Dto();
				dto.setNo(rs.getString("sawon_no"));
				dto.setName(rs.getString("sawon_name"));
				dto.setJik(rs.getString("sawon_jik"));
				dto.setGen(rs.getString("sawon_gen"));
				pay += rs.getInt("sawon_pay");
				count++;
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Data err : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("닫기 에러 : " + e);
			}
		}
		return list;
	}
}









