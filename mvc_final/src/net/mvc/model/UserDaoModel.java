package net.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDaoModel { //business logic을 수행
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public UserDaoModel() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db connect err : " + e);
		}
	}
	
	public UserDto findUser(String userid){
		UserDto dto = null;
		try {
			String sql = "select * from userinfo where userid=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new UserDto();
				dto.setUserid(userid);
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println("findUser err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	public ArrayList<UserDto> getUserList(){
		ArrayList<UserDto> list = new ArrayList<>();
		try {
			String sql = "select * from userinfo";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				UserDto dto = new UserDto();
				dto.setUserid(rs.getString("userid"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getUserList err : " + e);
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
	
	public int update(UserDto formBean){
		int re = 0;
		try {
			String sql = "update userinfo set password=?,name=?,email=? where userid=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, formBean.getPassword());
			pstmt.setString(2, formBean.getName());
			pstmt.setString(3, formBean.getEmail());
			pstmt.setString(4, formBean.getUserid());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("update err : " + e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return re;
	}
	
	public int insert(UserDto formBean){
		int re = 0;
		try {
			String sql = "insert into userinfo values(?,?,?,?)";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, formBean.getUserid());
			pstmt.setString(2, formBean.getPassword());
			pstmt.setString(3, formBean.getName());
			pstmt.setString(4, formBean.getEmail());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert err : " + e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return re;
	}
	
	public int delete(String userid){
		int re = 0;
		try {
			String sql = "delete from userinfo where userid=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete err : " + e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return re;
	}
}































