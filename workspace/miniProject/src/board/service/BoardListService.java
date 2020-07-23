package board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
				int pg = Integer.parseInt(request.getParameter("pg"));
				
				//DB
				BoardDAO boardDAO = BoardDAO.getInstance();

				int endNum = pg * 10;
				int startNum = endNum - 9;
				List<BoardDTO> list = boardDAO.readBoardList(startNum, endNum);
				
//				//오늘날짜는 시:분:초 표시, 나머지는 년.월.일로 표시
//				SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");		
//				SimpleDateFormat today = new SimpleDateFormat("HH:mm:ss");		
//				SimpleDateFormat past = new SimpleDateFormat("yyyy.MM.dd");		
//				Date current= new Date();
//				String currentTime = ft.format(current);
//				request.setAttribute("ft",ft);
//				request.setAttribute("today", today);
//				request.setAttribute("past",past);
//				request.setAttribute("currentTime", currentTime);
				
				//페이징 처리 - 1페이지 당 2개의 방명록 처리
				BoardPaging boardPaging = new BoardPaging();
				int totalA = boardDAO.getTotalA(); // 총글수
				boardPaging.setCurrentPage(pg);
				boardPaging.setPageBlock(5);
				boardPaging.setPageSize(10);
				boardPaging.setTotalA(totalA);
				boardPaging.makePagingHTML();
				request.setAttribute("boardPaging",boardPaging);
				response.setContentType("text/html;charset=UTF-8");
				
				//세션생성
//				HttpSession session = request.getSession();
//				session.setAttribute("boardInsert", 1);
				
				//쿠키생성
				Cookie cookie = new Cookie("boardInsert", "1");
				cookie.setMaxAge(30*60);
				response.addCookie(cookie);
				
				//응답
//				request.setAttribute("", new SimpleDateFormat());
				request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				request.setAttribute("pg", pg);
				request.setAttribute("list", list);
				
				request.setAttribute("display", "/board/boardList.jsp");
				return "/main/index.jsp";
	}
}












