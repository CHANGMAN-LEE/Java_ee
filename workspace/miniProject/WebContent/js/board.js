/**
 * 
 */
function checkBoardReplyForm(){    
	if(document.boardReplyForm.subject.value == ""){
        alert("제목을 입력하세요.");
        document.boardReplyForm.subject.focus();
    } else if(document.boardReplyForm.content.value == "") {
    	alert("내용을 입력하세요.");
    	document.boardReplyForm.content.focus();
    } else  {
    	document.boardReplyForm.submit();
    } 
}