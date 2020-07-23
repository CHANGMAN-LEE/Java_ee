<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" dataSource="jdbc/oracle">
	select * from usertable
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">** 여기는 목록!! **</h3>
<table border="1" align="center">
	<tr>
		<c:forEach var="colName" items="${rs.columnNames }">
			<th>${colName }</th>
		</c:forEach>
		<th width="150">비고</th>
	</tr>
	<c:forEach var="row" items="${rs.rowsByIndex }"> <!-- 행!! (1행 전체를 보내준다.)( -->
		<tr>
			<c:forEach var="col" items="${row }"> <!-- 열!! (받은 행 전체 중에서 1열을 뽑는다.) -->
				<td width="100" align="center">${col }</td>
			</c:forEach>
			<td align="center">
				<input type="button" value="수정" onclick="location.href='../jstl/jstlModifyForm.jsp?id=${row[1]}'">
				<input type="button" value="삭제" onclick="location.href='../jstl/jstlDelete.jsp?id=${row[1]}'">
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>