<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%
//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
//DB
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.loginMember(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(memberDTO.getName()==null){
	response.sendRedirect("loginFail.jsp");
}else{
	//쿠키 생성
//	Cookie cookie = new Cookie("memName", name);
//	cookie.setMaxAge(30*60);
//	response.addCookie(cookie);
	
//	Cookie cookie2 = new Cookie("memId", id);
//	cookie2.setMaxAge(30*60);
//	response.addCookie(cookie2);
	
	//세션 생성
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id);
	session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
	
	
	//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name, "UTF-8")+"&id="+id);
	response.sendRedirect("loginOk.jsp");
}%>
</body>
</html>