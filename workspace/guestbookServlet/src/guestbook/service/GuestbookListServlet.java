package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

//@WebServlet("/GuestbookListServlet")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
	private GuestbookDTO guestbookDTO;
	private String name;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post 방식
		request.setCharacterEncoding("UTF-8");

		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));

		// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();

		// 페이징처리 -> 1페이지당 2개씩!!
		int endNum = pg * 2;
		int startNum = endNum - 1;
		list = guestbookDAO.readGuestbook(startNum, endNum);

		// 총글수
		int totalA = guestbookDAO.getTotalA();
		int totalP = (totalA + 1) / 2;

		// 응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>회원가입</title>");
		out.println("<style>");
		out.println("#currentPaging {color:red; text-decoration:underline;}");
		out.println("#paging {color:black; text-decoration:none;}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");

		if (list != null) {
			out.println("<p align=center>");
			for (int i = 1; i <= totalP; i++) {
				if(i == pg)
					out.println("<a id=currentPaging href='/guestbookServlet/GuestbookListServlet?pg=" + i + "'>[" + i + "]</a>");
				else	
					out.println("<a id=paging href='/guestbookServlet/GuestbookListServlet?pg=" + i + "'>[" + i + "]</a>");
			}
			out.println("<br><input type=button value=글작성 onclick=javascript:location.href='http://localhost:8080/guestbookServlet/guestbook/guestbookWriteForm.html'>");
			out.println("</p>");
			for (GuestbookDTO guestbookDTO : list) {
				out.println("<table align=center border=1 width=500>");
				out.println("<tr>");
				out.println("<td width='100' align=center>");
				out.println("작성자");
				out.println("</td>");
				out.println("<td width='150' align=center>");
				out.println(guestbookDTO.getName());
				out.println("</td>");
				out.println("<td width='100' align=center>");
				out.println("작성일");
				out.println("</td>");
				out.println("<td width='150' align=center>");
				out.println(guestbookDTO.getDate().substring(0, 10));
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=center>");
				out.println("이메일");
				out.println("</td>");
				out.println("<td colspan='3' align=center>"); // colspan=3은 1개의 칸을 3개의 칸으로 묶어주세요~
				out.println(guestbookDTO.getEmail());
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=center>");
				out.println("홈페이지");
				out.println("</td>");
				out.println("<td colspan='3' align=center>");
				out.println(guestbookDTO.getPage());
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=center>");
				out.println("제목");
				out.println("</td>");
				out.println("<td colspan='3' align=center>");
				out.println(guestbookDTO.getTitle());
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td valign=top colspan='4' width='150' height='150'><pre style='white-space:break-spaces; font-family:고딕체; color:blue; font-size:20;'>");
				out.println(guestbookDTO.getContent());
//				out.println("<td valign=top colspan='4' height='150' style='word-break:break-all'>");
//				out.println(guestbookDTO.getContent().replace("\r\n", "<br>").replace(" ", "&nbsp"));
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("<hr width=500 color=red>");
			}
		}

		out.println("</body>");
		out.println("</html>");
	}

}
