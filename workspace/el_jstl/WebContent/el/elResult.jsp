<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="70%" align="center">
	<tr>
		<td align="center">x + y</td>
		<td align="center"><%=x+y %></td>
	</tr>
	
	<tr>
		<td align="center">\${param['x'] } + \${param['y'] } = \${param['x'] + param['y'] }</td>
		<td align="center">${param['x'] } + ${param['y'] } = ${param['x'] + param['y'] }</td>
	</tr>
	
	<tr>
		<td align="center">x - y</td>
		<td align="center"><%=x-y %></td>
	</tr>
	
	<tr>
		<td align="center">\${param['x'] } - \${param['y'] } = \${param['x'] - param['y'] }</td>
		<td align="center">${param['x'] } - ${param['y'] } = ${param['x'] - param['y'] }</td>
	</tr>
	
	<tr>
		<td align="center">x * y</td>
		<td align="center"><%=x*y %></td>
	</tr>
	
	<tr>
		<td align="center">\${param.x } * \${param.y } = \${param.x * param.y }</td>
		<td align="center">${param.x } * ${param.y } = ${param.x * param.y }</td>
	</tr>
	
	<tr>
		<td align="center">x / y</td>
		<td align="center"><%=x/y %></td>
	</tr>
	
	<tr>
		<td align="center">\${param.x } / \${param.y } = \${param.x / param.y }</td>
		<td align="center">${param.x } / ${param.y } = ${param.x / param.y }</td>
	</tr>
</table>
</body>
</html>