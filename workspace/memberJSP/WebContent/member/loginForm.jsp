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
<form name="loginForm" method="post" action="login.jsp">
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
<input type="button" value="로그인" onclick="checkLoginForm()"> &emsp;
<input type="button" value="회원가입" onclick="javascript:location.href='http://localhost:8080/memberJSP/member/writeForm.jsp'"></td>
</tr>

</table>
</form>
</body>
<script type="text/javascript" src="../js/member.js?ver=2"></script>
</html>