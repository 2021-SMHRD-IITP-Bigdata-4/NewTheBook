package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BookDTO;
import DTO.MyBookDTO; 


public class MyBookDAO {
	
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	BookDTO mybdto = null;
	ArrayList<BookDTO> myblist = null;
	
	
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_e5";
			String db_pw = "smhrd5";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int save(int seq, String email) {
		conn();
	      String sql = "insert into mybooks values(mybooks_seq.nextval, ?, ?, '')";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, seq);
	         psmt.setString(2, email);
	         cnt = psmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return cnt;
	}
	
	public ArrayList<BookDTO> mybooklist(String user_id){
		conn();
		myblist = new ArrayList<BookDTO>();
	      String sql = "select * from books where book_seq in (select book_seq from mybooks where user_id = ?)";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, user_id);
	         rs = psmt.executeQuery();
	        	 	while(rs.next()) {
	        	 	int book_seq = rs.getInt(1);
					String book_name = rs.getString(2);
					String author = rs.getString(3);
					String publisher = rs.getString(4);
					int book_price = rs.getInt(5);
					int book_salecount = rs.getInt(6);
					String book_category = rs.getString(7);
					String book_genre = rs.getString(8);
					String book_link = rs.getString(9);
					String book_isbn = rs.getString(10);
					String book_bestdate = rs.getString(11);
					String book_image1 = rs.getString(12);
					String book_image2 = rs.getString(13);
					mybdto = new BookDTO(book_seq, book_name, author, publisher, book_price, book_salecount, book_category, book_genre, book_link, book_isbn, book_bestdate, book_image1, book_image2);
					myblist.add(mybdto);}
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();}
		return myblist;
	}
	
	
	
	
}
