<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>** 변수 설정 **</h3>
	<%String name = "홍길동"; %>
	<c:set var="name" value="홍길동"/>
	<c:set var="age">27</c:set>
	나의 이름은 <c:out value="${name }"/>입니다<br>
	내 나이는 ${age }살 입니다<br><br>
	
	<h3>** 변수 삭제 **</h3>
	<c:remove var="name"/>
	나의 이름은 <c:out value="${name }"/>입니다<br>
	내 나이는 ${age }살 입니다<br><br>
	
	<h3>** forEach 1 to 10 **</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i } &nbsp;
		<c:set var="sum" value="${sum+i }" />
	</c:forEach><br>
	1에서 10까지 합 : <c:out value="${sum }"></c:out><br><br>
	
	<h3>** forEach 10 to 1 **</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		${11-i } &nbsp;
	</c:forEach><br><br>
	
	<h3>** 문자열 분리 **</h3>
	StringTokenizer, String의 split<br>
	"010-0000-0000" -> "010" "0000" "0000"<br>
	<c:forTokens var="car" items="소나타,아우디,링컨,페라리,벤츠" delims=",">
		${car }<br>
	</c:forTokens><br>
	
	<h3>** jstlExam.jsp에서 넘어온 데이터 출력 **</h3>
	<%-- <%request.getAttribute("list"); %>
	${requestScope.list } --%>
	${list }<br><br>
	
	<h3>** 인덱스 2번째 데이터 출력 **</h3>
	결과 => ${list[2] }<br><br>
	
	<h3>** 모든 인덱스 하나씩 데이터 출력 **</h3>
	<c:forEach var="data" items="${list }">
		${data }<br>
	</c:forEach><br><br>
	
	<h3>** List2 모든 데이터 출력 **</h3>
	<c:forEach var="personDTO" items="${list2 }" varStatus="i">
		index = ${i.index} &emsp; count = ${i.count}<br>
		이름 = ${personDTO.getName() } &emsp; 나이 = ${personDTO.getAge() }<br>
	</c:forEach>
</body>
</html>