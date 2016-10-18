package kr.co.model;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pack.mybatis.SqlMapConfig;

public class SangpumModel {
	public static SangpumModel model = new SangpumModel();
	public static SangpumModel instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public ArrayList<SangpumDto> getDataAll(){
		ArrayList<SangpumDto> list = new ArrayList<>();
		
		try {
			SqlSession session = factory.openSession();
			list = (ArrayList)session.selectList("selectDataAll");
		} catch (Exception e) {
			System.out.println("getDataAll err : " + e);
		}	
		return list;
	}
	
}
















