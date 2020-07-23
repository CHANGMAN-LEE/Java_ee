<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("apple", "사과");

//페이지 이동
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");//상대번지 입력ㄴ
dispatcher.forward(request, response);//제어권 상속
%>
<%-- <jsp:forward page="forwardResult.jsp"/> --%>