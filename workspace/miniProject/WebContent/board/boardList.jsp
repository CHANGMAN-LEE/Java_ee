<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="UTF-8"/>
<style type="text/css">
	.subjectA:link {color: black; text-decoration: none;}
	.subjectA:visited {color: black; text-decoration: none;}
	.subjectA:hover {color: green; text-decoration: underline;}
	.subjectA:active {color: red; text-decoration: none;}
</style>

<form name="listForm" method="post" action="/miniProject/board/boardSearch.do">
<input type="hidden" name="pg" value="1">
<c:if test="${list != null }">
<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" style="height: 450px; width: 1500px;">

	<tr>
		<td width='100' align=center>글번호</td>
		<td width='300' align=center>제목</td>
		<td width='100' align=center>작성자</td>
		<td width='100' align=center>작성일</td>
		<td width='100' align=center>조회수</td>
	</tr>

	<c:forEach var="boardDTO" items="${list }">
		<tr>					
			<%-- <c:set var="logtime" value="${ft.format(boardDTO.getLogtime()).equals(currentTime) ? today.format(boardDTO.getLogtime()) : past.format(boardDTO.getLogtime())}"/> --%>
			<th width="100">${boardDTO.seq }</th>
			<td width="200">
				<%-- <a href="#" onclick="checkLoginMem('${boardDTO.seq }','${pg }')" style="cursor:hand; text-decoration: none;">${boardDTO.subject }</a> --%>
				 <a href="javascript:void(0)" onclick="checkLoginMem('${boardDTO.seq }','${pg }')" style="cursor:hand; text-decoration: none;">
				 	<c:if test="${boardDTO.getSeq()!=boardDTO.getRef() }">
				 		<c:forEach var="i" begin="1" end="${boardDTO.lev }">
				 			&emsp;
				 		</c:forEach>
			 			<img src="../image/reply.gif">
				 	</c:if>
				 	${boardDTO.subject }
				 </a>
			</td>
			<th width="150">${boardDTO.id }</th>
			<%-- <th width="100">${logtime }</th> --%>
			<td width="100" align="center">
				<c:if test="${today == boardDTO.logtime}">
	  				<fmt:formatDate value="${boardDTO.logtime }" pattern="HH:mm"/>
	 			</c:if>
     			<c:if test="${today != boardDTO.logtime}">
      				<fmt:formatDate value="${boardDTO.logtime }" pattern="yyyy.MM.dd"/>
     			</c:if>
			</td>
			<th width="100">${boardDTO.hit }</th>			
		</tr>
	</c:forEach>
</table>
</c:if>

<div style=" width:650px; text-align: center;">${boardPaging.pagingHTML }</div>
<select name="searchOption" id="searchOption">
      <option value="제목">제목</option>
      <option value="작성자">작성자</option>
</select>&emsp;
<input type="text" name="keyword" value="${param.keyword }" size="30">&emsp;
<input type="submit" value="검색">
</form>

<script type="text/javascript">
function checkLoginMem(seq, pg){
	if('${memId}'=='') {
		alert("로그인을 먼저 하세요");
		location.href="../main/index.do";
	}else 
		location.href="boardView.do?seq="+seq+"&pg="+pg;
}

function boardPaging(pg){
	var keyword=document.listForm.keyword.value;
	var searchOption=document.listForm.searchOption.value;
	if(keyword==""){
		location.href="boardList.do?pg="+pg;
	} else {
		location.href="boardSearch.do?pg="+encodeURI(pg)+"&keyword="+encodeURI(keyword)+"&searchOption="+encodeURI(searchOption);
	}
}
window.onload = function () {
	if ("${searchOption }" != "") {
		document.getElementById("searchOption").value = "${searchOption }";
	}
}
</script>