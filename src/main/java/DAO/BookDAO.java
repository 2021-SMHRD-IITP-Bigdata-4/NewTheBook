package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import org.apache.catalina.filters.ExpiresFilter.XServletOutputStream;

import DTO.BookDTO;


public class BookDAO {
	
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	BookDTO bookdto1 = null;
	BookDTO bookdto2 = null;
	BookDTO bookdto3 = null;
	BookDTO bookdto4 = null;
	ArrayList<BookDTO> b1 = null;
	ArrayList<BookDTO> b2 = null;
	ArrayList<BookDTO> b3 = null;
	ArrayList<BookDTO> b4 = null;
	BookDTO bp = null;
	
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
	
	
	
	
	public BookDTO page(int seq){
		conn();
		System.out.println(seq);
	      String sql = "select * from books where book_seq =?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, seq);
	         rs = psmt.executeQuery();
	         if(rs.next()) {
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
				bp = new BookDTO(book_seq, book_name, author, publisher, book_price, book_salecount, book_category, book_genre, book_link, book_isbn, book_bestdate, book_image1, book_image2);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return bp;
	}
	
	public ArrayList<BookDTO> book1(){
		conn();
		b1 = new ArrayList<BookDTO>();
		Random rand = new Random();
		int num = rand.nextInt(50)+51;
		System.out.println(num);
	      String sql = "select * from books";
	      try {
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();
	         for (int i = num; i < num+50; i++) {
	        	 	rs.next();
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
					bookdto1 = new BookDTO(book_seq, book_name, author, publisher, book_price, book_salecount, book_category, book_genre, book_link, book_isbn, book_bestdate, book_image1, book_image2);
					b1.add(bookdto1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return b1;
	}
	
	public ArrayList<BookDTO> book2(){
		conn();
		b2 = new ArrayList<BookDTO>();
		Random rand = new Random();
		int num = rand.nextInt(50)+51;
		System.out.println(num);
	      String sql = "select * from books where book_seq > 100";
	      try {
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();
	         for (int i = num; i < num+50; i++) {
	        	 	rs.next();
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
					bookdto2 = new BookDTO(book_seq, book_name, author, publisher, book_price, book_salecount, book_category, book_genre, book_link, book_isbn, book_bestdate, book_image1, book_image2);
					b2.add(bookdto2);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return b2;
	}
	
	public ArrayList<BookDTO> book3(){
		conn();
		b3 = new ArrayList<BookDTO>();
		Random rand = new Random();
		int num = rand.nextInt(50)+51;
		System.out.println(num);
	      String sql = "select * from books where book_seq > 200";
	      try {
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();
	         for (int i = num; i < num+50; i++) {
	        	 	rs.next();
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
					bookdto3 = new BookDTO(book_seq, book_name, author, publisher, book_price, book_salecount, book_category, book_genre, book_link, book_isbn, book_bestdate, book_image1, book_image2);
					b3.add(bookdto3);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return b3;
	}
	
	
}
