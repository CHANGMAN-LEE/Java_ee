<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="jstlResult.jsp">
<table align="center" border="1">
	<tr>
		<td width="70" align="center">
	    	<font color="red">*</font>이  름
	    </td>
	    <td>
	    	<input type="text" name="name" placeholder="이름입력">
	    </td>
    </tr>
    
    <tr>
	    <td width="70" align="center">나이</td>
	    <td>
	    	<input type="text" name="age">
	    </td>
    </tr>
    
    <tr>
	    <td width="70" align="center">색  깔</td>
	    <td>
		    <select name="color" style="width:100px;">
				<option value = "red">빨 강</option>
				<option value = "green">초 록</option>
				<option value = "blue">파 랑</option>
				<option value = "magenta">보 라</option>
				<option value = "cyan">하 늘</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td width="70" align="center">취  미</td>
		<td>
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="음악">음악
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="영화">영화
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="보내기" onclick=""> &emsp;
		<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>