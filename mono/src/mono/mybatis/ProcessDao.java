package mono.mybatis;

import java.sql.SQLException;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.business.QnaBean;
import board.business.QnaDto;
import mono.mybatis.SqlMapConfig;
import mono.mybatis.SqlMapperInter;
import mypage.business.MemberBean;
import mypage.business.MemberDto;
import product.business.ProductBean;
import product.business.ProductDto;

public class ProcessDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	private static ProcessDao dao = new ProcessDao();

	public static ProcessDao getInstance() {
		return dao;
	}
	
	//------------ login 관련
	//이메일 중복체크
	public ArrayList<MemberBean> emailCheck(String m_email){
		ArrayList<MemberBean> list = null;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			list = inter.emailCheck(m_email);
		} catch (Exception e) {
			System.out.println("emailCheck err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	//회원가입
	public boolean register(MemberBean bean){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			b = inter.register(bean);
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("register err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	//로그인확인
	public ArrayList<MemberBean> loginCheck(Map<String, String> map){
		ArrayList<MemberBean> list = null;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			list = inter.loginCheck(map);
		} catch (Exception e) {
			System.out.println("loginCheck err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	//정보수정시 전체자료
	public MemberDto myinfo(String m_email){
		MemberDto dto = null;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			dto = inter.myinfo(m_email);
		} catch (Exception e) {
			System.out.println("myinfo err : " + e);
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return dto;
	}
	
	//정보수정
	public boolean updateInfo(MemberBean bean){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			int count = inter.updateInfo(bean);
			if(count > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("updateInfo err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	//-------------- board 관련
	//qna 전체 리스트
	public ArrayList<QnaBean> qnaList(int pageChoice){
		ArrayList<QnaBean> list = null;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			list = inter.qnaList(pageChoice);
		} catch (Exception e) {
			System.out.println("qnaList err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	//qna 전체 게시글수
	public int qnaCount(){
		int qnaCount = 0;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			qnaCount = inter.qnaCount();
		} catch (Exception e) {
			System.out.println("qnaCount err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return qnaCount;
	}
		
	//qna 검색
	public ArrayList<QnaBean> qnaSearch(Map<String, String> map) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		ArrayList<QnaBean> list = null;
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			list = inter.qnaSearch(map);
		} catch (Exception e) {
			System.out.println("qnaSearch err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	//qna 비밀번호 체크
		public boolean qnaCheckPass(Map<String, String> map){
			boolean b = false;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				b = inter.qnaCheckPass(map);
			} catch (Exception e) {
				System.out.println("qnaCheckPass err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return b;
		}
		
		
		//qnaView 보기
		public QnaDto qnaView(String b_no){
			QnaDto dto = null;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				dto = inter.qnaView(b_no);
			} catch (Exception e) {
				System.out.println("qnaView err : " + e);
			}finally{
				if(sqlSession != null) sqlSession.close();
			}
			return dto;
		}
		
		// 새글 등록시 번호값
		public int max_b_no(){
			int count = 0;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				count = inter.max_b_no();
			} catch (Exception e) {
				System.out.println("max_b_no err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return count;
		}
		
		// 새글 등록
		public boolean qnaInsert(QnaBean bean){
			boolean b = false;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				b = inter.qnaInsert(bean);
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("qnaInsert err : " + e);
				sqlSession.rollback();
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return b;
		}
		
		// qna 글삭제
		public boolean qnaDelete(String b_no){
			boolean b = false;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				b = inter.qnaDelete(b_no);
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("qnaDelete err : " + e);
				sqlSession.rollback();
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return b;
		}
		
		// qna 글수정
		public boolean qnaUpdate(QnaBean bean){
			boolean b = false;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				b = inter.qnaUpdate(bean);
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("qnaUpdate err : " + e);
				sqlSession.rollback();
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return b;
		}
		
		//------------product관련
		// 제품 전체자료 보기
		public ArrayList<ProductBean> productList(){
			ArrayList<ProductBean> list = null;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				list = inter.productList();
			} catch (Exception e) {
				System.out.println("productList err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return list;
		}
		
		//제품 상세페이지 보기
		public ProductDto productView(String p_no){
			ProductDto dto = null;
			SqlSession sqlSession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
				dto = inter.productView(p_no);
			} catch (Exception e) {
				System.out.println("qnaView err : " + e);
			}finally{
				if(sqlSession != null) sqlSession.close();
			}
			return dto;
		}
		
}











