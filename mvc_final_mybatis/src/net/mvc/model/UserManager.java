package net.mvc.model;

import java.util.ArrayList;

public class UserManager { //여러 개의 dao를 관리
	public static UserManager manager = new UserManager();
	public static UserManager getinstance(){
		return manager;
	}
	
	public UserDaoModel getUserDaoModel(){
		return new UserDaoModel();
	}
	
	public boolean login(String userid, String user_password){
		UserDto dto = getUserDaoModel().findUser(userid);
		if(dto == null) return false; //id가 틀린 경우
		if(dto.getPassword().equals(user_password)){
			return true;
		}else{  //passwrod가 틀린경우
			return false;
		}
	}
	
	public ArrayList<UserDto> getUserList(){
		return getUserDaoModel().getUserList();
	}
	
	public UserDto findUser(String userid){
		return getUserDaoModel().findUser(userid);
	}
	
	public int update(UserDto formBean){
		return getUserDaoModel().update(formBean);
	}
	
	public int insert(UserDto formBean){
		return getUserDaoModel().insert(formBean);
	}
	
	public int delete(String userid){
		return getUserDaoModel().delete(userid);
	}
}























