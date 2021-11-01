package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import DTO.UserDTO;


@WebServlet("/loginProgram")
public class loginProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		System.out.println(email);
		System.out.println(pwd);
		
		UserDAO dao = new UserDAO();
		UserDTO singledto = dao.login(email, pwd);
		if(singledto == null) {
			System.out.println("dto값 없음");
		}
		
		try {
			if (singledto != null) {
				System.out.println( singledto+ "성공");
				HttpSession session = request.getSession();
				session.setAttribute("singledto", singledto);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
