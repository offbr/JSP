package net.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mvc.model.UserManager;

public class BuserAction implements Controller{
@Override
public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
	
	ArrayList list = UserManager.instance().findBuser();
	request.setAttribute("buserlist",list);
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setPath("main.jsp");
	modelAndView.setRedirect(false);
	return modelAndView;
}
}
