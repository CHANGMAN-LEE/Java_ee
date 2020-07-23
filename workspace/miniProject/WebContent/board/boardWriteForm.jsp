<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name=boardWriteForm method="post" action="/miniProject/board/boardWrite.do">
<h3>*** 글쓰기 ***</h3>
<table align="center" border="1" cellspacing="0" cellpadding="3">

<tr>
<td align="center"><font color="red">*</font>제목</td>
<td>
<input type="text" name="subject" id="subject" style="width: 370px;" placeholder="제목 입력">
</td>
</tr>

<tr>
<td align="center"><font color="red">*</font>내용</td>
<td>
<textarea name="content" id="content" rows="8" cols="50" placeholder="내용을 입력하세요"></textarea>
</td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="button" value="글작성" onclick="checkBoardWriteForm()"> &emsp;
<input type="reset" value="다시작성">
</td>
</tr>

</table>
</form>

</body>
<script type="text/javascript">
function checkBoardWriteForm(){
	if(document.getElementById("subject").value == ""){
		alert("제목을 입력하세요");
	}else if(document.getElementById("content").value == ""){
		alert("내용을 입력하세요");
	}else {
		document.boardWriteForm.submit();
	}
}
</script>