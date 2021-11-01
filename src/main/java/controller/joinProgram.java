package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import DTO.UserDTO;

@WebServlet("/joinProgram")
public class joinProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");

		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String sex = request.getParameter("sex");
		String marriage = request.getParameter("marriage");
		System.out.println("email값: "+email);
		System.out.println("pwd값: "+pwd);
		System.out.println("name값: "+name);
		System.out.println("birthday값: "+birthday);
		System.out.println("sex값: "+sex);
		System.out.println("marriage값: "+marriage);
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO(email, pwd, name, birthday, sex, marriage);
		int cnt = dao.join(dto);
		System.out.println("cnt값: "+cnt);
		try {
			if (cnt > 0) {
				response.sendRedirect("login.jsp");
			} else {
				response.sendRedirect("join.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
