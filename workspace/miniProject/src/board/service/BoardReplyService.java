package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardReplyService implements CommandProcess {

	@Override
	   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	      int pseq=Integer.parseInt(request.getParameter("pseq"));
	      int pg=Integer.parseInt(request.getParameter("pg"));
	      String subject = request.getParameter("subject");
	      String content = request.getParameter("content");
	      
	      HttpSession session = request.getSession();
	      String id=(String)session.getAttribute("memId");
	      String name=(String)session.getAttribute("memName");
	      String email=(String)session.getAttribute("memEmail")+"@"+(String)session.getAttribute("memEmail2");
	      
	      Map<String, String>map = new HashMap<String,String>();
	      map.put("id",id);
	      map.put("name",name);
	      map.put("email",email);
	      map.put("subject",subject);
	      map.put("content",content);
	      map.put("pseq", pseq+"");
	      
	      //유
	      BoardDAO boardDAO = BoardDAO.getInstance();
	      boardDAO.boardReply(map);
	      
	      request.setAttribute("pg",pg);
	      request.setAttribute("display", "/board/boardReply.jsp");
	      return "/main/index.jsp";
	   }

}












