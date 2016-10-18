package com.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.BuserDto;
import com.company.model.CompanyModel;
import com.company.model.SawonDto;

public class SawonImpl implements CommandInter{
	public static SawonImpl impl = new SawonImpl();
	public static String buser_num = "";
	
	public static SawonImpl getinstance(){
		return impl;
	}
		
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CompanyModel model = CompanyModel.getinstance();
		ArrayList<SawonDto> list = model.getSelectData(request.getParameter("no"));
		request.setAttribute("data", list);
		
		return "sawon"; //뷰파일명
	}
}






























