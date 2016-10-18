package su.model;

import java.util.ArrayList;

public class SuModel {
	public static SuModel suModel = new SuModel();
	
	public static SuModel getInstance(){
		return suModel;
	}
	
	public ArrayList<String> getSu(int su){
		ArrayList<String> list = new ArrayList<String>();
		String result = "";
		for (int i = 0; i < su; i++) {
			if(i % 2 == 0){
				result += "홀 : " + i + "<br>";
			}else{
				result += "짝 : " + i + "<br>";
			}
		}
		list.add(result);
		return list;
		
	}
}
