package net.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.mvc.model.UserManager;

public class SawonAction implements Controller{
@Override
public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
	String buser_num = request.getParameter("buser_no");
	ArrayList sawonlist = UserManager.instance().listSawon(buser_num);
	
	request.setAttribute("sawonlist", sawonlist);
	ArrayList gogeklist = UserManager.instance().listGogek(buser_num);
	request.setAttribute("gogeklist", gogeklist);
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setRedirect(false);
	modelAndView.setPath("gogeklist.jsp");
	return modelAndView;
}
}
