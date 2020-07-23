package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardModifyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String subject = request.getParameter("subject");
		String content  = request.getParameter("content");
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardModify(seq, subject, content);
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardModify.jsp");
		return "/main/index.jsp";
	}

}









