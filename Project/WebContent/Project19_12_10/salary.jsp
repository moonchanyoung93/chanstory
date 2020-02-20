<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 맥</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String position=request.getParameter("position");
int basic=Integer.parseInt(request.getParameter("basic"));
int time=Integer.parseInt(request.getParameter("time"));
String yesorno=request.getParameter("yesorno");
int salary=basic*time;

int bonus=0;
	if(position.equals("사원")){
		bonus=(int)(salary*0.015);
	}else if(position.equals("주임")){
		bonus=(int)(salary*0.02);
	}else if(position.equals("대리")){
		bonus=(int)(salary*0.025);
	}else if(position.equals("과장")){
		bonus=(int)(salary*0.035);
	}else {
		bonus=(int)(salary*0.045);
	}
	int money=salary+bonus;

%>
<div>
<fieldset style="text-align: center; width:60%; margin: auto;">
	<legend><%=name %>님의 급여</legend>
		<h3>(<%=position%>)<%=name %>님은 (시급<%=basic %>원
		<%=time %>시간 근무)로 <%=salary %>이며 상여금 <%=bonus %>
		원을 포함한 이 달 총 급여는 <%=money %>원입니다.
		</h3>
		<button><a href="salaryiframe.html">확인</a></button>
</fieldset>
</div>
</body>
</html>