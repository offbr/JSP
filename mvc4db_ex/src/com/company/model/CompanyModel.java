package com.company.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CompanyModel {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public static CompanyModel model = new CompanyModel();
	public static CompanyModel getinstance(){
		return model;
	}
	
	public CompanyModel() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db connect err : " + e);
		}
	}
	
	public ArrayList<BuserDto> getBuserAll(){
		ArrayList<BuserDto> list = new ArrayList<>();
		
		try {
			String sql = "select * from buser";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BuserDto dto = new BuserDto();
				dto.setBuser_no(rs.getString("buser_no"));
				dto.setBuser_name(rs.getString("buser_name"));
				dto.setBuser_loc(rs.getString("buser_loc"));
				dto.setBuser_tel(rs.getString("buser_tel"));
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
	
	public ArrayList<SawonDto> getSelectData(String buser_num){
		ArrayList<SawonDto> list = new ArrayList<>();
		
		try {
			String sql = "select * from sawon where buser_num = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buser_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SawonDto dto = new SawonDto();
				dto.setSawon_no(rs.getString("sawon_no"));
				dto.setSawon_name(rs.getString("sawon_name"));
				dto.setSawon_jik(rs.getString("sawon_jik"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getgetSelectData err : " + e);
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

















