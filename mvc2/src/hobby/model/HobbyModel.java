package hobby.model;

import java.util.ArrayList;

public class HobbyModel {
	public static HobbyModel hobbyModel = new HobbyModel();
	
	public static HobbyModel getInstance(){
		return hobbyModel;
	}
	
	public ArrayList<String> getHobby(String hobby){
		ArrayList<String> list = new ArrayList<>();
		
		if(hobby.equals("m")){
			list.add("설악산");
			list.add("지리산");
		}else if(hobby.equals("t")){
			list.add("남해안");
			list.add("동해안");
			list.add("서해안");
		}else if(hobby.equals("s")){
			list.add("워터파크");
		}else if(hobby.equals("r")){
			list.add("마라톤");
			list.add("100미터 달리기");
		}
		
		return list;
	}
}
