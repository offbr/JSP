package pack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class World extends HttpServlet{	//HttpServlet를 상속 받아야 web용 자바가 됨
	
//	public World() { //생성자는 new해야 호출되는데 이건 굳이 잘 안씀
//		
//	}
	
	@Override
	public void init() throws ServletException {	//호출시 딱 1회만 수행되고 그뒤로안됨
		System.out.println("초기화 1회 수행");
	}
	
	@Override
	public void destroy() { //서비스 리셋시 1회 수행함
		System.out.println("서비스 종료 시 1회 수행");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("안녕은 호출 시 메인 수행");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 System.out.println("post 방식으로 호출시 매번 수행");
	}
	
	/*
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {	//우선순위가 제일높음
		System.out.println("get post 방식을 모두처리");																	//(JSP파일은 service메소드를 오버라이드한것)
	}
	*/
}
