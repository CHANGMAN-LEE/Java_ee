<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String apple = (String)request.getAttribute("apple");
String apple2 = request.getParameter("apple2");
%>

결과 = <%=apple%>
<br>
결과 = <%=apple2%>
<br>
<input type="button" value="처음으로" onclick="location.href='start.jsp'">