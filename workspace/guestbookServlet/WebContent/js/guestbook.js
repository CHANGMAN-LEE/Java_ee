/**
 * 
 */
function checkbookWriteForm() {
	if (document.guestbookWriteForm.title.value == "") {
		alert("제목을 입력하세요.");
		document.guestbookWriteForm.title.focus();
	} else if (document.guestbookWriteForm.content.value == "") {
		alert("내용을 입력해주세요.");
	} else if (document.guestbookWriteForm.title.value != ""
			&& document.guestbookWriteForm.content.value != "") {
		document.guestbookWriteForm.submit();
	}
}