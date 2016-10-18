package kr.co.company.model;

import java.util.ArrayList;

public class CompanyManager {
	public static CompanyManager manager = new CompanyManager();
	public static CompanyManager getInstance(){
		return manager;
	}
	
	public CompanyModel getCompanyModel(){
		return new CompanyModel();
	}
	
	public ArrayList<BuserDto> getBuserList(){
		return getCompanyModel().getBuserList();
	}
	
	public ArrayList<SawonDto> getSawonList(String buser_no){
		return getCompanyModel().getSawonList(buser_no);
	}
}
