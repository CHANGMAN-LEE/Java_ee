<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
 
 <%
 //데이터
 //String id = request.getParameter("id");
 String id = (String)session.getAttribute("memId");
 //DB
 MemberDAO memberDAO = MemberDAO.getInstance();
 MemberDTO memberDTO = memberDAO.getMember(id);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">회원정보수정</h1>
	<form name=modifyForm method="post" action="modify.jsp">
		<table align="center" border="1" cellspacing="0" cellpadding="10"
			bordercolor="black" bgcolor="skyblue">
			<tr>
				<td width="70" align="center">이름</td>
				<td><input type="text" name="name" value="<%=memberDTO.getName()%>" placeholder="이름 입력">
				</td>
			</tr>

			<tr>
				<td align="center">아이디</td>
				<td>
				<input type="text" name="id" value="<%=memberDTO.getId()%>" readonly>
				</td>
			</tr>

			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>

			<tr>
				<td align="center">재확인</td>
				<td><input type="password" name="repwd"></td>
			</tr>

			<tr>
				<td align="center">성별</td>
				<td><input type="radio" name="gender" value="0">남자&emsp;
					<input type="radio" name="gender" value="1">여자</td>
			</tr>

			<tr>
				<td align="center">이메일</td>
				<td><input type="text" size="10" name="email1">@<input
					size="15" name="email2" list="defaultEmails"
					placeholder="ex) gmail.com"> <datalist id="defaultEmails">
						<option value="naver.com">
						<option value="gmail.com">
						<option value="daum.net">
					</datalist></td>
			</tr>

			<tr>
				<td align="center">핸드폰</td>
				<td><select name="tel1" style="width: 60px;">
						<option value="010">010</option>
						<option value="02">02</option>
						<option value="042">042</option>
						<option value="043">043</option>
				</select>-<input type="text" size="3" name="tel2">-<input type="text"
					size="3" name="tel3"></td>
			</tr>

			<tr>
				<td align="center">주소</td>
				<td>
				<input type="text" size="7" name="zipcode" id="zipcode" value="<%=memberDTO.getZipcode()%>"	readonly>
				<input type="button" value="우편번호검색" onclick="checkPost()"></br>
				<input type="text" name="addr1" id="addr1" size="55" value="<%=memberDTO.getAddr1()%>" placeholder="주소" readonly></br>
				<input type="text" name="addr2" id="addr2" size="55" value="<%=memberDTO.getAddr2()%>" placeholder="상세주소">
			</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="button" value="회원정보수정" onclick="checkModifyForm()">
				<input type="reset" value="다시작성"></td>
			</tr>
		</table>
		</form>
</body>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload=function(){
	document.modifyForm.gender['<%=memberDTO.getGender()%>'].checked = true;
	document.modifyForm.email1.value = '<%=memberDTO.getEmail1()%>';
	document.modifyForm.email2.value = '<%=memberDTO.getEmail2()%>';
	document.modifyForm.tel1.value = '<%=memberDTO.getTel1()%>';
	document.modifyForm.tel2.value = '<%=memberDTO.getTel2()%>';
	document.modifyForm.tel3.value = '<%=memberDTO.getTel3()%>';
}
</script>
</html>