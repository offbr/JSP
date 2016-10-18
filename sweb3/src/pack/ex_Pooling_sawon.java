package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ex_Pooling_sawon {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ex_Pooling_sawon() {
		try { //커넥션객체를 풀링기법으로 만듬
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	public ArrayList<ex_SawonDto> getDataSawon(){
		ArrayList<ex_SawonDto> list = new ArrayList<>(); 
		try {
			String sql = "select sawon_no, sawon_name, sawon_jik from sawon;";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ex_SawonDto dto = new ex_SawonDto();
				dto.setSawon_no(rs.getString("sawon_no"));
				dto.setSawon_name(rs.getString("sawon_name"));
				dto.setSawon_jik(rs.getString("sawon_jik"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getDataSawon err : " + e);
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








