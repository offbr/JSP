package kr.co.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SawonModel {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public static SawonModel model = new SawonModel();
	public static SawonModel instance(){
		return model;
	}
	
	public SawonModel() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db connect err : " + e);
		}
	}
	
	public ArrayList<SawonDto> getDataAll(){
		ArrayList<SawonDto> list = new ArrayList<>();
		
		try {
			String sql = "select * from sawon";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SawonDto dto = new SawonDto();
				dto.setSawon_no(rs.getString("sawon_no"));
				dto.setSawon_name(rs.getString("sawon_name"));
				dto.setBuser_num(rs.getString("buser_num"));
				dto.setSawon_jik(rs.getString("sawon_jik"));
				dto.setSawon_pay(rs.getString("sawon_pay"));
				dto.setSawon_ibsail(rs.getString("sawon_ibsail"));
				dto.setSawon_gen(rs.getString("sawon_gen"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getDataAll err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
}
















