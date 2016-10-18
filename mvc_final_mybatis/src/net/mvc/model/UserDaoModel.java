package net.mvc.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.mvc.resource.SqlMapConfig;

public class UserDaoModel { //business logic을 수행
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); 
	
	public UserDto findUser(String userid){
		UserDto dto = new UserDto();
		SqlSession session = factory.openSession();
		try {
			dto = session.selectOne("findUser", userid);
		} catch (Exception e) {
			System.out.println("findUser err : " + e);
		} finally {
			session.close();
		}
		return dto;
	}
	
	public ArrayList getUserList(){
		ArrayList list = null;
		SqlSession session = factory.openSession();
		try {
			list = (ArrayList)session.selectList("getUserList");
		} catch (Exception e) {
			System.out.println("getUserList err : " + e);
		} finally {
			session.close();
		}
		return list;
	}
	
	public int insert(UserDto formBean){
		int re = 0;
		SqlSession session = factory.openSession();
		try {
			re = session.insert("insertinfo", formBean);
			session.commit();
		} catch (Exception e) {
			System.out.println("insert err : " + e);
			session.rollback();
		} finally {
			session.close();
		}
		return re;
	}
	
	public int update(UserDto formBean){
		int re = 0;
		SqlSession session = factory.openSession();
		try {
			re = session.update("updateinfo", formBean);
			session.commit();
		} catch (Exception e) {
			System.out.println("update err : " + e);
			session.rollback();
		} finally {
			session.close();
		}
		return re;
	}
	
	public int delete(String userid){
		int re = 0;
		SqlSession session = factory.openSession(true);
		try {
			re = session.delete("deleteinfo", userid);
		} catch (Exception e) {
			System.out.println("delete err : " + e);
		} finally {
			session.close();
		}
		return re;
	}
}































