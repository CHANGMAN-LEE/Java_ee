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
</head>
<body>
	<fmt:formatNumber type="number" value="123456.78" pattern="#.###"/><br>
	<fmt:formatNumber type="number" value="123456.789" pattern=".##"/><br>
	<fmt:formatNumber type="number" value="123456.789" pattern="#,###.##"/><br>
	
	<fmt:formatNumber type="number" value="0000.00" pattern="#,###.##"/><br>
	<fmt:formatNumber type="number" value="0000.00" pattern="0,000.00"/><br>
	<fmt:formatNumber type="number" value="12.3" pattern="000.00"/><br><br>
	
	<c:set var="now" value="<%=new java.util.Date() %>"/>
	<c:out value="${now }"/>
	date : <fmt:formatDate value="${now }" type="date"/><br>
	time : <fmt:formatDate value="${now }" type="time"/><br>
	both : <fmt:formatDate value="${now }" type="both"/><br><br>
	
	<fmt:formatDate value="${now }" type="both" pattern="yy-MM-dd hh:mm"/><br>
	<fmt:formatDate value="${now }" type="both" pattern="yy-MM-dd"/><br>
	<fmt:formatDate value="${now }" type="date" pattern="yy-MM-dd E요일a"/><br>
	<fmt:formatDate value="${now }" type="time" pattern="HH:mm"/><br>
</body>
</html>