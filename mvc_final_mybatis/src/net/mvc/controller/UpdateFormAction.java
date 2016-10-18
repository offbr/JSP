package net.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mvc.model.UserDto;
import net.mvc.model.UserManager;

public class UpdateFormAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userid = request.getParameter("userid");
		
		UserDto dto = UserManager.getinstance().findUser(userid);
		request.setAttribute("user", dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setPath("userupdate.jsp");
		modelAndView.setRedirect(false);
		return modelAndView;
	}
}
