<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
<%
String id = request.getParameter("id");
MemberDAO memberDAO = MemberDAO.getInstance();
boolean exist = memberDAO.isExistID(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="checkId.jsp">

<%if (exist == true) {%>
<%=id%>는 사용 불가능
<br><br>
아이디 <input type="text" name="id">
<input type="submit"value="검색">
<%} else if (exist == false) {%>
<%=id%>는 사용 가능 
<br><br>
<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')">
<%}%>

</form>
</body>
<script type="text/javascript" src="../js/member.js"></script>
</html>