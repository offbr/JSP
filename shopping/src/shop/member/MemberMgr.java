package shop.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MemberMgr() {
		try { //커넥션객체를 풀링기법으로 만듬 context.xml
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	//우편번호 검색 (응용해서 다른걸 할 수 있고 ajax를 쓸 수 도 있다(ajax는 하나의 부품으로 쓴다 절대 메인x(퍼포먼스를 떨어뜨릴 수 있다)) 
	public ArrayList<ZiptapBean> zipcodeRead(String area3){
		ArrayList<ZiptapBean> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			//String sql = "select * from ziptab where area3 like '" + area3 + "%'";
			String sql = "select * from ziptab where area3 like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, area3 + "%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				ZiptapBean bean = new ZiptapBean();
				bean.setZipcode(rs.getString("zipcode"));
				bean.setArea1(rs.getString("area1"));
				bean.setArea2(rs.getString("area2"));
				bean.setArea3(rs.getString("area3"));
				bean.setArea4(rs.getString("area4"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("zipcodeRead err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("zipcodeRead close err : " + e);
			}
		}
		return list;
	}
	
	//아이디 체크
	public boolean checkId(String id){
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select id from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			b = rs.next(); // 있으면 true, 없으면 false;
		} catch (Exception e) {
			System.out.println("checkId err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("checkId close err : " + e);
			}
		}
		return b;
	}
	
	//회원 추가
	public boolean memberInsert(MemberBean bean){
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());
			pstmt.setString(8, bean.getJob());
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberInsert err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("memberInsert close err : " + e);
			}
		}
		return b;
	}
	
	//로그인 확인
	public boolean loginCheck(String id, String passwd){
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select id, passwd from member where id=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			b = rs.next();
		} catch (Exception e) {
			System.out.println("loginCheck err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("loginCheck close err : " + e);
			}
		}
		return b;
	}
	
	//회원정보수정시
	public MemberBean getMember(String id){
		MemberBean bean = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			System.out.println("getMember err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("getMember close err : " + e);
			}
		}
		return bean;
	}
	
	public boolean memberUpdate(MemberBean bean, String id){
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "update member set passwd=?, name=?, email=?, phone=?, zipcode=?, address=?, job=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getPasswd());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getZipcode());
			pstmt.setString(6, bean.getAddress());
			pstmt.setString(7, bean.getJob());
			pstmt.setString(8, id);
			if(pstmt.executeUpdate() > 0) b= true;
		} catch (Exception e) {
			System.out.println("memberUpdate err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("memberUpdate close err : " + e);
			}
		}
		return b;
	}
	
	//관리자 로그인용
	public boolean adminloginCheck(String adminid, String adminpasswd){
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from admin where admin_id=? and admin_passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminid);
			pstmt.setString(2, adminpasswd);
			rs = pstmt.executeQuery();
			b = rs.next();
		} catch (Exception e) {
			System.out.println("adminloginCheck err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("adminloginCheck close err : " + e);
			}
		}
		return b;
	}
	
	//관리자용 전체회원 읽기
	public ArrayList<MemberBean> getMemberAll(){
		ArrayList<MemberBean> list = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from member order by id asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getMemberAll err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("getMemberAll close err : " + e);
			}
		}
		return list;
	}
}




























