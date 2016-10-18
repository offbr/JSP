package kr.co.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.model.SangpumDto;
import kr.co.model.SangpumModel;

public class SangpumImpl implements CommandInter{
	public static SangpumImpl impl = new SangpumImpl();
	
	public static SangpumImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SangpumModel model = SangpumModel.instance();
		ArrayList<SangpumDto> list = model.getDataAll();
		request.setAttribute("data", list);
		
		return "sangpum"; //뷰파일명
	}
}






























