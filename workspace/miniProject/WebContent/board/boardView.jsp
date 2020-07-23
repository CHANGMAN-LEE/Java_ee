<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
	td{
		border: 1px solid gray;
	}
</style>

<table style="height: 300px; width: 1000px;">
	<tr>
		<td align="center" style="width:80px;">제목</td><td colspan="5">${boardDTO.getSubject() }</td>
	</tr>
	
	<tr>
		<td align="center" >글번호</td><td>${seq }</td>
		<td align="center" style="width:80px;">작성자</td><td>${boardDTO.getName() }</td>
		<td align="center"style="width:80px;" >조회수</td><td>${boardDTO.getHit() }</td>
	</tr>
	
	<tr>
		<td style='width:500px; height:80px;vertical-align:top;' colspan='6'><pre style='white-space:pre-wrap; word_wrap:break-word; word-break: break-all;'>${boardDTO.getContent() }</pre></td>
	</tr>

	<tr>
		<td colspan="6" align="center">
			<input type="button" value="목록" onclick="location.href='boardList.do?pg=${pg}'">
			<input type="button" value="답글" onclick="location.href='boardReplyForm.do?pseq=${boardDTO.seq}&pg=${pg }'">
		
			<c:if test="${boardDTO.getName().equals(memName)}">
				<input type="button" value="글수정" onclick="location.href='boardModifyForm.do?seq=${boardDTO.seq }&pg=${pg }'">
				<input type="button" value="글삭제" onclick="location.href='boardDelete.do?seq=${boardDTO.seq }'"></td>
			</c:if>
	
		</td>
	</tr>
</table>