package aa.bb.model;

import java.util.ArrayList;
import java.util.Calendar;

public class DateModel {
	//Singleton 처리 생략;
	public ArrayList<String> getDate(){
		Calendar calendar = Calendar.getInstance();
		String y = Integer.toString(calendar.get(calendar.YEAR));
		String m = Integer.toString(calendar.get(calendar.MONTH) + 1);
		String d = Integer.toString(calendar.get(calendar.DATE));
		
		ArrayList<String> list = new ArrayList<>();
		list.add(y);
		list.add(m);
		list.add(d);
		
		return list;
	}
}
