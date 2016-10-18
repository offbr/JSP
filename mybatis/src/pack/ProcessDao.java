package pack;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProcessDao {
	private static ProcessDao dao = new ProcessDao();
	public static ProcessDao getInstance(){
		return dao;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//전체자료 읽기
	public List selectDataAll() throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectDataAll"); //DataMapper의 id를 읽기
		sqlSession.close();
		return list;
	}
	
	//부분자료 읽기
	public DataDto slelectDataPart(String arg) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		DataDto dto = sqlSession.selectOne("selectDataById", arg);
		sqlSession.close();
		return dto;
	}
	
	//자료 추가
	public int insertData(DataDto dto) throws SQLException{
		SqlSession sqlSession = factory.openSession(); //수동 commit
		//SqlSession sqlSession = factory.openSession(true); //auto commit
		int re = sqlSession.insert("insertData", dto); //리턴값으로 1성공 0실패 값을 확인할수있다.
		//System.out.println("re : " +re);
		sqlSession.commit(); //sqlSession.rollback();
		sqlSession.close();
		return re;
	}
	
	//자료 수정
	public void updateData(DataDto dto) throws SQLException{
		SqlSession sqlSession = factory.openSession(true); //auto commit
		sqlSession.update("updateData", dto);
		//sqlSession.commit();
		sqlSession.close();
	}
	
	
	//자료 삭제
	public boolean deleteData(int arg){ //추천소스
		boolean b = false;
		SqlSession sqlSession = factory.openSession(); //수동 commit
		try {
			int cou = sqlSession.delete("deleteData", arg);
			if(cou > 0) b = true;
			sqlSession.commit();			
		} catch (Exception e) {
			System.out.println("deleteData err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return b;
	}
	
	
}

















