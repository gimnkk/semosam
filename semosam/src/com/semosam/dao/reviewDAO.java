package com.semosam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.semosam.dto.reviewDTO;

public class reviewDAO {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "JSP_PROJECT";
	private final String PASS = "1111";

	public reviewDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 로드 불가");
		}
	}

	public ArrayList<reviewDTO> getReviews(int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<reviewDTO> list = new ArrayList<reviewDTO>();

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);

			sql = "select * from review where coursenum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				reviewDTO dto = new reviewDTO();
				dto.setReviewnum(rs.getInt("reviewnum"));
				dto.setCoursenum(rs.getInt("coursenum"));
				dto.setMemnum(rs.getInt("memnum"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setStarscore(rs.getDouble("starscore"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return list;
	}

	public int getCountReview(int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int result = 0;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);

			sql = "select count(*) from review where coursenum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return result;
	}

	public int insertReview(String content, double starscore, int courseNum, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int result = -1;
		int memnum = -1;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "SELECT memnum FROM member WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memnum = rs.getInt(1);
			}
			sql = "INSERT INTO review VALUES (reviewnum.nextval, ?, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, courseNum);
			pstmt.setInt(2, memnum);
			pstmt.setString(3, content);
			pstmt.setDouble(4, starscore);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return result;

	}
}
