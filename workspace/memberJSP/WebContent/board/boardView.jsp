<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
    
<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));
String id = (String)session.getAttribute("memId");

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
<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" width="400" style="table-layout: fixed;" align=center>
<tr>
<th colspan="3"><%=boardDTO.getSubject()%></th>
</tr>

<tr>
<td width="150">글번호 : <%=boardDTO.getSeq()%></td>
<td width="150">작성자 : <%=boardDTO.getName()%></td>
<td width="150">조회수 : <%=boardDTO.getHit()%></td>
</tr>

<tr>
<td  colspan="3" valign=top height="150"><pre style="white-space:pre-wrap; font-family:고딕체; height:200px; overflow:scroll;"><%=boardDTO.getContent()%></pre></td>
</tr>
<tr>
<td align=center colspan="3">
<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg%>'">
<%if(id.equals(boardDTO.getId())){%>
<input type="button" value="글수정" onclick="location.href='boardModifyForm.jsp?pg=<%=pg%>&seq=<%=seq%>'">
<input type="button" value="글삭제" onclick="">
<%}%>
</td>
</tr>
</table>
</body>
</html>