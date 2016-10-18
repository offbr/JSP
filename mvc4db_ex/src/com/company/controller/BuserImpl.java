package com.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.BuserDto;
import com.company.model.CompanyModel;

public class BuserImpl implements CommandInter{
	public static BuserImpl impl = new BuserImpl();
	
	public static BuserImpl getinstance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CompanyModel model = CompanyModel.getinstance();
		ArrayList<BuserDto> list = model.getBuserAll();
		request.setAttribute("data", list);
		
		return "buser"; //뷰파일명
	}
}






























