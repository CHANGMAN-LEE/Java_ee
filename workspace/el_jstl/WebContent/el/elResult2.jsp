<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="angel" uri="tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">자바클래스의 메소드를 이용하여 계산</h3>
<table border="1" width="50%" align="center">
	<tr>
		<td align="center">x + y</td>
		<td align="center">${param.x } + ${param.y } = ${angel:sum(param.x, param.y) }</td>
	</tr>
	
	<tr>
		<td align="center">x * y</td>
		<td align="center">${param.x } * ${param.y } = ${angel:mul(param.x, param.y) }</td>
	</tr>
</table>
</body>
</html>