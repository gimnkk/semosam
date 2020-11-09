package com.semosam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.semosam.dto.scheduleDTO;

public class scheduleDAO {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "JSP_PROJECT";
	private final String PASS = "1111";

	public scheduleDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 로드 불가");
		}
	}
	
	public int addSchedule(scheduleDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int result = -1;
		int serial = -1;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "SELECT nvl(max(serial), 0) FROM schedule WHERE coursenum= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCoursenum());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				if (rs.getInt(1) == 0) {
					serial = 1;
				} else {
					serial = rs.getInt(1) + 1;
				}
			}
			sql = "INSERT INTO schedule VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCoursenum());
			pstmt.setInt(2, serial);
			pstmt.setString(3, dto.getDay());
			pstmt.setInt(4, dto.getRuntime());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		
		return result;
	}
	
	public ArrayList<scheduleDTO> getSchedules(int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<scheduleDTO> list = new ArrayList<scheduleDTO>();
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select coursenum, serial, " + 
					"substr(day,1,instr(day, ' ')-1) day " + 
					", to_char(to_date(day, 'yyyy-MM-dd hh24:mi'), 'dy') weekday " + 
					", substr(day, instr(day, ' ')+1) time " +
					", runtime " +
					"from schedule " + 
					"where coursenum = ? " + 
					"order by day, time";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				scheduleDTO dto = new scheduleDTO();
				dto.setCoursenum(rs.getInt("coursenum"));
				dto.setSerial(rs.getInt("serial"));
				dto.setDay(rs.getString("day"));
				dto.setWeekday(rs.getString("weekday"));
				dto.setTime(rs.getString("time"));
				dto.setRuntime(rs.getInt("runtime"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public int deleteSchedule(int courseNum, int serial) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = -1;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "DELETE FROM schedule WHERE coursenum=? AND serial=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, courseNum);
			pstmt.setInt(2, serial);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return result;
	}
	
	public ArrayList<String> getDistinctTime(int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<String> list = new ArrayList<String>();
		String sql = "";
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select distinct substr(day, instr(day, ' ')+1) time, runtime " + 
					"from schedule " + 
					"where coursenum = ? " + 
					"order by time";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				list.add(rs.getString("time") + "(" + rs.getInt("runtime") + "시간) ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<String> getDistinctWeekday(int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Integer> list = new ArrayList<>();
		String sql = "";
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select distinct to_char(to_date(day, 'yyyy-MM-dd hh24:mi'), 'd') weekday " + 
					"from schedule " + 
					"where coursenum = ? "
					+ "order by weekday";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			rs = pstmt.executeQuery();
			
				
			while (rs.next()) {
				list.add(rs.getInt("weekday"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		ArrayList<String> days = new ArrayList<String>();
		
		for (int i = 0; i < list.size(); i++) {
			switch (list.get(i)) {
			case 1: days.add("일요일"); break;
			case 2: days.add("월요일"); break;
			case 3: days.add("화요일"); break;
			case 4: days.add("수요일"); break;
			case 5: days.add("목요일"); break;
			case 6: days.add("금요일"); break;
			case 7: days.add("토요일"); break;
			}
		}
		return days;
	}
	
	public ArrayList<scheduleDTO> getMyCoursesSchedules(int coursenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<scheduleDTO> list = new ArrayList<scheduleDTO>();

		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select a.coursenum, a.serial, " + "substr(day,1,instr(day, ' ')-1) day "
					+ ", to_char(to_date(day, 'yyyy-MM-dd hh24:mi'), 'dy') weekday "
					+ ", substr(day, instr(day, ' ')+1) time " + ", s.runtime " + "from schedule s, applicant a "
					+ "WHERE s.COURSENUM = a.COURSENUM AND s.SERIAL=a.SERIAL AND s.coursenum = ? "
					+ "order by day, time ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				scheduleDTO dto = new scheduleDTO();
				dto.setCoursenum(rs.getInt("coursenum"));
				dto.setSerial(rs.getInt("serial"));
				dto.setDay(rs.getString("day"));
				dto.setWeekday(rs.getString("weekday"));
				dto.setTime(rs.getString("time"));
				dto.setRuntime(rs.getInt("runtime"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return list;
	}

	public ArrayList<String> getMyDistinctWeekday(int coursenum, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<String> list = new ArrayList<String>();
		String sql = "";
		int memnum = -1;
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "SELECT memnum from member WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memnum = rs.getInt("memnum");
			}
			
			sql = "select day, to_char(to_date(day, 'yyyy-MM-dd hh24:mi'), 'dy') weekday , runtime "
					+ "from schedule s ,applicant a "
					+ "where s.coursenum=a.coursenum and s.SERIAL = a.SERIAL And a.coursenum =? and a.memnum =? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coursenum);
			pstmt.setInt(2, memnum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString("day") + " " +  rs.getString("weekday") + " " + rs.getString("runtime") + "시간 ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return list;
	}
}
