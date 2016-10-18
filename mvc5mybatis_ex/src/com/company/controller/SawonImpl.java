package com.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.CompanyModel;
import com.company.model.SawonDto;

public class SawonImpl implements CommandInter{
	public static SawonImpl impl = new SawonImpl();
	public static SawonImpl getinstance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CompanyModel model = CompanyModel.getinstance();
		Map<String, String> map = new HashMap();
		map.put("sort", request.getParameter("sort"));		
		ArrayList<SawonDto> list = model.getSawonAll(map);
		request.setAttribute("data", list);
		return "sawon";
	}

}
