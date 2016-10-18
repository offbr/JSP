package kr.co.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.company.controller.ModelAndView;

public interface Controller {
	ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

