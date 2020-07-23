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
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		HttpSession session = request.getSession();
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String id = (String)session.getAttribute("memId");
//		int count = (int)session.getAttribute("boardInsert");
		Cookie[] ar = request.getCookies();
		String cookieName = null;
		String cookieValue = null;
		if(ar != null){
			for(int i=0; i<ar.length; i++){
				cookieName = ar[i].getName(); //쿠키명
				cookieValue = ar[i].getValue(); //값
				break;
			}
		}

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
//		if(count==1){
//			if(id.equals(boardDTO.getId())) {
//				//로그인ID와 작성자ID가 같으면 조회수가 올라가지 않는다.
//				session.setAttribute("boardInsert", 1);
//			}else {
//				//로그인ID와 작성자ID가 다를경우에만 조회수 UP!!
//				session.setAttribute("boardInsert", 0);
//				boardDAO.countHit(seq);
//			}
//		}
		
		if(cookieValue.equals("1")){
			if(id.equals(boardDTO.getId())) {
				//로그인ID와 작성자ID가 같으면 조회수가 올라가지 않는다.
				Cookie cookie = new Cookie("boardInsert", "1");
				cookie.setMaxAge(30*60);
				response.addCookie(cookie);
			}else {
				//로그인ID와 작성자ID가 다를경우에만 조회수 UP!!
				Cookie cookie = new Cookie("boardInsert", "0");
				cookie.setMaxAge(30*60);
				response.addCookie(cookie);
				boardDAO.countHit(seq);
			}
		}
		
		//응답
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		
		request.setAttribute("display", "/board/boardView.jsp");
		return "/main/index.jsp";
	}
}












