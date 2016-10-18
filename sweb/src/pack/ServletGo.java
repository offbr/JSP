package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/kbs.mbc")	//web servlet 어노테이션이라고 함 (@Override는 오버라이드 어노테이션이듯): 이걸 쓰면 web.xml에 자동등록됨
public class ServletGo extends HttpServlet {
	int num;
	MyClass class1;
    
	public void init(ServletConfig config) throws ServletException {
		num = 0;
		class1 = new MyClass();	//싱글톤으로 만들거나, 여기서 수행해라 (init은 한번만 실행되기 때문에)
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		num++;
		System.out.println("num :" + num);
		
		Thread th = Thread.currentThread();
		System.out.println("현재 스레드 명:" + th.getName());
		*/
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>ServletGo 수행됨</h1>");
		int a = 10, b= 20;
		int c = a + b;
		out.println("a=" + a + ", b=" + b);
		out.println("합은:" + c);
		out.println("메소드 수행 후 합은:" + calc(a, b));
		Calendar calendar = Calendar.getInstance();	//이건 싱글톤이라 객체를 한번 만들지만
		out.println("<br>" + calendar.get(calendar.YEAR)+"년");
		
		//MyClass class1 = new MyClass();	1//이건 매번 만들어짐 고로 init에 만들거나 싱글톤으로 바꿔라
		
		out.println("<br>" + class1.msg("aa"));
		class1.display(10, out);
		
		out.println("</body></html>");
		out.close();
	}
	
	private int calc(int m, int n){
		return m + n;
	}
}
