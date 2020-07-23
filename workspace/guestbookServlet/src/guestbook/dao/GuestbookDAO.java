package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private static GuestbookDAO instance;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.143:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public static GuestbookDAO getInstance() {
		if (instance == null) {
			synchronized (GuestbookDAO.class) {
				instance = new GuestbookDAO();
			}
		}
		return instance;
	}

	public GuestbookDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int getSeq() {
		int seq = 0;
		getConnection();
		String sql = "SELECT seq_guestbook.NEXTVAL from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			seq = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} // try,catch
		} // try,catch,finally
		return seq;
	}// getSeq()

	public int writeGuestbook(GuestbookDTO guestbookDTO) {
		int su = 0;
		String sql = "insert into guestbook values(?,?,?,?,?,?,sysdate)";
		getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, guestbookDTO.getSeq());
			pstmt.setString(2, guestbookDTO.getName());
			pstmt.setString(3, guestbookDTO.getEmail());
			pstmt.setString(4, guestbookDTO.getPage());
			pstmt.setString(5, guestbookDTO.getTitle());
			pstmt.setString(6, guestbookDTO.getContent());
			su = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

	public List<GuestbookDTO> readGuestbook(int startNum, int endNum) {
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		String sql = "select * from" + "(select rownum rn, tt.* from"
				+ "(select * from guestbook order by logtime desc)tt) where rn>=? and rn<=?";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery(); // 오라클문장(sql문장) 실행!!
			while (rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				guestbookDTO.setSeq(rs.getInt("seq"));
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setDate(rs.getString("logtime"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setPage(rs.getString("homepage"));
				guestbookDTO.setTitle(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				list.add(guestbookDTO);
			} // while()
		} catch (Exception e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from guestbook";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalA = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalA;
	}
}
