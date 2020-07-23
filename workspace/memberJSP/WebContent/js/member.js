/**
 * 
 */
function checkWriteForm() {
	// if (document.writeForm.name.value == "") {
	if (document.getElementById("name").value == "") {
		alert("이름을 입력하세요.");
		document.writeForm.name.focus();
	} else if (document.writeForm.id.value == "") {
		alert("아이디를 입력하세요.");
	} else if (document.writeForm.pwd.value == ""
			|| document.writeForm.repwd.value == "") {
		alert("비밀번호를 입력해주세요.");
	} else if (document.writeForm.pwd.value != document.writeForm.repwd.value) {
		alert("입력하신 비밀번호가 일치하지 않습니다.");
	} else if (document.writeForm.id.value != document.writeForm.check.value) {
		alert("아이디 중복체크를 해주세요.");
	}else if (document.writeForm.name.value != ""
			&& document.writeForm.id.value != ""
			&& document.writeForm.pwd.value == document.writeForm.repwd.value
			&& document.writeForm.id.value == document.writeForm.check.value) {
		document.writeForm.submit();
	}
}

function checkLoginForm() {
	if (document.loginForm.id.value == "") {
		alert("아이디을 입력하세요.");
		document.loginForm.id.focus();
	} else if (document.loginForm.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.loginForm.pwd.focus();
	} else if (document.loginForm.id.value != ""
			&& document.loginForm.pwd.value != "") {
		document.loginForm.submit();
	}
}

function checkId() {
	let id = document.writeForm.id.value;
	if (id == "") {
		alert("아이디를 입력해주세요.");
	} else {
		window.open("checkId.jsp?id="+id, "", "width=300 height=100");
	}

}

function checkIdClose(id){
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}


function checkPost(){
	window.open("checkPost.jsp", "", "width=500 height=500 scrollbars=yes");
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