package com.semosam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.semosam.dto.noticeDTO;

public class noticeDAO {
	private static noticeDAO instance = new noticeDAO();
	
	public static noticeDAO getInstance() {
		return instance;
	}	
	private noticeDAO() {
	}

	public static Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbId = "JSP_PROJECT";
			String dbPass = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	
	public List getArticles(int startRow, int endRow, String category, String sentence) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		List articleList = null;
		String query = "";
		try {
			conn = getConnection();
			if (category == null || category.contentEquals("")) {// get list
				query = "SELECT * FROM (SELECT ROWNUM rnum, A.* FROM(SELECT * FROM notice order by noticeno desc) A) WHERE rnum BETWEEN ? AND ? " ;
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				query = "SELECT * FROM (SELECT ROWNUM rnum, A.* FROM(SELECT * FROM notice WHERE " + category + " like ? ) A) WHERE rnum BETWEEN ? AND ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + sentence + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList(endRow);
				do {
					noticeDTO article = new noticeDTO();
					article.setNoticeno(rs.getInt("noticeno"));
					article.setSubject(rs.getString("subject"));
					article.setRegdate(rs.getString("regdate"));
					article.setContent(rs.getString("content"));
					articleList.add(article);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return articleList;
	}

	public noticeDTO getArticle(int noticeno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		noticeDTO article = null;

		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from notice where noticeno=? ");
			pstmt.setInt(1, noticeno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new noticeDTO();
				article.setNoticeno(rs.getInt("noticeno"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getString("regdate"));
				article.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return article;
	}
	public int getArticleCount( String category, String sentence) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql = "";
		try {
			if (category == null || category.contentEquals("")) { // get list
				sql = "select nvl(count(*),0) from notice";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "select nvl(count(*),0) from notice where " + category + " like ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sentence + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return x;
	}
	
}
