package pack;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Testjstl")
public class TestJstl extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String irum = "마당쇠";
		request.setAttribute("man", irum);
		
		Person person = new Person(); //사실은 init(생성자)에서 생성
		person.setName("한국인");
		request.setAttribute("person", person);
		
		Student student = new Student();
		student.setAge(20);
		request.setAttribute("student", student);
		
		//배열
		String[] ani = {"말", "강아지", "호랑이"};
		request.setAttribute("animal", ani);
		
		String[] foods = {"당근", "개밥", "동물"};
		List<Object> list = new ArrayList<>();
		list.add(ani);
		list.add(foods);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("testjstl.jsp").forward(request, response);
	}

}
