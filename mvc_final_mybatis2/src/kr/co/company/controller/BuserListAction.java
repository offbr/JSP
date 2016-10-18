package kr.co.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.company.model.BuserDto;
import kr.co.company.model.CompanyManager;

public class BuserListAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<BuserDto> list = CompanyManager.getInstance().getBuserList();
		request.setAttribute("buserlist", list);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setRedirect(false);
		modelAndView.setPath("view/buserList.jsp");
		return modelAndView;
	}

}
