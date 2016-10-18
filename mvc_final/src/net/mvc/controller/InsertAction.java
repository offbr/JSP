package net.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mvc.model.UserDto;
import net.mvc.model.UserManager;

public class InsertAction implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		UserDto formBean = new UserDto(); //formbean으로 사용 
		formBean.setUserid(request.getParameter("userid"));
		formBean.setPassword(request.getParameter("password"));
		formBean.setName(request.getParameter("name"));
		formBean.setEmail(request.getParameter("email"));
		
		int re = UserManager.getinstance().insert(formBean);
		
		ModelAndView modelAndView = new ModelAndView();
		if(re > 0){
			modelAndView.setPath("login.do");
		}else{
			modelAndView.setPath("fail.html");
		}
		modelAndView.setRedirect(true);
		return modelAndView;
	}
}
