<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUL</title>
</head>
<body>
<jsp:getProperty name="dataDTO" property="x"/> +
<jsp:getProperty name="dataDTO" property="y"/> =
<%=dataDTO.getX()*dataDTO.getY()%>
<br><br>
<input type="button" value="처음으로" onclick="location.href='input.jsp'">
</body>
</html>