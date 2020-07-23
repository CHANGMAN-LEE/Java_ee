<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="../image/zoom.png" width="15" height="15" style="cursor: pointer;" onclick="bigImage()">
<img src="../image/zoom.png" width="15" height="15" style="cursor: pointer;" id="bigImage">
<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" style="height: 450px; width: 1000px;">
	<tr>
		<td rowspan="4" width="220" align="center"><img src="../storage/${imageboardDTO.image1 }" width="200" height="200" id="imageView"></td>
		<td width="250">상품명 : ${imageboardDTO.imageName }</td>
	</tr>
	
	<tr>
		<td width="250">단가 : <fmt:formatNumber value="${imageboardDTO.imagePrice }" pattern="#,###원"/></td>
	</tr>
	
	<tr>
		<td>갯수 : <fmt:formatNumber value="${imageboardDTO.imageQty }" pattern="#,###개"/></td>
	</tr>
	
	<tr>
		<td>합계 : <fmt:formatNumber value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" pattern="#,###원"/></td>
	</tr>
	
	<tr>
		<td colspan="2" valign=top  width="450" height="250" style="white-space:pre-wrap; word-break:break-all;">${imageboardDTO.getImageContent() }</td>
	</tr>
</table>
<%-- <table border=1 width="600px" cellspacing=0 frame="hsides" rules="rows">
<tr>
<th colspan="3" align="center">${board.getSubject()}</th>
</tr>
<tr>
<td width="100">글번호:${board.getSeq()}</td><td width="150">작성자:${board.getName() }</td><td width="150">조회수:${board.getHit() }</td>
</tr>
<tr>
<td colspan="3" valign=top height="150" style="white-space:pre-wrap; word-break:break-all;">${board.getContent() }</td>
</tr>
</table> --%><br>
<input type="button" value="목록" onclick="location.href='imageboardList.do?pg=1'">
<%-- <input type="button" value="답글" onclick="location.href='boardReplyForm.do?pg=${param.pg }&pseq=${board.getSeq() }'"> --%>
<c:if test="${memId=='admin' }">
<input type="button" value="글수정" onclick="">
<input type="button" value="글삭제" onclick="">
</c:if>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function bigImage() {
	let newWindow = window.open("", "", "width=500 height=500");
	let img = newWindow.document.createElement("img");
	img.setAttribute("src", "http://localhost:8080/miniProject/storage/${imageboardDTO.image1 }");
	img.setAttribute("width", "500");
	img.setAttribute("height", "500");
	newWindow.document.body.appendChild(img);
}

$('#bigImage').click(function(){
	console.log("아 시발");
	let url = $('#imageView').attr('src');
	window.open(url, '', 'width=500 height=500');
});
</script>
</html>