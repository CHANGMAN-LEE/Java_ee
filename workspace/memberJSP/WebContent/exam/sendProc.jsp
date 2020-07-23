<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("apple", "사과");
request.setAttribute("apple2", "사과2");

//페이지 이동
response.sendRedirect("sendResult.jsp?apple=");
%>