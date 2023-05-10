package bank.oracle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/login.jsp")

public class LoginServlet {

	public void init() throws ServletException {
		System.out.println("init 메서드 호출");
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse Response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		System.out.println("아이디: "+admin_id);
		System.out.println("비밀번호: "+admin_pw);
	}
	
}
