package su.model;

import java.util.ArrayList;

public class DanModel {
	public static DanModel danModel = new DanModel();
	
	public static DanModel getInstance(){
		return danModel;
	}
	
	public ArrayList<String> getDan(int su){
		ArrayList<String> list = new ArrayList<String>();
		String result = "";
		for (int i = 1; i < 10; i++) {
			result += (su + "*" + i + "= " + (su*i) + "<br>");
		}
		list.add(result);
		return list;
		
	}
}
