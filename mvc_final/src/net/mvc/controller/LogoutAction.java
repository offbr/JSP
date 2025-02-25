package net.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("userid");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setPath("login.jsp");
		modelAndView.setRedirect(true);
		return modelAndView;
	}
}
