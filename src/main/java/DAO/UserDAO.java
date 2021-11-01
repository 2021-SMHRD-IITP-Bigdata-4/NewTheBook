package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DTO.BookDTO;
import DTO.UserDTO;
import jdk.swing.interop.SwingInterOpUtils;


public class UserDAO {

	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	UserDTO userdto;
	UserDTO singledto;

	
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
	
	
	public int join(UserDTO dto) {
	      conn();
	      String sql = "insert into users values(?,?,?,?,'',?,?,'',sysdate,'')";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getEmail());
	         psmt.setString(2, dto.getPwd());
	         psmt.setString(3, dto.getName());
	         psmt.setString(4, dto.getBirthday());
	         psmt.setString(5, dto.getSex());
	         psmt.setString(6, dto.getMarriage());
	         cnt = psmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return cnt;
	   }
	
	public UserDTO login(String email, String pwd) {
	      conn();
	      String sql = "select * from users where user_id = ? and user_pwd = ?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, email);
	         psmt.setString(2, pwd);
	         rs = psmt.executeQuery();
				if (rs.next()) {
					String user_name = rs.getString(3);
					String user_birthdate = rs.getString(4);
					String user_job = rs.getString(5);
					String user_gender = rs.getString(6);
					String user_marriage = rs.getString(7);
					String user_pic = rs.getString(8);
					String user_joindate = rs.getString(9);
					String admin_yn = rs.getString(10);
					System.out.print("rs³Ð°ª¾Æ´Ô");
					singledto = new UserDTO(email, pwd, user_name, user_birthdate, user_job, user_gender, user_marriage, user_pic, user_joindate, admin_yn);
				}
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return singledto;
	   }
	
	
	
}
