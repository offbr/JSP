package kr.co.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.model.SangpumDto;
import kr.co.model.SangpumModel;
import kr.co.model.SawonDto;
import kr.co.model.SawonModel;

public class SawonImpl implements CommandInter{
	public static SawonImpl impl = new SawonImpl();
	
	public static SawonImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SawonModel model = SawonModel.instance();
		ArrayList<SawonDto> list = model.getDataAll();
		request.setAttribute("data", list);
		
		return "sawon"; //뷰파일명
	}
}






























