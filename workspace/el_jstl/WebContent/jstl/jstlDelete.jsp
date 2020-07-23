<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update var="rs" dataSource="jdbc/oracle">
	DELETE usertable where id='${param.id }'
</sql:update>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("삭제완료!!");
	location.href="../jstl/jstlList.jsp";
}
</script>
</html>