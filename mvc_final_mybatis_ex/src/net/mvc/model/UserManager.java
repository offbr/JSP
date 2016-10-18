package net.mvc.model;

import java.util.ArrayList;

public class UserManager {	//여러 개의 dao를 관리
	public static UserManager manager = new UserManager();
	public static UserManager instance(){
		return manager;
		
	}
	public UserDaoModel getUserDaoModel(){
		return new UserDaoModel();
	}
	public ArrayList findBuser(){
		return getUserDaoModel().findBuser();
		
	}
	public ArrayList listGogek(String buser_num){
		return getUserDaoModel().listGogek(buser_num);
	}
	public ArrayList listSawon(String buser_num){
		return getUserDaoModel().listSawon(buser_num);
	}


}
