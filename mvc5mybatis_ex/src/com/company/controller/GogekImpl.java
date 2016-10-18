package com.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.CompanyModel;
import com.company.model.GogekDto;
import com.company.model.SawonDto;

public class GogekImpl implements CommandInter{
	public static GogekImpl impl = new GogekImpl();
	public static GogekImpl getinstance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CompanyModel model = CompanyModel.getinstance();
		Map<String, String> map = new HashMap();
		map.put("sort", request.getParameter("sort"));		
		ArrayList<GogekDto> list = model.getGogekAll(map);
		request.setAttribute("data", list);
		return "gogek";
	}

}
