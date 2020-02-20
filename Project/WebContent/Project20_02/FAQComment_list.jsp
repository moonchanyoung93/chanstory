<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Chan'S tory</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://ma
	xcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Gaegu:400,700&display=swap&subset=korean" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../include/header.jsp"%>
<script src="../include/jquery-3.4.1.min.js"></script>
<style type="text/css">
body {
	background-color: #302b30;
	font-family: 'Gaegu', cursive;
	width: 88%;
	margin: auto;
	color: white;
}
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 20px; 
	border-radius: 0;
	font-size: 1.2em;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
	background-color: #302b30;
}

#myNavbar {
	color: white;
	font-size: 18px;
}

#myNavbar2 {
	color: white;
	font-size: 12px;
}

.menu {
	width: 135px;
	text-align: center;
}

.navbar-nav {
	width: 89%;
}

.navbar-right {
	width: 3.5%;
	font-size: 0.7em;
	/*margin-right: 0 !important;*/
}

.panel-heading {
	font-size: 18px;
	height: 40px;
	background-color: #101010 !important;
	border-color: #101010 !important;
}

.panel-body>a>img {
	height: 250px;
}

.panel-primary {
	border-color: #101010 !important;
}

.slide_text {
	font-size: 5.2em;
}

.slide_text2 {
	font-size: 2.4em;
}

@media ( max-width : 768px) {
	.slide_text {
		font-size: 1.85em;
	}
	.slide_text2 {
		font-size: 1.6em;
	}
}

/* Login */
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #1b181b;
	overflow-x: hidden;
	padding-top: 60px;
	transition: 0.5s;
	color: black;
}

.sidenav .closebtn {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 35px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav .closebtn:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-right .5s;
	padding: 20px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.btnLogin,.btnLogOut {
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 16px;
	color: white;
	border: 1px solid #1b181b;
	background-color: black;
	width: 200px;
}

.btnLogin:hover {
	background-color: white;
	color: #1b181b;
}



.btnJoin {
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 13px;
	color: white;
	border: 1px solid #1b181b;
	background-color: black;
	width: 100%;
	clear: both;
}

.btnJoin:hover {
	background-color: white;
	color: #1b181b;
}

footer {
	background-color: #302b30;
	color: white;
	vertical-align: middle;
	margin: auto;
	opacity: 0.6;
	padding: 25px;
}

.footer_div {
	width: 100%;
	display: flex;
}

.footer_div1 {
	width: 25%;
	margin: 10px auto auto auto;
}

.footer_div_a {
	text-decoration: none;
	color: white;
	opacity: 0.8;
}

.footer_div_a:hover {
	opacity: 1;
	text-decoration: none;
	color: white;
}

@media ( max-width : 768px) {
	.footer_div {
		width: 100%;
		display: table;
	}
	.footer_div1 {
		width: 100%;
	}
	.logo_img {
		width: 65%;
	}
}

@media ( min-width : 768px) {
	#img_a {
		visibility: hidden;
	}
	#img_g {
		visibility: hidden;
	}
}

ul {
	list-style: none;
}

.position {
	float: left;
	right: 0;
	width: 100%;
}

.position_ol {
	display: block;
	float: right;
}

.position_ol>li {
	float: left;
	font-size: 15px;
	padding: 0 12px 0 2px;
	margin: 0 0 0 7px;
	color: #757575;
	list-style-type: none;
}

.position_ol>li>a {
	color: #757575;
}

.position_ol>li>a:hover {
	opacity: 0.4;
	text-decoration: none;
}

@media ( max-width : 768px) {
	.pageName {
		width: 100%;
		font-size: 20pt;
	}
}

@media ( min-width : 768px) {
	.pageName {
		width: 100%;
		font-size: 31pt;
	}
}

.pageName {
	padding-left: 15px;
	margin-bottom: 50px;
}

.table {
	text-align: center;
}

th {
	text-align: center;
}


.inputText {
	text-align: center; 
}

.terms {
	border: 1px solid;
	max-height: 170px;
	overflow: auto;
	background: #433d43;
	padding: 30px;
	width: 80%;
}

	.mypage_li_a{
		color: white;
		font-size: 17px;	
		letter-spacing: 2px;
	}
	
	.mypage_li_a:hover {
	background-color: black !important;
	color: white;
}

.inputstyle {
	background-color: #302b30;
	border-color: silver;
}

.notice_viewtable{
	font-size: 15px;
}

.viewbutton{
	background-color: #302b30;
	color: white;
	font-size: 15px;
}

.navbar-right2 {
	width: 10%;
	font-size: 0.7em;
}

@media (min-width: 768px)
.navbar-right2 {
    float: right !important;
    margin-right: -15px;
}
.btnLoginN{
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 12px;
	color: #1b181b;
	border: 1px solid #1b181b;
	background-color: #26c826; 
	width: 100%;
	font-weight: bold;
	}
	
	.btnLoginK{
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 12px;
	color: #1b181b;
	border: 1px solid #1b181b;
	background-color: #ffec1a; 
	width: 100%;
	font-weight: bold;
	}
	
	.btnLoginF{
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 12px;
	color: #1b181b;
	border: 1px solid #1b181b;
	background-color: #42598a; 
	width: 100%;
	font-weight: bold;
	}
	
	.btnFind_id{
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 12px;
	color: white;
	border: 1px solid #1b181b;
	background-color: black; 
	width: 50%;
	float: left;
	
	}
	.btnFind_id:hover {
	background-color: white;
	color: #1b181b;
	}
	
	.btnFind_password{
	height: 36px;
	line-height: 34px;
	padding: 0 10px;
	font-size: 12px;
	color: white;
	border: 1px solid #1b181b;
	background-color: black; 
	width: 50%;
	float: right;
	}
	
	.btnFind_password:hover {
	background-color: white;
	color: #1b181b;
	}
</style>
</head>
<body>
	

	<div id="main">
	
	
<table border="2" width="700px">
<c:forEach var="row" items="${listfaq}">
	<tr>
		<td>
			${row.writer}
			( <fmt:formatDate value="${row.reg_date}"
				pattern="yyyy-MM-dd hh:mm:ss" /> )<br>
			${row.content}
		</td>
	</tr>
</c:forEach>
</table>
</div>
</body>
</html>