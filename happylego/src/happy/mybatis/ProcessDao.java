package happy.mybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import communtity.business.QnaBean;
import communtity.business.QnaMBean;
import happy.mybatis.SqlMapperInter;
import mypage.business.GuestBean;
import mypage.business.GuestDto;

import mypage.business.ZiptabBean;
import service.business.ProductDto;
import service.business.OrderDto;

public class ProcessDao {
	 private Connection conn;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	 private DataSource ds;
	   
	   public ProcessDao() {
	      try {
	         Context context = new InitialContext();
	         ds = (DataSource) context.lookup("java:comp/env/jdbc_maria");
	      } catch (Exception e) {
	         System.out.println("실패");
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	            System.out.println("asd");
	         }
	      }
	   }
	
	
	
	private static ProcessDao dao = new ProcessDao();
	
	public static ProcessDao getInstance(){
		return dao;
	}
	
	
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	// ----------------- community ---------------------
	//전체자료 읽기
	public List qnaAll(int page) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			list = sqlSession.selectList("qnaAll", page); 
		} catch (Exception e) {
			System.out.println("qnaAll err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	//검색 자료 읽기
	public List qnaSearch(Map<String, String> map) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			list = sqlSession.selectList("qnaSearch", map); 
		} catch (Exception e) {
			System.out.println("qnaSearch err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	//전체페이지 수 totalCount
	public int totalPage() throws SQLException{
		SqlSession sqlSession = factory.openSession(); //수동 commit
		int totalPage = 0;
		try {
			int maxCount = sqlSession.selectOne("pageSu"); //총 게시글수 가져오기			
			totalPage = maxCount / 10; // 페이지수 = 총 게시글수 / 한뷰에 보여질 게시글수
			if(maxCount % 10 > 0) totalPage ++; // 총 게시글 수가 예를 들어 11 일 경우 딱 안떨어지므로 +1
		} catch (Exception e) {
			System.out.println("totalPage err : " + e);
		} finally {			
			if(sqlSession != null) sqlSession.close();
		}
		return totalPage;
	}
	
	//전체블럭 수 blockCount
	public int totalBlock(int totalPage){
		// 블럭수 = 총 게시글수 / 한뷰에 보여질 페이지수 // 총 페이지 수가 예를 들어 11 일 경우 딱 안떨어지므로 +1
		int totalBlock = (int)Math.ceil((double)totalPage / 10); 
		return totalBlock;
	}
	
	//게시글 비밀번호 확인
	public boolean qnaCheckPass(Map<String, String> map) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		boolean b = false;
		try {
			int count = sqlSession.selectOne("qnaCheckPass", map);
			if(count > 0) b = true;
		} catch (Exception e) {
			System.out.println("qnaCheckPass err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	//게시글 조회수증가
	public void qnaViewRead(String b_no) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		try {
			sqlSession.update("qnaViewRead", b_no);			
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("qnaViewRead err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
	}
	
	//게시글 읽기
	public List qnaView(Map<String, String> map) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			list = sqlSession.selectList("qnaView", map); 
		} catch (Exception e) {
			System.out.println("qnaView err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	// 새글 등록시 max b_no값 얻기
	public int max_b_no() throws SQLException{
		SqlSession sqlSession = factory.openSession(); //수동 commit
		int max_b_no = 0;
		try {
			max_b_no = sqlSession.selectOne("max_b_no"); //총 게시글수 가져오기			
		} catch (Exception e) {
			System.out.println("max_b_no err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return max_b_no;
	}
	
	// 새글 등록
	public int qnaInsert(QnaBean bean) throws SQLException{
		SqlSession sqlSession = factory.openSession(); //수동 commit
		int result = 0;
		try {
			result = sqlSession.insert("qnaInsert", bean); //리턴값으로 1성공 0실패 값을 확인할수있다.			
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("qnaInsert err : " + e);
			sqlSession.rollback();
		} finally {		
			if(sqlSession != null) sqlSession.close();
		}
		return result;
	}
	
	
	// 글 수정	
	public int qnaUpdate(QnaBean bean) throws SQLException{
		SqlSession sqlSession = factory.openSession(); //수동 commit
		int result = 0;
		try {
			result = sqlSession.update("qnaUpdate", bean); //리턴값으로 1성공 0실패 값을 확인할수있다.			
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("qnaUpdate err : " + e);
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}
	
	// 글 삭제
	public boolean qnaDelete(String b_no){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			int result = sqlSession.delete("qnaDelete", b_no);
			if(result > 0) b = true;
			sqlSession.commit();			
		} catch (Exception e) {
			System.out.println("qnaDelete err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return b;
	}
	
	// 관리자가 답변 달았을 때 b_state 변경
	public boolean qnaUpstate(Map<String, String> map) throws SQLException{
		SqlSession sqlSession = factory.openSession(); //수동 commit
		boolean b = false;
		try {
			int result = sqlSession.update("qnaUpstate", map); //리턴값으로 1성공 0실패 값을 확인할수있다.
			if(result > 0) b = true; 
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("qnaUpstate err : " + e);
			sqlSession.rollback();
		}
		sqlSession.close();
		return b;
	}
	
	// 관리자 답변 등록
		public boolean qnaM_Write(Map<String, String> map) throws SQLException{
			SqlSession sqlSession = factory.openSession(); //수동 commit
			boolean b = false;
			try {
				int result = sqlSession.insert("qnaM_Write", map); //리턴값으로 1성공 0실패 값을 확인할수있다.			
				if(result > 0) b = true;
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("qnaM_Write err : " + e);
				sqlSession.rollback();
			} finally {		
				if(sqlSession != null) sqlSession.close();
			}
			return b;
		}
	
		//게시글에 답변자료 읽기
		public List qnaM_View(String b_no) throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("qnaM_View", b_no); 
			} catch (Exception e) {
				System.out.println("qnaM_View err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return list;
		}
		
		
		//게시글에 답변자료 수정
		public int qnaM_Update(QnaMBean mBean) throws SQLException{
			SqlSession sqlSession = factory.openSession(); //수동 commit
			int result = 0;
			try {
				result = sqlSession.update("qnaM_Update", mBean); //리턴값으로 1성공 0실패 값을 확인할수있다.			
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("qnaM_Update err : " + e);
				sqlSession.rollback();
			}
			sqlSession.close();
			return result;
		}
		
		//게시글에 답변자료 삭제
		public boolean qnaM_Delete(String b_no){
			boolean b = false;
			SqlSession sqlSession = factory.openSession();
			try {
				int result = sqlSession.delete("qnaM_Delete", b_no);
				if(result > 0) b = true;
				sqlSession.commit();			
			} catch (Exception e) {
				System.out.println("qnaM_Delete err : " + e);
				sqlSession.rollback();
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return b;
		}
	

		// ----------------- product---------------------

		// ---------------------- Product -------------------------------
		
		public List selectDataAll() throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("selectDataAll"); //dataMapper의id를 읽음	
			} catch (Exception e) {
				System.out.println("selectDataAll err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return list;
		}
		
		public List selectDataPart(String arg) throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("selectDataByType",arg);	
			} catch (Exception e) {
				System.out.println("selectDataPart err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return list;
		}
		
		public List selectDataSeach(String arg) throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("selectDataBySearch",arg);
			} catch (Exception e) {
				System.out.println("selectDataSeach err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return list;
		}
		
		public ProductDto selectDataId(String arg) throws SQLException{
			SqlSession sqlSession = factory.openSession();
			ProductDto dto = null;
			try {
				dto = sqlSession.selectOne("selectDataById",arg);
			} catch (Exception e) {
				System.out.println("selectDataId err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return dto;		
		}
		
		public void updateDataStock(ProductDto dto) throws SQLException{
			SqlSession sqlSession = factory.openSession(true);
			try {
				sqlSession.update("updateDataStock",dto); 					
			} catch (Exception e) {
				System.out.println("updateDataStock err : " + e);
			}finally {
				if(sqlSession != null) sqlSession.close();			
			}
		}
		
		//-----------------------Order----------------------------------
		
		public OrderDto selectDataOrder(String arg) throws SQLException{
			SqlSession sqlSession = factory.openSession();
			OrderDto dto = null;
			try {
				dto = sqlSession.selectOne("selectDataByOrder",arg);
			} catch (Exception e) {
				System.out.println("selectDataOrder err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return dto;		
		}
		
		public void insertData(OrderDto dto) throws SQLException{
			SqlSession sqlSession = factory.openSession(); //수동(커밋필요)
			try {
				sqlSession.insert("insertData",dto);
				sqlSession.commit(); 					
			} catch (Exception e) {
				System.out.println("insertData err : " + e);
				sqlSession.rollback();		
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}		
		}
		
		public List selectdatalast() throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("selectDatalast"); //dataMapper의id를 읽음	
			} catch (Exception e) {
				System.out.println("selectdatalast err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}					
			return list;
		}
		
		
		//상품삭제
	      public boolean deleteDataProduct(String b_no){
	         boolean b = false;
	         SqlSession sqlSession = factory.openSession();
	         try {
	            int count = sqlSession.delete("deleteDataProduct", b_no);
	            if(count > 0) b = true;
	            sqlSession.commit();         
	         } catch (Exception e) {
	            System.out.println("deleteDataProduct err : " + e);
	            sqlSession.rollback();
	         } finally {
	            if(sqlSession != null) sqlSession.close();         
	         }
	         return b;
	      }
	      
	         
	         public boolean insertProduct(HttpServletRequest request){
	            boolean b = false;
	            
	            try {
	               
	               //업로드할 이미지경로(절대경로)
	               //String uploadDir = "C:/work/websu/happylego2/WebContent/serviceimage"; //윈도우경로
	            	
	               String uploadDir = "/Users/All/Documents/work/workspace/websou/happylego/WebContent/serviceimage"; //맥경로
	               
	               MultipartRequest multi = new MultipartRequest(request, uploadDir, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	               System.out.println(multi.getParameter("p_no"));
	               System.out.println(multi.getParameter("p_name"));
	               System.out.println(multi.getParameter("p_price"));
	               System.out.println(multi.getParameter("p_size"));
	               System.out.println(multi.getParameter("p_stock"));
	               System.out.println(multi.getFilesystemName("p_image"));
	               System.out.println(multi.getParameter("p_content"));
	               System.out.println(multi.getParameter("p_type"));
	               int image = multi.getFilesystemName("p_image").indexOf(".");
	               String image2 = multi.getFilesystemName("p_image").substring(0, image);
	               conn = ds.getConnection();
	               String sql = "insert into product(p_no,p_name,p_price,p_size,p_stock,p_image,p_content,p_type) values(?,?,?,?,?,?,?,?)";
	               pstmt = conn.prepareStatement(sql);
	               pstmt.setString(1, multi.getParameter("p_no"));
	               pstmt.setString(2, multi.getParameter("p_name"));
	               pstmt.setString(3, multi.getParameter("p_price"));
	               pstmt.setString(4, multi.getParameter("p_size"));
	               pstmt.setString(5, multi.getParameter("p_stock"));
	               if(multi.getFilesystemName("p_image") == null){
	                  //이미지를 선택하지않은경우
	                  pstmt.setString(6, "ready.gif");
	               }else{
	                  pstmt.setString(6, image2);
	               }            
	               pstmt.setString(7, multi.getParameter("p_content"));
	               pstmt.setString(8, multi.getParameter("p_type"));
	               
	               if(pstmt.executeUpdate() > 0) b = true;
	            } catch (Exception e) {
	               System.out.println("실패" + e);
	            } finally {
	               try {
	                  if (rs != null)
	                     rs.close();
	                  if (pstmt != null)
	                     pstmt.close();
	                  if (conn != null)
	                     conn.close();
	               } catch (Exception e) {
	                  System.out.println("asd");
	               }
	            }
	            return b;
	         }
	         
	         public boolean updateProduct(HttpServletRequest request){
	            boolean b = false;
	            try {
	               //String uploadDir = "C:/work/websou/happylego2/WebContent/serviceimage"; //윈도우경로
	            	String uploadDir = "/Users/All/Documents/work/workspace/websou/happylego/WebContent/serviceimage"; //맥경로
	               MultipartRequest multi = new MultipartRequest(request, uploadDir, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	               int image = multi.getFilesystemName("p_image").indexOf(".");
	               String image2 = multi.getFilesystemName("p_image").substring(0, image);
	               
	               conn = ds.getConnection();

	               String sql = "update product set p_name=?, p_price=?, p_size=?, p_stock=?, p_image=?, p_content=?, p_type=? where p_no=?";
	                  pstmt = conn.prepareStatement(sql);
	                  pstmt.setString(1, multi.getParameter("p_name"));
	                  pstmt.setString(2, multi.getParameter("p_price"));
	                  pstmt.setString(3, multi.getParameter("p_size"));
	                  pstmt.setString(4, multi.getParameter("p_stock"));
	                  
	                  if(multi.getFilesystemName("p_image") == null){
	                     //이미지를 선택하지않은경우
	                     pstmt.setString(5, "ready.gif");
	                  }else{
	                     pstmt.setString(5, image2);
	                  }
	                  pstmt.setString(6, multi.getParameter("p_content"));
	                  pstmt.setString(7, multi.getParameter("p_type"));
	                  pstmt.setString(8, multi.getParameter("p_no"));
	               
	               if(pstmt.executeUpdate() > 0) b = true;
	            } catch (Exception e) {
	               System.out.println("실패" + e);
	            } finally {
	               try {
	                  if (rs != null)
	                     rs.close();
	                  if (pstmt != null)
	                     pstmt.close();
	                  if (conn != null)
	                     conn.close();
	               } catch (Exception e) {
	                  System.out.println("asd");
	               }
	            }
	            return b;
	         }
		
		//---------------------------------------------------------
		
		
		
		//--------------------guest / member--------------------
		//집코드읽기.
		public ArrayList<ZiptabBean> zipserch(String area3){
			SqlSession sqlsession = factory.openSession();
			ArrayList<ZiptabBean> list = new ArrayList<>();
			
			try {
			if(area3 == null){
				list = null;
			}else{
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				list = inter.zipserch(area3);	
			}
			} catch (Exception e) {
				System.out.println("부분자료읽기 err : " + e);
			} finally {
				if(sqlsession != null) sqlsession.close();
			}
			
			return list;
		}
		
		//id중복체크
		public ArrayList<GuestDto> idcheck(String g_id){
			ArrayList<GuestDto> list = null;
			try {
				SqlSession sqlsession = factory.openSession();
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				list = inter.idcheck(g_id);
			} catch (Exception e) {
				System.out.println("idcheck err : " + e);
			}
			return list;
		}
		
		//회원가입
		public boolean joinok(GuestBean bean){
			boolean b = false;
			SqlSession sqlsession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				b = inter.joinok(bean);
				sqlsession.commit();
			} catch (Exception e) {
				System.out.println("insert err : " + e);
				sqlsession.rollback();
			} finally {
				if(sqlsession != null) sqlsession.close();
			}
			return b;
		}
		
		//로그인여부
		public List logincheck(Map<String, String> map){
			List list = null;
			SqlSession sqlsession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				list = inter.logincheck(map);
			} catch (Exception e) {
				System.out.println("logincheck err " + e);
			} finally{
				if(sqlsession != null) sqlsession.close();
			}
			return list;
		}
		
		//로그인 후 전체자료
		public GuestDto myinfo(String g_id){
			GuestDto dto = null;
			SqlSession sqlsession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				dto = inter.myinfo(g_id);
			} catch (Exception e) {
				System.out.println("myinfo err : " + e);
			}finally{
				if(sqlsession != null) sqlsession.close();
			}
			return dto;
		}
		
		//update
		public boolean update(Map<String, String> map){
			boolean b = false;
			SqlSession sqlsession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				if(inter.update(map) > 0) b = true;
				sqlsession.commit(b);
			} catch (Exception e) {
				System.out.println("update err : " + e);
				sqlsession.rollback();
			} finally{
				if(sqlsession != null) sqlsession.close();
			}
			return b;
		}
		
		//delete
		public boolean delete(String g_id){
			boolean b = false;
			SqlSession sqlsession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				b = inter.delete(g_id);
				sqlsession.commit();
			} catch (Exception e) {
				System.out.println("delete err : " + e);
				sqlsession.rollback();
			} finally{
				if(sqlsession != null) sqlsession.close();
			}
			return b;
		}
		
		//listall
		public ArrayList<OrderDto> listall(String g_id){
			ArrayList<OrderDto> list = null;
			SqlSession sqlsession = factory.openSession();
			try {
				SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
				list = inter.listall(g_id);
			} catch (Exception e) {
				System.out.println("listall err : " + e);
			}finally{
				if(sqlsession != null) sqlsession.close();
			}
			return list;
		}
		
		
		
		//-----------------관리자 페이지 ---------------------------//
		//관리자페이지 총 회원 
		public List guestAll() throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("guestAll"); 
			} catch (Exception e) {
				System.out.println("guestAll err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return list;
		}
		//관리자페이지 총 주문리스트
		public List orderAll() throws SQLException{
			SqlSession sqlSession = factory.openSession();
			List list = null;
			try {
				list = sqlSession.selectList("orderAll"); 
			} catch (Exception e) {
				System.out.println("orderAll err : " + e);
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return list;
		}
	
		// 주문관리 상품 상태 변경
		public int manager_OrderUpdate(String o_no) throws SQLException{
			SqlSession sqlSession = factory.openSession(); //수동 commit
			int result = 0;
			try {
				result = sqlSession.update("manager_OrderUpdate", o_no); //리턴값으로 1성공 0실패 값을 확인할수있다.			
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("manager_OrderUpdate err : " + e);
				sqlSession.rollback();
			}
			sqlSession.close();
			return result;
		}
		
		// 주문관리 상품 상태 변경시 재고 복구
		public int manager_ProductUpdate(String o_pno) throws SQLException{
			SqlSession sqlSession = factory.openSession(); //수동 commit
			int result = 0;
			try {
				result = sqlSession.update("manager_ProductUpdate", o_pno); //리턴값으로 1성공 0실패 값을 확인할수있다.			
				sqlSession.commit();
			} catch (Exception e) {
				System.out.println("manager_ProductUpdate err : " + e);
				sqlSession.rollback();
			}
			sqlSession.close();
			return result;
		}

		
		// 주문 기록 있는 회원 주문기록 삭제 
		public boolean manager_GuestOrderDelete(String o_gid){
			boolean b = false;
			SqlSession sqlSession = factory.openSession();
			try {
				int result = sqlSession.delete("manager_GuestOrderDelete", o_gid);
				if(result > 0) b = true;
				sqlSession.commit();			
			} catch (Exception e) {
				System.out.println("manager_GuestOrderDelete err : " + e);
				sqlSession.rollback();
			} finally {
				if(sqlSession != null) sqlSession.close();			
			}
			return b;
		}
		
		//-----------------관리자 페이지 ---------------------------//
	
		// -------------------차트 관련-----------------
		//salseChart
	      public ArrayList<OrderDto> salesChart(){
	         ArrayList<OrderDto> list = null;
	         SqlSession sqlsession = factory.openSession();
	         try {
	            SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
	            list = inter.salesChart();
	         } catch (Exception e) {
	            System.out.println("delete err : " + e);
	         } finally{
	            if(sqlsession != null) sqlsession.close();
	         }
	         return list;
	      }
	      
	    //rentalChar //베스트순위
	      public ArrayList<OrderDto> rentalChart(){
	         ArrayList<OrderDto> list = null;
	         SqlSession sqlsession = factory.openSession();
	         try {
	            SqlMapperInter inter = (SqlMapperInter)sqlsession.getMapper(SqlMapperInter.class);
	            list = inter.rentalChart();
	         } catch (Exception e) {
	            System.out.println("delete err : " + e);
	         } finally{
	            if(sqlsession != null) sqlsession.close();
	         }
	         sqlsession.close();
	         return list;
	      }
}

















