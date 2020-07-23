<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body marginheight="0" marginwidth="0">
<table style="width: 100%; height: 100%" border="1">
	<tr>
		<td height="100" colspan="2" align="center" style="background-color:#FFFFEBCD"><jsp:include page="../template/top.jsp"></jsp:include></td>
	</tr>
 
	<tr>
		<td width="300" height="300" valign="top" align="center" style="background-color:#FFFFEBCD">
			<c:if test="${memId eq null && fail ne 'fail' }">
					<jsp:include page="../member/loginForm.jsp"></jsp:include><br>
			</c:if>
			<c:if test="${memId ne null }">
					<br><br><jsp:include page="../member/loginOk.jsp"></jsp:include><br><br><br><br>
			</c:if>
			<c:if test="${memId eq null && fail eq 'fail' }">
					<br><br><jsp:include page="../member/loginFail.jsp"></jsp:include><br><br><br><br>
			</c:if>
			<img width="359" height="300" src="../image/image_IU6.gif">
		</td>
		<td align="center" style="background-color:#FFFFEBCD"><jsp:include page="${display }"></jsp:include></td>
	</tr>

	<tr>
		<td height="50" colspan="2" align="center"><jsp:include page="../template/bottom.jsp"></jsp:include></td>
	</tr> 
</table>
</body>
</html>