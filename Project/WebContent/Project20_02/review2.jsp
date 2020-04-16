<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$.ajax({
	 type: "post",
	 url: "${path}/chanrev_servlet/list.do",
	 success: function(result) {
		 $("#revview").html(result);
	}
 });
</script>
</head>
<body>

	<div id="revview"></div>

</body>
</html>