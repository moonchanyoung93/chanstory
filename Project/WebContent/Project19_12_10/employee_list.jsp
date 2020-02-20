<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.util.Map" %>
    <%@ page import="java.util.List" %>
	<%@page import="employee.EmployeeDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="include/jquery-3.4.1.min.js" ></script>
</head>
<body>
<%
Map<String,Object> map=(Map<String,Object>)request.getAttribute("map");
List<EmployeeDTO> list=(List<EmployeeDTO>)map.get("list");
int count=(int)map.get("count");
%>
<h2 style="width: 100%; margin: auto;">(주) 맥 사원수 : <%=count %>명</h2>
<table border="1" width="100%" style="margin: auto; font-size: 1.1em;">
	<tr>
		<th>사원번호</th>
		<th>이름</th>
		<th>성별</th>
		<th>연락처</th>
		<th>주소</th>
		<th>소속팀</th>
		<th>입사일</th>
	</tr>
	<% for(EmployeeDTO dto : list){ %>
	<tr>
		<td><%=dto.getNo() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getGender() %></td>
		<td><%=dto.getHp() %></td>
		<td><%=dto.getAddress() %></td>
		<td><%=dto.getTeam() %></td>
		<td><%=dto.getJoin_date() %></td>
	</tr>
	<%} %>

</table>


</body>
</html>