<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form method="post" action="/mvcMember/member/checkPost.do">
<table width="100%" align="center" border="1" cellspacing="0" cellpadding="3" bordercolor="black">
	<tr>
		<th>시도</th>
		<td align="center">
			<select name="sido" style="width:100px;">
				<option>시도선택</option>
				<option>서울</option>
				<option>인천</option>
				<option>대전</option>
				<option>대구</option>
				<option>울산</option>
				<option>세종</option>
				<option>광주</option>
				<option>경기</option>
				<option>강원</option>
				<option>전남</option>
				<option>전북</option>
				<option>경남</option>
				<option>경북</option>
				<option>충남</option>
				<option>충북</option>
				<option>부산</option>
				<option>제주</option>
			</select>
		</td>
		<th>시.군.구</th>
		<td align="center"><input type="text" name="sigungu" size="30"></td>
	</tr>

	<tr>
		<th>도로명</th>
		<td colspan='3'>
			<input type="text" name="roadname" size="35">
			<input type="submit" value="검색">
		</td>
	</tr>

	<tr>
		<th>우편번호</th>
		<th colspan='3'>주소</th>
	</tr>
	
	<c:forEach var="ziplist" items="${ziplist }">
		<tr>
			<td align="center">${ziplist[0] }</td>
			<td colspan="3">
				<a id="addressA" href="#" onclick="checkPostClose('${ziplist[0] }', '${ziplist[1] }')">
					${ziplist[1] }
				</a>
			</td>
		</tr>
	</c:forEach>
</table>
</form>
</body>
<script type="text/javascript" src="../js/member.js?ver=2"></script>
</html>