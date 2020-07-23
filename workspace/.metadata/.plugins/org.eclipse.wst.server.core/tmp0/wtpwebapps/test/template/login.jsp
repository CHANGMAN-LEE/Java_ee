<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1 align="center">로그인</h1>
<form name="loginForm" method="post" action="/miniProject/member/login.do">
<table align="center" border="1" bordercolor="black" bgcolor="">

	<tr>
		<td width="70" align="center">아이디</td>
		<td>
			<input type="text" name="id" class="id">
			<div class="idDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td align="center">비밀번호</td>
		<td>
			<input type="password" name="pwd" class="pwd">
			<div class="pwdDiv"></div>
		</td>
	</tr>

	<tr>
		<td colspan="2" align="center">
			<input type="button" id="checkLoginForm" value="로그인">
			<div class="loginDiv"></div>
		</td>
	</tr>

</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#checkLoginForm').click(function(){
		$('div[class=idDiv]').empty();
		$('div[class=pwdDiv]').empty();
		$('div[class=loginDiv]').empty();
		
		if ($('input[class=id]').val() == '') {
			$('div[class=idDiv]').text('아이디를 입력하세요.');
			$('div[class=idDiv]').css('color', 'red');
			$('div[class=idDiv]').css('font-size', '8pt');
			$('div[class=idDiv]').css('font-weight', 'bold');
			$('input[class=id]').focus();
		} else if ($('input[class=pwd]').val() == '') {
			$('div[class=pwdDiv]').text('비밀번호를 입력하세요')
	        $('div[class=pwdDiv]').css('color', 'red')
	        $('div[class=pwdDiv]').css('font-size', '8pt')
	        $('div[class=pwdDiv]').css('font-weight', 'bold')
	        $('input[class=pwd]').focus();
		} else if ($('input[class=id]').val() == 'test' && $('input[class=pwd]').val() == '1111') {
			$('div[class=loginDiv]').text('로그인 성공')
	        $('div[class=loginDiv]').css('color', 'blue')
	        $('div[class=loginDiv]').css('font-size', '8pt')
	        $('div[class=loginDiv]').css('font-weight', 'bold')
		} else if ($('input[class=id]').val() != 'test' || $('input[class=pwd]').val() != '1111') {
			$('div[class=loginDiv]').text('로그인 실패')
	        $('div[class=loginDiv]').css('color', 'red')
	        $('div[class=loginDiv]').css('font-size', '8pt')
	        $('div[class=loginDiv]').css('font-weight', 'bold')
		}
	});
});
</script>