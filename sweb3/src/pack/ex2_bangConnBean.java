package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ex2_bangConnBean {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ex2_bangConnBean() {
		try { //커넥션객체를 풀링기법으로 만듬
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	public ArrayList<ex2_bangDto> getDataAll(){
		ArrayList<ex2_bangDto> list = new ArrayList<>();
		try {
			String sql = "select * from guest";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ex2_bangDto dto = new ex2_bangDto();
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
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
	
	public boolean insertData(ex2_bangDto bangDto){
		boolean b = false;
		String sql = "";
		try {
			//신상 코드 구하기
			sql = "select max(code) from guest";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int maxCode = 0;
			if(rs.next()){
				maxCode = rs.getInt(1);
			}
			maxCode++; //신상 코드
			
			//추가
			sql = "insert into guest values(?,?,?,?)";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxCode);
			pstmt.setString(2, bangDto.getName());
			pstmt.setString(3, bangDto.getSubject());
			pstmt.setString(4, bangDto.getContent());
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
	
	public boolean deleteData(String code){
		boolean b = false;
		String sql = "";
		try {
			sql = "delete from guest where code=?";
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
	
	public ex2_bangDto updateList(String code){
		ex2_bangDto dto = null;
		String sql = "select * from guest where code = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new ex2_bangDto();
				dto.setCode(code);
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			System.out.println("updateList : " + e);
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
	
	public boolean updateData(ex2_bangDto bangDto){
		boolean b = false;
		String sql = "";
		try {
			sql = "update guest set name=?, subject=?, content=? where code=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bangDto.getName());
			pstmt.setString(2, bangDto.getSubject());
			pstmt.setString(3, bangDto.getContent());
			pstmt.setString(4, bangDto.getCode());
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
}





















