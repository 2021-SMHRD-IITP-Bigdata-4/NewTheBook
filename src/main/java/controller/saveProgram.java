package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MyBookDAO;


@WebServlet("/saveProgram")
public class saveProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String email = request.getParameter("id");
		String book_seq = request.getParameter("num");
		int seq = Integer.parseInt(book_seq);
		System.out.println(email);
		System.out.println(book_seq);
		
		MyBookDAO dao = new MyBookDAO();
		int cnt = dao.save(seq, email);
		
		try {
			if (cnt>0) {
				System.out.println( "저장성공");
				response.sendRedirect("mylist.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
