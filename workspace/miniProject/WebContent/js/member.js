/**
 * 
 */
/*function checkWriteForm() {*/
$('#checkWriteForm').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	// if (document.writeForm.name.value == "") {
	//if (document.getElementById("name").value == "") {
	if ($('#name').val() == '') {
		//alert("이름을 입력하세요.");
		$('#nameDiv').text('이름을 입력하세요.');
		$('#nameDiv').css('color', 'red');
		$('#nameDiv').css('font-size', '8pt');
		$('#nameDiv').css('font-weight', 'bold');
		$('#nameDiv').focus();
		//document.writeForm.name.focus();
	//} else if (document.writeForm.id.value == "") {
	} else if ($('#id').val() == '') {
		//alert("아이디를 입력하세요.");
		$('#idDiv').text('아이디를 입력하세요.');
		$('#idDiv').css('color', 'red');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
		$('#idDiv').focus();
	/*} else if (document.writeForm.pwd.value == "" || document.writeForm.repwd.value == "") {*/
	} else if ($('#pwd').val() == '') {
		//alert("비밀번호를 입력해주세요.");
		$('#pwdDiv').text('비밀번호를 입력하세요.');
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwdDiv').css('font-weight', 'bold');
		$('#pwdDiv').focus();
	//} else if (document.writeForm.pwd.value != document.writeForm.repwd.value) {
	} else if ($('#pwd').val() != $('#repwd').val()) {
		//alert("입력하신 비밀번호가 일치하지 않습니다.");
		$('#repwdDiv').text('입력하신 비밀번호가 일치하지 않습니다.');
		$('#repwdDiv').css('color', 'red');
		$('#repwdDiv').css('font-size', '8pt');
		$('#repwdDiv').css('font-weight', 'bold');
		$('#repwdDiv').focus();
	//} else if (document.writeForm.id.value != document.writeForm.check.value) {
	} else if ($('#check').val() != $('#id').val()) {
		//alert("아이디 중복체크를 해주세요.");
		$('#idDiv').text('아이디 중복체크를 해주세요.');
		$('#idDiv').css('color', 'magenta');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
		$('#idDiv').focus();
	}else if (document.writeForm.name.value != ""
			&& document.writeForm.id.value != ""
			&& document.writeForm.pwd.value == document.writeForm.repwd.value
			&& document.writeForm.id.value == document.writeForm.check.value) {
		//document.writeForm.submit();
		$('form[name=writeForm]').submit();
	}
});

$('#checkLoginForm').click(function(){
	$('div[class=idDiv]').empty();
	$('div[class=pwdDiv]').empty();
	//if (document.loginForm.id.value == "") {
	if ($('input[class=id]').val() == '') {
		//alert("아이디을 입력하세요.");
		//document.loginForm.id.focus();
		$('div[class=idDiv]').text('아이디를 입력하세요.');
		$('div[class=idDiv]').css('color', 'red');
		$('div[class=idDiv]').css('font-size', '8pt');
		$('div[class=idDiv]').css('font-weight', 'bold');
		$('input[class=id]').focus();
	} else if ($('input[class=pwd]').val() == '') {
		//alert("비밀번호를 입력해주세요.");
		//document.loginForm.pwd.focus();
		$('div[class=pwdDiv]').text('비밀번호를 입력하세요')
        $('div[class=pwdDiv]').css('color', 'red')
        $('div[class=pwdDiv]').css('font-size', '8pt')
        $('div[class=pwdDiv]').css('font-weight', 'bold')
        $('input[class=pwd]').focus();
	} else if (document.loginForm.id.value != ""
			&& document.loginForm.pwd.value != "") {
		document.loginForm.submit();
	}
});

//function checkId() {
$('#id').focusout(function() {
	//let id = document.writeForm.id.value;
	let id = $('#id').val();
	console.log(id);
	if (id == "") {
		//alert("아이디를 입력해주세요.");
		$('#idDiv').text('먼저 아이디를 입력하세요.');
		$('#idDiv').css('color', 'magenta');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
		$('#id').focus();
	} else {
		console.log("ㅎㅇ");
		window.open("/miniProject/member/checkId.do?id="+id,"","width=300 height=100");
	}

});

function checkIdClose(id){
	opener.document.writeForm.id.value = id;
	opener.document.writeForm.check.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}


function checkPost(){
	window.open("checkPost.do", "", "width=500 height=500 scrollbars=yes");
}

function checkPostClose(zipcode, address) {
	opener.document.getElementById("zipcode").value = zipcode;
	opener.document.getElementById("addr1").value = address;
	window.close();
	opener.document.getElementById("addr2").addr2.focus();
}

function checkModifyForm() {
	// if (document.writeForm.name.value == "") {
	if (document.modifyForm.name.value == "") {
		alert("이름을 입력하세요.");
		document.modifyFrom.name.focus();
	}else if (document.modifyForm.pwd.value == ""
			|| document.modifyForm.repwd.value == "") {
		alert("비밀번호를 입력해주세요.");
	} else if (document.modifyForm.pwd.value != document.modifyForm.repwd.value) {
		alert("입력하신 비밀번호가 일치하지 않습니다.");
	}else{
		document.modifyForm.submit();
	}
}