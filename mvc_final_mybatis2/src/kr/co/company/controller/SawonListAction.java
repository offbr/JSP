package kr.co.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.company.model.SawonDto;
import kr.co.company.model.CompanyManager;

public class SawonListAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<SawonDto> list = CompanyManager.getInstance().getSawonList(request.getParameter("buser_no"));
		request.setAttribute("sawonlist", list);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setRedirect(false);
		modelAndView.setPath("view/sawonList.jsp");
		return modelAndView;
	}

}
