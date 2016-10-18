package pack.business;

import java.util.List;
import java.util.Map;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	private static ProcessDao dao = new ProcessDao();
	public static ProcessDao getInstance(){
		return dao;
	}
	//public List selectDataAll(){
	public List selectDataAll(Map<String, String> map){
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			//list = sqlSession.selectList("selectDataAll");
			list = sqlSession.selectList("selectDataAll", map);
		} catch (Exception e) {
			System.out.println("selectDataAll err " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	public DataDto selectDataById(String id){
		SqlSession sqlSession = factory.openSession();
		DataDto dto = null;
		try {
			dto = sqlSession.selectOne("selectDataById", id);
		} catch (Exception e) {
			System.out.println("selectDataAll err " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return dto;
	}
	
	public boolean insertData(DataDto dto){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();

		try {
			if(sqlSession.insert("insertData", dto) > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("insertData err " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public boolean updateData(DataDto dto){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();

		try {
			//비밀번호 비교
			DataDto dto2 = selectDataById(dto.getId());
			if(dto2.isCheckPasswd(dto.getpassword()) == false){
				return b;
			}
			if(sqlSession.update("updateData", dto) > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("updateData err " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public boolean deleteData(String id){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			if(sqlSession.update("deleteData", id) > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("deleteData err " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
}

















