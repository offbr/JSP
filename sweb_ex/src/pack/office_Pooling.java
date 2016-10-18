package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class office_Pooling {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public office_Pooling() {
		try { //커넥션객체를 풀링기법으로 만듬
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	public ArrayList<OfficeBean> getDataSawon(){
		ArrayList<OfficeBean> list = new ArrayList<>();
		try {
			String sql = "select * from sawon order by sawon_no";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OfficeBean dto = new OfficeBean();
				dto.setSawon_no(rs.getString("sawon_no"));
				dto.setSawon_name(rs.getString("sawon_name"));
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
	
	public ArrayList<OfficeBean> getDataGogek(){
		ArrayList<OfficeBean> list = new ArrayList<>();
		try {
			String sql = "select * from gogek order by gogek_no";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OfficeBean dto = new OfficeBean();
				dto.setGogek_no(rs.getString("gogek_no"));
				dto.setGogek_name(rs.getString("gogek_name"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getDataGogek err : " + e);
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
	
	public ArrayList<OfficeBean> getGogek(String name){
		ArrayList<OfficeBean> list = new ArrayList<>();
		try {
			String sql = "select gogek_no, gogek_damsano, gogek_name, gogek_jumin, gogek_tel from gogek "
					+ " full join sawon on gogek_damsano=sawon_no where sawon_name like ?";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OfficeBean dto = new OfficeBean();
				dto.setGogek_no(rs.getString("gogek_no"));
				dto.setGogek_damsano(rs.getString("gogek_damsano"));
				dto.setGogek_name(rs.getString("gogek_name"));
				dto.setGogek_jumin(rs.getString("gogek_jumin"));
				dto.setGogek_tel(rs.getString("gogek_tel"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getGogek err : " + e);
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
	
	public ArrayList<OfficeBean> getGajok(){
		ArrayList<OfficeBean> list = new ArrayList<>();
		try {
			String sql = "select * from gajok order by f_bun";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OfficeBean dto = new OfficeBean();
				dto.setF_bun(rs.getString("f_bun"));
				dto.setF_irum(rs.getString("f_irum"));
				dto.setF_tel(rs.getString("f_tel"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getGogekAll err : " + e);
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
	
	public boolean insertFData(OfficeBean bean){
		boolean b = false;
		String sql = "";
		try {
			//추가
			sql = "insert into gajok (f_irum, f_tel, f_gogek_no) values (?, ?, ?)";
			conn = ds.getConnection(); // 커넥션 연결
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getF_irum());
			pstmt.setString(2, bean.getF_tel());
			pstmt.setString(3, bean.getF_gogek_no());
			int re = pstmt.executeUpdate();
			if(re == 1) b = true;
			System.out.println(b);
		} catch (Exception e) {
			System.out.println("insertFData err : " + e);
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
	
	public boolean deleteFData(String f_bun){
		boolean b = false;
		String sql = "";
		try {
			sql = "delete from gajok where f_bun=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_bun);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteFData err : " + e);
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
	
	public OfficeBean updateFList(String f_bun){
		OfficeBean dto = null;
		String sql = "select * from gajok where f_bun = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_bun);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new OfficeBean();
				dto.setF_bun(f_bun);
				dto.setF_irum(rs.getString("f_irum"));
				dto.setF_tel(rs.getString("f_tel"));
				dto.setF_gogek_no(rs.getString("f_gogek_no"));
			}
		} catch (Exception e) {
			System.out.println("updateFList : " + e);
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
	
	public boolean updateFData(OfficeBean bean){
		boolean b = false;
		String sql = "";
		try {
			sql = "update gajok set f_irum=?, f_tel=?, f_gogek_no=? where f_bun=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getF_irum());
			pstmt.setString(2, bean.getF_tel());
			pstmt.setString(3, bean.getF_gogek_no());
			pstmt.setString(4, bean.getF_bun());
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("updateFData err : " + e);
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

