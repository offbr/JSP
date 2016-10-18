package net.mvc.model;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.mvc.resource.SqlMapConfig;

public class UserDaoModel {	//business logic 수행
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	public ArrayList findBuser(){
		ArrayList list = null;
		SqlSession session = factory.openSession();
		try {
			list = (ArrayList)session.selectList("findBuser");	
		} catch (Exception e) {

		}finally{
			session.close();
		}
		return list;
	}
	public ArrayList listSawon(String buser_num){
		ArrayList list = null;
		SqlSession session = factory.openSession();
		try {
			list = (ArrayList)session.selectList("listSawon",buser_num);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}
	
	public ArrayList listGogek(String buser_num){
		ArrayList list = null;
		SqlSession session = factory.openSession();
		try {
			list = (ArrayList)session.selectList("listGogek",buser_num);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}
}
