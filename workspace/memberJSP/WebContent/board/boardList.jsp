<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
    
<%
//데이터
List<BoardDTO> list = new ArrayList<BoardDTO>();
int pg = Integer.parseInt(request.getParameter("pg"));
String id = (String)session.getAttribute("memId");

//DB
BoardDAO boardDAO = BoardDAO.getInstance();

//페이징처리 -> 1페이지당 2개씩!!
int endNum = pg * 5;
int startNum = endNum - 4;
list = boardDAO.readBoardList(startNum, endNum);

//총글수
int totalA = boardDAO.getTotalA();
int totalP = (totalA + 1) / 4;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color: black; text-decoration: none;}
.subjectA:hover {color: green; text-decoration: underline;}
.subjectA:active {color: red; text-decoration: none;}
</style>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" align=center>

<tr>
<td width='100' align=center>글번호</td>

<td width='300' align=center>제목</td>

<td width='100' align=center>작성자</td>

<td width='100' align=center>작성일</td>

<td width='100' align=center>조회수</td>
</tr>


<%if (list != null) {%>
	<p align=center>
	<%for(int i = 1; i <= totalP; i++){%>
		<%if(i == pg){%>
			<a id=currentPaging href="http://localhost:8080/memberJSP/board/boardList.jsp?pg=<%=i%>"><%=i%></a>
		<%}else{%>
			<a id=paging href="http://localhost:8080/memberJSP/board/boardList.jsp?pg=<%=i%>"><%=i%></a>
		<%}%>
	<%}%>
	<%if (id == null) {%>
		<br><input type=button value=로그인 onclick="javascript:location.href='http://localhost:8080/memberJSP/member/loginForm.jsp'"> &emsp;
	<%}else{%>
		<br><input type=button value=로그아웃 onclick="javascript:location.href='http://localhost:8080/memberJSP/member/logout.jsp'"> &emsp;
	<%}%>
	<input type=button value=글작성 onclick="">
	</p>
	<%for(BoardDTO boardDTO : list){%>
		<tr>
			<td align=center><%=boardDTO.getRef()%></td>
			<td align=left><a class="subjectA" href="#" onclick="islogin('<%=id%>', <%=boardDTO.getSeq()%>, <%=pg%>)"><%=boardDTO.getSubject()%></a></td>
			<td align=center><%=boardDTO.getName()%></td>
			<td align=center><%=boardDTO.getLogtime()%></td>
			<td align=center><%=boardDTO.getHit()%></td>
		</tr>
	<%}%>
<%}%>
</table>
</body>
<script type="text/javascript">
function islogin(id, seq, pg) {
	if('<%=id%>' == 'null'){
		alert("먼저 로그인하세요!!");
	}else if('<%=id%>' != 'null'){
		location.href="http://localhost:8080/memberJSP/board/boardView.jsp?seq="+seq+"&pg="+pg;
	}
}
</script>
</html>