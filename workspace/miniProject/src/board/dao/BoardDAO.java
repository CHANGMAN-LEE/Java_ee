package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@192.168.0.143:1521:xe";
//	private String username = "c##java";
//	private String password = "bit";
//	private Connection conn;
//	private PreparedStatement pstmt;
//	private ResultSet rs;
	
	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void boardWrite(Map<String, String> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<BoardDTO> readBoardList(int startNum, int endNum){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		List<BoardDTO> list = sqlSession.selectList("boardSQL.readBoardList",map);
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}
	
	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();
		return boardDTO;
	}
	
	public void countHit(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.countHit", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public ArrayList<BoardDTO> getBoardList(int startNum, int endNum, String keyword, int searchOption) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		map.put("keyword", keyword);
		map.put("searchOption", Integer.toString(searchOption));
		ArrayList<BoardDTO> list = (ArrayList)sqlSession.selectList("boardSQL.getBoardList", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA2(boolean search, int searchOption, String keyword) {
		int totalA = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", String.valueOf(search));
		map.put("searchOption", Integer.toString(searchOption));
		map.put("keyword", keyword);
		totalA = sqlSession.selectOne("boardSQL.getTotalA2", map);
		return totalA;
	}
	
	public void boardModify(int seq, String subject, String content) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", Integer.toString(seq));
		map.put("subject", subject);
		map.put("content", content);
		sqlSession.update("boardSQL.boardModify", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void boardReply(Map<String, String> map) {
		//원글
		BoardDTO pDTO = getBoard(Integer.parseInt(map.get("pseq")));
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//step(글순서) update
		sqlSession.update("boardSQL.boardReply1", pDTO);
		
		//insert - 원글의 ref와 lev, step을 보내줘야해
		map.put("ref", pDTO.getRef()+"");
		map.put("lev", pDTO.getLev()+1+"");
		map.put("step", pDTO.getStep()+1+"");
		sqlSession.insert("boardSQL.boardReply2", map);
		
		//reply(답글수) update
		sqlSession.insert("boardSQL.boardReply3", pDTO.getSeq());
		//sqlSession.insert("boardSQL.boardReply3", Integer.parseInt(map.get("pseq")));
		
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardDelete", seq); //원글을 찾아서 reply(답글수) 감소 -> 답글을 찾아서 제목에 추가 -> 삭제
		sqlSession.commit();
		sqlSession.close();
	}
	
//	public BoardDAO() {
//		try {
//			Class.forName(driver);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//	}
//	public void getConnection() {
//	try {
//		conn = DriverManager.getConnection(url, username, password);
//	} catch (SQLException e) {
//		e.printStackTrace();
//	}
//}
//	public void boardWrite(Map<String, String> map){
//		getConnection();
//		String sql = "insert into board(seq, id, name, email, subject, content, ref) values(seq_board.nextval, ?, ?, ?, ?, ?, seq_board.currval)";
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, map.get("id"));
//			pstmt.setString(2, map.get("name"));
//			pstmt.setString(3, map.get("email"));
//			pstmt.setString(4, map.get("subject"));
//			pstmt.setString(5, map.get("content"));
//			
//		    pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null) {
//					pstmt.close();
//				}
//				if(conn != null) {
//					conn.close();
//				}
//			}catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
//	public List<BoardDTO> readBoardList(int startNum, int endNum){
//		List<BoardDTO> list = new ArrayList<BoardDTO>();
//		String sql = "select * from" + "(select rownum rn, tt.* from"
//				+ "(select * from board order by logtime desc)tt) where rn>=? and rn<=?";
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, startNum);
//			pstmt.setInt(2, endNum);
//			rs = pstmt.executeQuery(); // 오라클문장(sql문장) 실행!!
//			while (rs.next()) {
//				BoardDTO boardDTO = new BoardDTO();
//				boardDTO.setSeq(rs.getInt("seq"));
//				boardDTO.setId(rs.getString("id"));
//				boardDTO.setName(rs.getString("name"));
//				boardDTO.setEmail(rs.getString("email"));
//				boardDTO.setSubject(rs.getString("subject"));
//				boardDTO.setContent(rs.getString("content"));
//				boardDTO.setRef(rs.getInt("ref"));
//				boardDTO.setLev(rs.getInt("lev"));
//				boardDTO.setStep(rs.getInt("step"));
//				boardDTO.setPseq(rs.getInt("pseq"));
//				boardDTO.setReply(rs.getInt("reply"));
//				boardDTO.setHit(rs.getInt("hit"));
//				boardDTO.setLogtime(rs.getDate("logtime"));
//				list.add(boardDTO);
//			} // while()
//		} catch (Exception e) {
//			e.printStackTrace();
//			list = null;
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return list;
//	}
//	
//	public int getTotalA() {
//		int totalA = 0;
//		String sql = "select count(*) from board";
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			rs.next();
//			totalA = rs.getInt(1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return totalA;
//	}
//	
//	public BoardDTO getBoard(int seq) {
//		BoardDTO boardDTO = new BoardDTO();
//		String sql = "select * from board where seq=?";
//		this.getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, seq);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				boardDTO.setSeq(rs.getInt("seq"));
//				boardDTO.setId(rs.getString("id"));
//				boardDTO.setName(rs.getString("name"));
//				boardDTO.setEmail(rs.getString("email"));
//				boardDTO.setSubject(rs.getString("subject"));
//				boardDTO.setContent(rs.getString("content"));
//				boardDTO.setRef(rs.getInt("ref"));
//				boardDTO.setLev(rs.getInt("lev"));
//				boardDTO.setStep(rs.getInt("step"));
//				boardDTO.setPseq(rs.getInt("pseq"));
//				boardDTO.setReply(rs.getInt("reply"));
//				boardDTO.setHit(rs.getInt("hit"));
//				boardDTO.setLogtime(rs.getDate("logtime"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return boardDTO;
//	}
//	
//	public void boardModify(int seq, String subject, String content) {
//		String sql = "update board set subject=?, content=?, logtime=sysdate where seq=?";
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, subject);
//			pstmt.setString(2, content);
//			pstmt.setInt(3, seq);
//			
//			pstmt.executeUpdate();//실행
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(pstmt != null) pstmt.close();
//				if(conn != null) conn.close();
//			}catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//	}
//	
//	public void countHit(int seq) {
//		String sql = "update board set hit = hit + 1 where seq=?";
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, seq);
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(pstmt != null) pstmt.close();
//				if(conn != null) conn.close();
//			}catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
//	public ArrayList<BoardDTO> getBoardList(int startNum, int endNum, String keyword, int searchOption) {
//		String sql = null;
//		ArrayList<BoardDTO> ar = new ArrayList<BoardDTO>();
//		getConnection();
//
//		if (searchOption == 1) {
//			sql = "select * from (select rownum rn, tt.* from (select * from board where subject like ? order by ref desc, step asc)tt) where rn>=? and rn<=?";
//		} else if (searchOption == 2) {
//			sql = "select * from (select rownum rn, tt.* from (select * from board where id like ? order by ref desc, step asc)tt) where rn>=? and rn<=?";
//		}
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, "%" + keyword + "%");
//			pstmt.setInt(2, startNum);
//			pstmt.setInt(3, endNum);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				BoardDTO boardDTO = new BoardDTO();
//				boardDTO.setSeq(rs.getInt("seq"));
//				boardDTO.setId(rs.getString("id"));
//				boardDTO.setName(rs.getString("name"));
//				boardDTO.setEmail(rs.getNString("email"));
//				boardDTO.setSubject(rs.getString("subject"));
//				boardDTO.setContent(rs.getString("content"));
//				boardDTO.setRef(rs.getInt("ref"));
//				boardDTO.setLev(rs.getInt("lev"));
//				boardDTO.setStep(rs.getInt("step"));
//				boardDTO.setPseq(rs.getInt("pseq"));
//				boardDTO.setReply(rs.getInt("reply"));
//				boardDTO.setHit(rs.getInt("hit"));
//				boardDTO.setLogtime(rs.getDate("logtime"));
//
//				ar.add(boardDTO);
//			}
//		} catch (SQLException e) {
//			ar = null;
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		System.out.println(ar.size() + "개의 항목을 찾았습니다.");
//		return ar;
//	}
//
//	public int getTotalA(boolean search, int searchOption, String keyword) {
//		int totalA = 0;
//		String sql = "";
//		getConnection();
//		if (search && searchOption == 1) {
//			sql = "select count(*) as count from board where subject like ?";
//		} else if (search && searchOption == 2) {
//			sql = "select count(*) as count from board where id like ?";
//		}
//		try {
//			pstmt = conn.prepareStatement(sql);
//			if (search) {
//				pstmt.setString(1, "%" + keyword + "%");
//			}
//			rs = pstmt.executeQuery();
//			rs.next();
//			totalA = rs.getInt("count");
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return totalA;
//	}
}
