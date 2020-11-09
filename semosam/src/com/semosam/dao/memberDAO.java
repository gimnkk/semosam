package com.semosam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semosam.dto.memberDTO;

public class memberDAO {

	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "JSP_PROJECT";
	private final String PASS = "1111";

	public memberDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC ·Îµå ½ÇÆÐ");
		}
	}
	
	public boolean teacherCheck(String email) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select m.memnum from member m, teacher t where t.memnum = m.memnum and m.email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			if(pstmt.executeQuery().next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	public boolean login(String email, String pwd) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select email,pwd from member where email=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);

			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	
	public boolean checkId(String id) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select email from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}
	
	public int getMemnum(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return memnum;
	}

	public boolean insertMember(memberDTO bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		boolean flag = false;
		int number = 0;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select memnum.nextval from dual");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			sql = "insert into member(memnum,email,pwd,name,gender,tel,interests) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getPwd());
			pstmt.setString(4, bean.getName());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getTel());
			pstmt.setString(7, bean.getInterest());
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return flag;

	}
	
	public memberDTO getMember(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memberDTO bean = null;
		String strQuery = null;

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			strQuery = "SELECT email,name,gender,tel,interests FROM member WHERE email=?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new memberDTO();
				bean.setEmail(rs.getString("email"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setTel(rs.getString("tel"));
				bean.setInterest(rs.getString("interests"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return bean;
	}

	public boolean updateMember(memberDTO bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String strQuery = null;
		int num = 0;
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			strQuery = "update member set name=?, gender=?, tel=?, interests=? where email=?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getGender());
			pstmt.setString(3, bean.getTel());
			pstmt.setString(4, bean.getInterest());
			pstmt.setString(5, bean.getEmail());

			num = pstmt.executeUpdate();
			System.out.println(num);
			if (num > 0) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	public int deleteMember(String email, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		String passwd = "";

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("SELECT pwd FROM member WHERE email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				passwd = rs.getString("pwd");
				if (passwd.equals(pwd)) {
					pstmt = conn.prepareStatement("UPDATE member SET email=null, pwd=null, name='(Å»ÅðÇÑ È¸¿ø)', gender=null, tel=null, interests=NULL WHERE email=?");
					pstmt.setString(1, email);
					pstmt.executeUpdate();
					x = 1;
				} else
					x = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return x;
	}
}