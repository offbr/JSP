package aa.bb.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aa.bb.model.DateModel;

public class DataPro implements CommandInter{
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 모델을 수행 한 후 결과를 얻기.
		DateModel model = new DateModel(); //싱글톤으로 받기 생략
		ArrayList<String> list = model.getDate();
		request.setAttribute("data", list);
		return "view2";
	}

}
