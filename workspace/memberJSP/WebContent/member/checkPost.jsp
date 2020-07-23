<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.bean.ZipcodeDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.dao.MemberDAO"%>
    
<% 
//데이터
request.setCharacterEncoding("UTF-8");
List<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
String sido = request.getParameter("sido");
String sigungu = request.getParameter("sigungu");
String roadname = request.getParameter("roadname");

//DB
if(sido != null){
	MemberDAO memberDAO = MemberDAO.getInstance();
	list = memberDAO.getZipcodeList(sido, sigungu, roadname);
}

////응답
//for(ZipcodeDTO zipcodeDTO : list){
//	System.out.println(zipcodeDTO.getSido() + "  " + zipcodeDTO.getSigungu() + "  " + zipcodeDTO.getRoadname() + "  " + zipcodeDTO.getBuildingname());
//}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호</title>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form method="post" action="checkPost.jsp">
<table width="100%" align="center" border="1" cellspacing="0" cellpadding="3" bordercolor="black">
<tr>
<th>시도</th>
<td align="center">
<select name="sido" style="width:100px;">
<option>시도선택</option>
<option>서울</option>
<option>인천</option>
<option>대전</option>
<option>대구</option>
<option>울산</option>
<option>세종</option>
<option>광주</option>
<option>경기</option>
<option>강원</option>
<option>전남</option>
<option>전북</option>
<option>경남</option>
<option>경북</option>
<option>충남</option>
<option>충북</option>
<option>부산</option>
<option>제주</option>
</td>
<th>시.군.구</th>
<td align="center"><input type="text" name="sigungu" size="30"></td>
</tr>

<tr>
<th>도로명</th>
<td colspan='3'><input type="text" name="roadname" size="35">
<input type="submit" value="검색"></td>
</tr>

<tr>
<th>우편번호</th>
<th colspan='3'>주소</th>
</tr>

<%if(list != null){%>
	<%for(ZipcodeDTO zipcodeDTO : list){
		String zipcode = zipcodeDTO.getZipcode();
		String address = zipcodeDTO.getSido() + " "
			+ zipcodeDTO.getSigungu() + " "
			+ zipcodeDTO.getYubmyundong() + " "
			+ zipcodeDTO.getRi() + " "
			+ zipcodeDTO.getRoadname() + " "
			+ zipcodeDTO.getBuildingname();%>
		<tr>
			<td align="center"><%=zipcode%></td>
			<td colspan="3">
				<a id="addressA" href="#" onclick="checkPostClose('<%=zipcode%>', '<%=address%>')">
					<%=address%>
				</a>
			</td>
		</tr>
	<%}%>
<%}%>

</table>
</form>
</body>
<script type="text/javascript" src="../js/member.js?ver=2"></script>
</html>