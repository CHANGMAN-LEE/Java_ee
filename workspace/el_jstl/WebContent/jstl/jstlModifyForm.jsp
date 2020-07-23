<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" dataSource="jdbc/oracle">
	select * from usertable where id='${param.id }'
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="jstlModify.jsp">
<table border="1" align="center">
	<tr>
		<td width="70" align="center">이름</td>
		<td>
			<input type="text" name="name" id="name" placeholder="이름 입력" value="${rs.rowsByIndex[0][0] }">
		</td>
	</tr>
	
	<tr>
		<td width="100" align="center">아이디</td>
		<td>
			<input type="text" name="id" placeholder="아이디 입력" value="${rs.rowsByIndex[0][1] }" readonly="readonly">
		</td>
	</tr>
	
	<tr>
		<td width="100" align="center">비밀번호</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	
	<tr>
		<td align="center" colspan="2">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='../jstl/jstlList.jsp'">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>