<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">로그인</h1>
<form name="loginForm" method="post" action="/mvcMember/member/login.do">
<table align="center" border="1" bordercolor="black" bgcolor="skyblue">

<tr>
<td width="70" align="center">아이디</td>
<td><input type="text" name="id" id="id"></td>
</tr>

<tr>
<td align="center">비밀번호</td>
<td><input type="password" name="pwd"></td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="submit" value="로그인"> &emsp;
<input type="button" value="회원가입" onclick="location.href='/mvcMember/member/writeForm.do'"></td>
</tr>

</table>
</form>
</body>
</html>