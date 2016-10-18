package com.company.model;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class CompanyModel {
	public static CompanyModel companyModel = new CompanyModel();	
	public static CompanyModel getinstance(){
		return companyModel;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public ArrayList<SawonDto> getSawonAll(Map map){
		ArrayList<SawonDto> list = new ArrayList<>();
		
		try {
			SqlSession session = factory.openSession();
			list = (ArrayList)session.selectList("selectSawonAll", map);
		} catch (Exception e) {
			System.out.println("getSawonAll err : " + e);
		}
		return list;
	}
	
	public ArrayList<GogekDto> getGogekAll(Map map){
		ArrayList<GogekDto> list = new ArrayList<>();
		
		try {
			SqlSession session = factory.openSession();
			list = (ArrayList)session.selectList("selectGogekAll", map);
		} catch (Exception e) {
			System.out.println("selectGogekAll err : " + e);
		}
		return list;
	}
	
}
