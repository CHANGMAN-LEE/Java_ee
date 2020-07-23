<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table width="100%">
	<tr>
		<td align="right">
			<c:if test="${memId == null}">
				<a href="../member/loginForm.do"><font size="4"><strong>로그인</strong></font></a>&nbsp;
				<a href="../member/writeForm.do"><font size="4"><strong>회원가입</strong></font></a>&nbsp;
			</c:if>
			
			<c:if test="${memId != null}">
				<a href="../member/logout.do"><font size="4"><strong>로그아웃</strong></font></a>&nbsp;
				<a href="../member/modifyForm.do"><font size="4"><strong>회원정보수정</strong></font></a>&nbsp;
				<a href="../board/boardWriteForm.do"><font size="4"><strong>글쓰기</strong></font></a>&nbsp;
				<c:if test="${memId == 'admin'}">
					<a href="../imageboard/imageboardWriteForm.do"><font size="4"><strong>이미지등록</strong></font></a>&nbsp;
				</c:if>
			</c:if>
			
			<a href="../board/boardList.do?pg=1"><font size="4"><strong>목록</strong></font></a>&nbsp;
			<a href="../imageboard/imageboardList.do?pg=1"><font size="4"><strong>이미지목록</strong></font></a><br>
		</td>
	</tr>
</table>

<h1><img width="100" height="100" src="../image/image_IU3.jpg" onclick="location.href='/miniProject/main/index.do'" style="cursor: pointer;">
MVC기반의 미니 프로젝트</h1>