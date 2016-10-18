package net.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mvc.model.UserManager;

public class DeleteAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		int re = UserManager.getinstance().delete(userid);
		
		ModelAndView modelAndView = new ModelAndView();
		if(re > 0){
			modelAndView.setPath("userlist.do");
		}else{
			modelAndView.setPath("fail.html");
		}
		modelAndView.setRedirect(true);
		return modelAndView;
	}
}
