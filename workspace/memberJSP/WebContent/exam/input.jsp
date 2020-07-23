<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IMPUT</title>
</head>
<body>
<form name="input" method="post" action="sum.jsp">
<table align="center" border="1" bordercolor="black" bgcolor="skyblue">

<tr>
<td width="70" align="center">X</td>
<td><input type="text" name="x" id="x"></td>
</tr>

<tr>
<td align="center">Y</td>
<td><input type="text" name="y"></td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="submit" value="합구하기"> &emsp;
<input type="reset" value="취소">
</td>
</tr>
</table>
</body>
</html>