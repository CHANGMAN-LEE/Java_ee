package member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<MemberDTO> list = new ArrayList<MemberDTO>();
	private MemberDTO memberDTO;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post 방식
		request.setCharacterEncoding("UTF-8");

		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// DB
		int check = 0;
		String name = "";
		MemberDAO memberDAO = MemberDAO.getInstance();
		list = memberDAO.readMember();
		for (MemberDTO memberDTO : list) {
			if (id.equals(memberDTO.getId())) {
				if (pwd.equals(memberDTO.getPwd())) {
					check = 1;
					name = memberDTO.getName();
					break;
				} else if (!(pwd.equals(memberDTO.getPwd()))) {
					check = 2;
					break;
				}
			}
			if (!(id.equals(memberDTO.getId()))) {
				check = 3;
			}
		}

		// 응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>로그인</title>");
		out.println("<body>");

		if (check == 1) {
			out.println("로그인 성공<br></br>");
			out.println(name + "님이 로그인하였습니다.");
		} else if (check == 2) {
			out.println("로그인 실패<br></br>");
			out.println("비밀번호가 틀렸습니다.<br></br>");
			out.println("<input type = button value=뒤로 onclick = javascript:history.go(-1)>");
		} else if (check == 3) {
			out.println("로그인 실패<br></br>");
			out.println("존재하지 않는 회원입니다.<br></br>");
			out.println("<input type = button value=뒤로 onclick = javascript:history.go(-1)>");
		}

		out.println("</body>");
		out.println("</html>");
	}

}
