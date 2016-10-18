package kr.co.company.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.co.company.resource.SqlMapConfig;

public class CompanyModel {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public ArrayList getBuserList(){
		ArrayList list = null;
		SqlSession session = factory.openSession();
		try {
			list = (ArrayList)session.selectList("getBuserList");
		} catch (Exception e) {
			System.out.println("getBuserList err : " + e);
		} finally {
			session.close();
		}
		return list;
	}
	
	public ArrayList getSawonList(String buser_no){
		ArrayList list = null;
		SqlSession session = factory.openSession();
		try {
			list = (ArrayList)session.selectList("getSawonList", buser_no);
		} catch (Exception e) {
			System.out.println("getSawonList err : " + e);
		} finally {
			session.close();
		}
		return list;
	}
}
