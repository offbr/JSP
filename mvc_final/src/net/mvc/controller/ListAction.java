package net.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mvc.model.UserDto;
import net.mvc.model.UserManager;

public class ListAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//UserManager manager = UserManager.getinstance();
		//ArrayList<UserDto> list = manager.getUserList();
		ArrayList<UserDto> list = UserManager.getinstance().getUserList();
		request.setAttribute("list", list);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setRedirect(false);
		modelAndView.setPath("userlist.jsp");
		
		return modelAndView;
	}
}
