package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

//@WebServlet("/GuestbookWriteServlet")
public class GuestbookWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post 방식
		request.setCharacterEncoding("UTF-8");

		// 데이터
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String page = request.getParameter("page");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		GuestbookDTO guestbookDTO = new GuestbookDTO();
		GuestbookDAO guestbookDAO = new GuestbookDAO();
		guestbookDTO.setSeq(guestbookDAO.getSeq());
		guestbookDTO.setName(name);
		guestbookDTO.setEmail(email);
		guestbookDTO.setPage(page);
		guestbookDTO.setTitle(title);
		guestbookDTO.setContent(content);

		// DB
		guestbookDAO = GuestbookDAO.getInstance();
		int su = guestbookDAO.writeGuestbook(guestbookDTO);

		// 응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>회원가입</title>");
		out.println("<body>");

		String result = su == 1 ? "저장 성공<br></br>" : "저장 실패<br></br>";

		out.println(result);

		out.println("<input type=button value=글목록 onclick=javascript:location.href='http://localhost:8080/guestbookServlet/GuestbookListServlet?pg=1'>");

		out.println("</body>");
		out.println("</html>");
	}

}
