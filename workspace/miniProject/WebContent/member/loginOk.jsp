<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<strong><%-- ${sessionScope.memName } --%> ${memName }님 로그인</strong>
<br><br>
<input type="button" value="로그아웃" onclick="location.href='/miniProject/member/logout.do'"> &emsp;
<input type="button" value="회원정보수정" onclick="location.href='/miniProject/member/modifyForm.do'"> &emsp;
<input type="button" value="처음화면" onclick="location.href='/miniProject/main/index.do'">