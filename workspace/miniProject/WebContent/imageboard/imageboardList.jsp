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
	.productImage{
		width:150px;
		height:150px;
	}	
</style>

<form name="imageboardListForm" method="post" action="#">
	<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" style="height: 450px; width: 1500px;">
		<tr>
			<td width='100' align=center>
				<input type="checkbox" id="checkboxAll" name="checkboxAll" onclick="checkAll()">번호
			</td>
			<td width='300' align=center>이미지</td>
			<td width='100' align=center>상품명</td>
			<td width='100' align=center>단가</td>
			<td width='100' align=center>개수</td>
			<td width='100' align=center>합계</td>
		</tr>
		
		<c:forEach var="imageboardDTO" items="${list }">
			<tr>
				<th width="100" align="center">
					<input type="checkbox" id="checkbox" name="checkbox" value="${imageboardDTO.seq }" onclick="check()">${imageboardDTO.seq }
				</th>
				<td width="300" align="center">
					 <a href="javascript:void(0)" onclick="checkLoginMem('${imageboardDTO.seq }')"><img class="productImage" src="../storage/${imageboardDTO.image1 }"></a>
				</td>
				<td width=100px align="center">${imageboardDTO.imageName }</td>
				<td width=100px align="center"><fmt:formatNumber value="${imageboardDTO.imagePrice }" pattern="#,###원"/></td>
				<td width=100px align="center"><fmt:formatNumber value="${imageboardDTO.imageQty }" pattern="#,###개"/></td>
				<td width=100px align="center"><fmt:formatNumber value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" pattern="#,###원"/></td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${memId == 'admin'}">
		<input type="button" value="선택 삭제" onclick="choiceDelete()">
	</c:if>
	<div style="width: 1300px; text-align: center; display: inline-block;">${imageboardPaging.pagingHTML }</div>
</form>

<script>
function imageboardPaging(pg){
    location.href="imageboardList.do?pg="+encodeURI(pg);
}

function checkAll() {
	var checkboxAll = document.getElementById("checkboxAll");
	var checkbox = document.getElementsByName("checkbox");
	
	if(checkboxAll.checked == true){
		for(var i=0; i<checkbox.length; i++){
			checkbox[i].checked = true;
		}
	}else{
		for(var i=0; i<checkbox.length; i++){
			checkbox[i].checked = false;
		}
	}
}

function check() {
	var checkboxAll = document.getElementById("checkboxAll");
	var checkbox = document.getElementsByName("checkbox");
	
	for(var i=0; i<checkbox.length; i++){
		if(checkbox[i].checked == false){
			checkboxAll.checked = false;
			break;
		}else{
			checkboxAll.checked = true;
		}
	}
}

function choiceDelete() {
	var sw = 0;
	var seq = [];
	var checkbox = document.getElementsByName("checkbox");
	
	for(var i=0; i<checkbox.length; i++){
		if(checkbox[i].checked == true){
			sw = 1;
			seq.push(checkbox[i].value);
		}
	}
	
	if(sw == 0){
		alert("삭제할 항목을 선택하세요.");
	}else if(sw == 1){
		if(confirm("삭제하시겠습니까?")){	
			location.href="/miniProject/imageboard/imageboardDelete.do?seq="+seq;
		}else{
			location.href="/miniProject/imageboard/imageboardList.do?pg=1";
		}
	}
}

function checkLoginMem(seq){
	if('${memId}'=='') {
		alert("로그인을 먼저 하세요");
		location.href="../main/index.do";
	}else 
		location.href="imageboardView.do?seq="+seq;
}
</script>