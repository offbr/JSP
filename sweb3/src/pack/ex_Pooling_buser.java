package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class ex_Pooling_buser {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ex_Pooling_buser() {
		try { //커넥션객체를 풀링기법으로 만듬
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	public ArrayList<ex_BuserDto> getDataBuser(){
		ArrayList<ex_BuserDto> list = new ArrayList<>(); 
		try {
			String sql = "select sawon_name, buser_no, buser_name, buser_tel, buser_loc from buser inner join sawon on buser_num=buser_no where sawon_name = ?;";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ex_BuserDto dto = new ex_BuserDto();
				dto.setBuser_no(rs.getString("buser_no"));
				dto.setBuser_name(rs.getString("buser_name"));
				dto.setBuser_tel(rs.getString("buser_tel"));
				dto.setBuser_loc(rs.getString("buser_loc"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getDataBuser err : " + e);
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








