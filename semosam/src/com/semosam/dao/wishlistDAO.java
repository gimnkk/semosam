package com.semosam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class wishlistDAO {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "JSP_PROJECT";
	private final String PASS = "1111";
	
	public wishlistDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 占쏙옙占쏙옙譴占� 占싸듸옙 占쏙옙占쏙옙");
		}
	}
	
	public int addWishlist(int memnum, int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int result = -1;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "INSERT INTO wishlist VALUES (?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memnum);
			pstmt.setInt(2, coursenum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return result;
	}
	
	public int deleteWishlist(String email, int courseNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int result = -1;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "DELETE FROM wishlist WHERE coursenum = ? AND memnum = (SELECT memnum FROM member WHERE email=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, courseNum);
			pstmt.setString(2, email);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return result;
	}
	
}
