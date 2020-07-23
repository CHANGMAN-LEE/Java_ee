package board.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;
import board.bean.BoardDTO;
import board.bean.BoardPaging;

public class BoardSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 검색
		int searchOption = 0; // 검색 옵션 설정
		boolean search = false; // 사용자가 검색을 했는지 유무
		String keyword = request.getParameter("keyword");
		String option = request.getParameter("searchOption");
		if (keyword != null) { // 사용자가 검색을 했을 경우
			search = true;
			if (request.getParameter("searchOption") != null) {
				if (request.getParameter("searchOption").equals("제목")) {
					searchOption = 1;
				} else if (request.getParameter("searchOption").equals("작성자")) {
					searchOption = 2;
				}
			}
		} else {
			search = false;
		}
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat today = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat past = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		Date current = new Date();
		String currentTime = ft.format(current);
		int pg = request.getParameter("pg") == null ? 1 : (Integer.parseInt(request.getParameter("pg")));
		// db
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		BoardDAO boardDAO = BoardDAO.getInstance();
		int endNum = pg * 5;
		int startNum = endNum - 4;

		list = boardDAO.getBoardList(startNum, endNum, keyword, searchOption);

		// 페이징 처리 - 1페이지 당 2개의 방명록 처리
		int totalA = 0;
		BoardPaging boardPaging = new BoardPaging();
		totalA = boardDAO.getTotalA2(search, searchOption, keyword); // 총글수

		/*
		 * System.out.println(list.size()+"사이즈"+startNum+endNum);
		 * System.out.println(totalA+"개의 항목을 찾았습니다."); System.out.println(search);
		 * System.out.println(searchOption);
		 */
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		request.setAttribute("boardPaging", boardPaging);
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("memId");
		request.setAttribute("pg", pg);
		request.setAttribute("searchOption", option);
		request.setAttribute("list", list);
		request.setAttribute("ft", ft);
		request.setAttribute("today", today);
		request.setAttribute("past", past);
		request.setAttribute("display", "/board/boardList.jsp");
		return "/main/index.jsp";
	}

}