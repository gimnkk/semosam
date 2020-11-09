package com.semosam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semosam.dto.applicantDTO;
import com.semosam.dto.memberDTO;

public class applicantDAO {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "JSP_PROJECT";
	private final String PASS = "1111";

	public applicantDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 연결실패");
		}
	}
	
	public ArrayList<memberDTO> getApplicant(int coursenum, int serial) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		applicantDTO dtoA = new applicantDTO();
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "SELECT m.* FROM applicant a, member m WHERE a.memnum = m.memnum AND coursenum=? AND serial=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			pstmt.setInt(2, serial);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memberDTO dtoM = new memberDTO();
				dtoM.setEmail(rs.getString("email"));
				dtoM.setName(rs.getString("name"));
				dtoM.setGender(rs.getString("gender"));
				dtoM.setTel(rs.getString("tel"));
				list.add(dtoM);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public boolean insertApplicant(int coursenum, int serial, String email) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "";

	      boolean flag = false;
	      int memnum = 0;

	      try {
	         conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	         	         
	         pstmt = conn.prepareStatement("select memnum from member where email=?");
	         pstmt.setString(1, email);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            memnum = rs.getInt(1);
	         }

	         sql = "insert into applicant"
	               + " values(?,?,?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, coursenum);
	         pstmt.setInt(2, serial);
	         pstmt.setInt(3, memnum);
	         
	         if (pstmt.executeUpdate() == 1) {
	            flag = true;
	         }
	      } catch (SQLException se) {
	    	  se.printStackTrace();
	         return false;
	      } catch(Exception e){
	    	  e.printStackTrace();
	      }finally {
	    	  Util.close(conn, pstmt, rs);
	      }
	      return flag;
	   }
	
	public int deleteMyCourses(int coursenum, int serial) {
		System.out.println(coursenum);
		System.out.println(serial);

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "DELETE FROM applicant WHERE coursenum=? AND serial=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			pstmt.setInt(2, serial);
			result = pstmt.executeUpdate();

			System.out.println(result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return result;
	}
}
