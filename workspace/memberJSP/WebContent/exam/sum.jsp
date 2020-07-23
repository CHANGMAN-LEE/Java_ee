<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/>
<jsp:setProperty name="dataDTO" property="x"/>
<jsp:setProperty name="dataDTO" property="y"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUM</title>
</head>
<body>
<form name="input" method="post" action="mul.jsp">
<jsp:getProperty name="dataDTO" property="x"/> +
<jsp:getProperty name="dataDTO" property="y"/> =
<%=dataDTO.getX()+dataDTO.getY()%>
<br><br>
<input type="submit" value="곱구하기">
</form>
</body>
</html>