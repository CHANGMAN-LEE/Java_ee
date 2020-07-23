<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO boardDTO = boardDAO.boardView(seq);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardModifyForm" method="post" action="boardModify.jsp">
<input type="hidden" name="seq" value="<%=seq%>">
<input type="hidden" name="pg" value="<%=pg%>">
<table align="left" border="1" cellspacing="0" cellpadding="3">

<tr>
<td align="center"><font color="red">*</font>제목</td>
<td>
<input type="text" name="subject" id="subject" style="width: 370px;" placeholder="제목 입력" value="<%=boardDTO.getSubject()%>">
</td>
</tr>

<tr>
<td align="center"><font color="red">*</font>내용</td>
<td>
<textarea name="content" id="content" rows="8" cols="50" placeholder="내용을 입력하세요"><%=boardDTO.getContent()%></textarea>
</td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="button" value="수정완료" onclick="checkBoardModifyForm()">
</td>
</tr>

</table>
</form>
</body>
<script type="text/javascript">
function checkBoardModifyForm() {
	if(document.getElementById("subject").value == "")
		alert("제목을 입력하세요");
	else if(document.getElementById("content").value == "")
		alert("내용을 입력하세요");
	else
		document.boardModifyForm.submit();
}
</script>
</html>