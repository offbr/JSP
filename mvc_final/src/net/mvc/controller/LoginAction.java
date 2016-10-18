package net.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mvc.model.UserDaoModel;
import net.mvc.model.UserManager;

public class LoginAction implements Controller{   //실질적으로 모델 클래스와 통신

   @Override
   public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      String userid = request.getParameter("userid");
      String password = request.getParameter("password");
      
      //모델 클래스를 처리
      UserManager manager = UserManager.getinstance();
      boolean b = manager.login(userid, password);

      ModelAndView modelAndView = new ModelAndView();
      if(b){
         HttpSession session = request.getSession(true);
         session.setAttribute("userid", userid);
         modelAndView.setPath("userlist.do");
      }else{
         modelAndView.setPath("loginfail.html");
      }
      modelAndView.setRedirect(true); //web.xml을 만남 //포워딩은 서버에서 서버를 만날땐 안만난다 //클라이언트에 요청이 있을때만 만날 수 있다
		return modelAndView;
	}
}
