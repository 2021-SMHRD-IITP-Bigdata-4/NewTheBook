package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BookDAO;
import DTO.BookDTO;


@WebServlet("/bookpageProgram")
public class bookpageProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String num = request.getParameter("num");
		int seq = Integer.parseInt(num);
		
		BookDAO dao = new BookDAO();
		BookDTO bp =  dao.page(seq);
		
		try {
			if (bp != null) {
				System.out.println( bp+ "¼º°ø");
				HttpSession session = request.getSession();
				session.setAttribute("bp", bp);
				response.sendRedirect("book-page.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
