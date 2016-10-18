package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnbeanPooling {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ConnbeanPooling() {
		try { //커넥션객체를 풀링기법으로 만듬
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	public ArrayList<SangpumDto> getDataAll(){
		ArrayList<SangpumDto> list = new ArrayList<>();
		try {
			String sql = "select * from sangdata";
			conn = ds.getConnection(); // 커넥션 연결
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
			System.out.println("getDataAll err : " + e);
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
	
	public boolean insertData(SangpumBean bean){
		boolean b = false;
		String sql = "";
		try {
			//신상 코드 구하기
			sql = "select max(code) from sangdata";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int maxCode = 0;
			if(rs.next()){
				maxCode = rs.getInt(1);
			}
			maxCode++; //신상 코드
			
			//추가
			sql = "insert into sangdata values(?,?,?,?)";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxCode);
			pstmt.setString(2, bean.getSang());
			pstmt.setString(3, bean.getSu());
			pstmt.setString(4, bean.getDan());
			int re = pstmt.executeUpdate();
			if(re == 1) b = true;
			System.out.println(b);
		} catch (Exception e) {
			System.out.println("insertData err : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {

			}
		}		
		return b;
	}
	
	public SangpumDto updatelist(String code){
		SangpumDto dto = null;
		String sql = "select * from sangdata where code = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new SangpumDto();
				dto.setCode(code);
				dto.setSang(rs.getString("sang"));
				dto.setSu(rs.getInt("su"));
				dto.setDan(rs.getInt("dan"));
			}
		} catch (Exception e) {
			System.out.println("updatelist : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {

			}
		}
		return dto;
	}
	
	public boolean updateData(SangpumBean bean){
		boolean b = false;
		String sql = "";
		try {
			sql = "update sangdata set sang=?, su=?, dan=? where code=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSang());
			pstmt.setString(2, bean.getSu());
			pstmt.setString(3, bean.getDan());
			pstmt.setString(4, bean.getCode());
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("updateData err : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {

			}
		}		
		return b;
	}
	
	public boolean deleteData(String code){
		boolean b = false;
		String sql = "";
		try {
			sql = "delete from sangdata where code=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteData err : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {

			}
		}		
		return b;
	}
}






















