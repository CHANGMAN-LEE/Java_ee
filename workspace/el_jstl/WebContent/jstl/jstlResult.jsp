<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#form{
		color: ${param.color};
		font-weight: bold;
	}
</style>
</head>
<body>
<ul id="form">
	<li>이름 : ${param.name }</li>
	
	<li>나이 : ${param.age }세 
		(<font style="color:${param.color}; font-weight:bold;">
			<c:if test="${param.age>=19 }" >성인</c:if>
			<c:if test="${param.age<19 }" >청소년</c:if>
		</font>)
	</li>
	
	<li>색깔 : 
		<c:choose>
			<c:when test="${param.color eq 'red'}">빨강</c:when>
			<c:when test="${param.color eq 'green'}">초록</c:when>
			<c:when test="${param.color eq 'blue'}">파랑</c:when>
			<c:when test="${param.color eq 'magenta'}">보라</c:when>
			<c:otherwise>하늘</c:otherwise>
		</c:choose>
	</li>
	
	<li>취미 : 
		<c:forEach var="hobby" items="${paramValues.hobby }">
			${hobby }
		</c:forEach>
	</li>
</ul>
</body>
</html>