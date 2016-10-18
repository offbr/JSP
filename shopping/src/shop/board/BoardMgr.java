package shop.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	//paging 처리
	private int tot;       //전체 레코드 수
	private int pList = 8; //페이지 당 출력 행 수
	private int pageSu;    // 전체 페이지 수
	
	public BoardMgr() {
		try { //커넥션객체를 풀링기법으로 만듬 context.xml
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db 연결 실패 " + e);
		}
	}
	
	public int currentGetNum(){ //최대 num 구하기 맥스값
		String sql = "select max(num) from board";
		int cnt = 0;
		
		try {
			conn = ds.getConnection(); //커넥션 연결
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1); //cnt에 max(num)값을 준다
		} catch (Exception e) {
			System.out.println("currentGetNum err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("currentGetNum close err : " + e);
			}
		}
		return cnt;
	}
	
	public void saveData(BoardBean bean){ //새글
		String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)"; //총 12개 값.
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0); //readcnt 새글은 0
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, 0); //onum 새글은 0
			pstmt.setInt(12, 0); //nested 새글은 0
			pstmt.executeUpdate(); // 1 or 0
		} catch (Exception e) {
			System.out.println("saveData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("saveData close err : " + e);
			}
		}
	}
	
	public void totalList(){ //전체 레코드 건수
		String sql = "select count(*) from board";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1); // tot에 전체 건수 담는다
		} catch (Exception e) {
			System.out.println("totalList err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("totalList close err : " + e);
			}
		}
	}
	
	public int getPageSu(){ //총 페이지 수 구하기
		pageSu = tot / pList;
		if(tot % pList > 0) pageSu++; // 자투리 페이지 처리
		return pageSu;
	}
	
	public ArrayList<BoardDto> getDataAll(int page, String stype, String sword){
		ArrayList<BoardDto> list = new ArrayList<>();
		String sql = "select * from board";
		try {
			conn = ds.getConnection();
			if(sword == null){ 	//검색어 O
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
			}else{				 //검색어 X
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			rs = pstmt.executeQuery();
			
			for (int i = 0; i < (page - 1) * pList; i++) {
				rs.next(); //레코드 포인터 위치 1페이지 일땐 0, 2페이지 일떈 7, 15, 23...
			}
			
			int k = 0;
			while(rs.next() && k < pList){ //pList보다 작은 동안
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);
				k++;
			}
		} catch (Exception e) {
			System.out.println("getDataAll err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("getDataAll close err : " + e);
			}
		}
		return list;
	}
	
	public void updateReadcnt(String num){ //글 내용보기하면 조회수 증가
		String sql = "update board set readcnt=readcnt + 1 where num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("updateReadcnt close err : " + e);
			}
		}
	}
	
	public BoardDto getData(String num){
		String sql = "select * from board where num=?";
		BoardDto dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new BoardDto();
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setMail(rs.getString("mail"));
				dto.setTitle(rs.getString("title"));
				dto.setCont(rs.getString("cont"));
				dto.setBip(rs.getString("bip"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
			}
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("getData close err : " + e);
			}
		}
		return dto;
	}
	
	public BoardDto getReplyData(String num){ //댓글용
		String sql = "select * from board where num=?";
		BoardDto dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new BoardDto();
				dto.setTitle(rs.getString("title"));
				dto.setGnum(rs.getInt("gnum"));
				dto.setOnum(rs.getInt("onum"));
				dto.setNested(rs.getInt("nested"));
			}
		} catch (Exception e) {
			System.out.println("getReplyData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("getReplyData close err : " + e);
			}
		}
		return dto;
	}
	
	public void updateOnum(int gnum, int onum){ //댓글용 - onum 갱신
		//같은 그룹의 레코드는 모두 작업에 참여 - 같은 그릅의 onum 값 변경
		//댓글의 onum은 이미 db에 있는 onum 보다 크거나 같은 값을 변경
		String sql = "update board set onum=onum + 1 where onum >=? and gnum=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, onum);
			pstmt.setInt(2, gnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateOnum err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("updateOnum close err : " + e);
			}
		}
	}
	
	public void saveReply(BoardBean bean){ //댓글용 저장
		String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)"; //총 12개 값.
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0); //readcnt
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, bean.getOnum()); //onum
			pstmt.setInt(12, bean.getNested()); //nested
			pstmt.executeUpdate(); // 1 or 0
		} catch (Exception e) {
			System.out.println("saveReply err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("saveReply close err : " + e);
			}
		}
	}
	
	public boolean checkPass(int num, String new_pass){ //수정작업 패스확인
		boolean b = false;
		String sql = "select pass from board where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt .executeQuery();
			if(rs.next()){
				if(new_pass.equals(rs.getString("pass"))) b = true;
			}
		} catch (Exception e) {
			System.out.println("checkPass err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("checkPass close err : " + e);
			}
		}
		return b;
	}
	
	public void saveEdit(BoardBean bean){ //수정작업 완료
		String sql = "update board set name=?, mail=?, title=?, cont=? where num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getMail());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getCont());
			pstmt.setInt(5, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("saveEdit close err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("saveEdit close err : " + e);
			}
		}
	}
	
	public void delData(String num){
		String sql = "delete from board where num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e) {
				System.out.println("delData close err : " + e);
			}
		}
	}
}












































