<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta charset="UTF-8">
	<h1 align="center">회원정보수정</h1>
	<form name=modifyForm method="post" action="/miniProject/member/modify.do">
		<table align="center" border="1" cellspacing="0" cellpadding="10"
			bordercolor="black" bgcolor="">
			<tr>
				<td width="70" align="center">이름</td>
				<td><input type="text" name="name" value="${memberDTO.name }" placeholder="이름 입력">
				</td>
			</tr>

			<tr>
				<td align="center">아이디</td>
				<td>
				<input type="text" name="id" value="${memberDTO.id }" readonly>
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
				<td><input type="text" size="10" name="email1" value="${memberDTO.email1 }">@<input
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
				</select>-<input type="text" size="3" name="tel2" value="${memberDTO.tel2 }" >-<input type="text"
					size="3" name="tel3" value="${memberDTO.tel3 }"></td>
			</tr>

			<tr>
				<td align="center">주소</td>
				<td>
				<input type="text" size="7" name="zipcode" id="zipcode" value="${memberDTO.zipcode }" readonly>
				<input type="button" value="우편번호검색" onclick="checkPost()"></br>
				<input type="text" name="addr1" id="addr1" size="55" value="${memberDTO.addr1 }" placeholder="주소" readonly></br>
				<input type="text" name="addr2" id="addr2" size="55" value="${memberDTO.addr2 }" placeholder="상세주소">
			</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="button" value="회원정보수정" onclick="checkModifyForm()">
				<input type="reset" value="다시작성"></td>
			</tr>
		</table>
		</form>

<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload=function(){
	document.modifyForm.gender[${memberDTO.gender }].checked = true;
	document.modifyForm.email2.value = "${memberDTO.email2 }";
	document.modifyForm.tel1.value = "${memberDTO.tel1 }";
}
</script>