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
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/chansession_check.jsp"%>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function openNav() {
		document.getElementById("mySidenav").style.width = "270px";
		document.getElementById("main").style.marginRight = "200px";
		document.getElementById("main").style.opacity = "0.3";
	}
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginRight = "0";
		document.getElementById("main").style.opacity = "1";
	}
	
	function Logout() {
		  location.href="${path}/chansession_servlet/logout.do";
	}
	
	$(function() {
		$("#btnUpdate").click(function() {
			document.form1.action="${path}/chanrev_servlet/update.do";
			document.form1.submit();
		});
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/chanrev_servlet/delete.do";
				document.form1.submit();			
			}
		});
		$("#btnList").click(function() {
			location.href="/Project/Project20_02/review2.jsp";
		});
		
	});
	
	

	
</script>
<style>
 body {
	background-color: #302b30;
	font-family: 'Gaegu', cursive;
	width: 88%;
	margin: auto;
	color: white;
}
.navbar {
	margin-bottom: 20px; 
	border-radius: 0;
	font-size: 1.2em;
}

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

.comment_text{
	color: black;
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
 */
	
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
		.dropdown-menu{
	background-color: #1b181b;
	}
	.dropdown-menu>li>a{
		color: white !important;
	}
	.dropdown-menu>li>a:hover{
		color: black !important;
		font-size: 1.25em;
	}
	.dropdown-header{
		color: white !important;
	}
</style>

</head>
<body>
<body>
	<!-- Log In -->
<form action="${path}/chansession_servlet/login.do">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<div style="margin: auto; width: 80%; ">
		<div style=" width: 80%; ">
		<h4 style="color: white;">${sessionScope.message}</h4>
		
		</div >
		<hr style="color: white; border: 0.4px solid; opacity: 0.2; width: 95%; margin: 20px 2px;">
		<div style="width: 95%; margin: 20px 2px; ">	
			<ul class="nav mypage">
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;마이페이지</a></li>
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;주문내역</a></li>
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;장바구니</a></li>
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-barcode"></span>&nbsp;&nbsp;쿠폰</a></li>
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;적립금</a></li>
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;예치금</a></li>
				<li class="nav-item mypage_li"><a class="nav-link mypage_li_a" href="#"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;문의내역</a></li>
			</ul>
		</div>
		<hr style="color: white; border: 0.4px solid; opacity: 0.2; width: 95%; margin: 20px 2px;">
	
		<div style="width: 95%; ">
			<button type="button" class="btnLogOut" onclick="Logout()">Log Out</button>
		</div>
	</div>
	
</div>
</form>
	

	<div id="main">

		<!-- 로고 위 주문배송 등등 -->
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<!-- 작은창일때 생기는 메뉴 바 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar2">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar2">
					<ul class="nav navbar-nav"
						style="float: left; width: 45%; font-size: 1.15em;">
					 <li><a href="#"  class="menu-upper " onclick="Logout()">LOGOUT</a></li>
  					      <li><a href="#" class="menu-upper" >MODIFY</a></li>
						<li><a href="#" class="menu-upper">CART <span
								class="badge">0</span></a></li>
						<li><a href="#" class="menu-upper">ORDER</a></li>
						<li><a href="#" class="menu-upper">MY PAGE</a></li>
						<li><a href="#" class="menu-upper">+BOOKMARK</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right"
						style="width: 24%; font-size: 1.15em;">
						<li><a href="../Project20_02/notice2.jsp" class="menu-upper">NOTICE</a></li>
						<li><a href="../Project20_02/FAQ2.jsp" class="menu-upper">FAQ</a></li>
						<li><a href="../Project20_02/QNA2.jsp" class="menu-upper">Q&A</a></li>
						<li><a href="../Project20_02/review2.jsp" class="menu-upper">REVIEW</a></li>
						<li><a href="../Project20_02/event2.jsp" class="menu-upper">EVENT</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- 로고 -->
		<div class="jumbotron">
			<div class="container text-center ">
				<a href="../Project20_02/main_login.jsp"><img src="../Project20_02/images/logo.png" width="30%"
					class="logo_img"></a><br> <br>
				<p style="color: white; font-size: 1.6em;">S I M P L I C T Y</p>
			</div>
		</div>


		<!-- 메뉴 -->
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<!-- 작은창일때 생기는 메뉴 바 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav ">
						<li><a href="../Project20_02/main_login.jsp" class="menu">HOME</a></li>
						<li><a href="#" class="menu  dropdown-toggle"
							data-toggle="dropdown">NEW 5%</a></li>
						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">BEST 30</a></li>

						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">OUTER</a>
							<ul class="dropdown-menu" style="font-size: 0.8em;">
								<li class="dropdown-header"><a href="#"
									class="dropdown-header"
									style="font-size: 1.7em; text-align: left;">OUTER</a></li>
								<li class="divider"></li>
								<li><a href="#">COAT</a></li>
								<li><a href="#">JACKET</a></li>
								<li><a href="#">JUMPER</a></li>
							</ul></li>

						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">TOP</a>
							<ul class="dropdown-menu" style="font-size: 0.8em;">
								<li class="dropdown-header"><a href="#"
									class="dropdown-header"
									style="font-size: 1.7em; text-align: left;">TOP</a></li>
								<li class="divider"></li>
								<li><a href="#">TEE</a></li>
								<li><a href="#">SHIRTS</a></li>
								<li><a href="#">KNIT</a></li>
								<li><a href="#">VEST</a></li>
								<li><a href="#">MTM</a></li>
							</ul></li>

						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">BOTTOM</a>
							<ul class="dropdown-menu" style="font-size: 0.8em;">
								<li class="dropdown-header"><a href="#"
									class="dropdown-header"
									style="font-size: 1.7em; text-align: left;">BOTTOM</a></li>
								<li class="divider"></li>
								<li><a href="#">DENIM</a></li>
								<li><a href="#">SLACKS</a></li>
								<li><a href="#">COTTON</a></li>
								<li><a href="#">1/2 PANTS</a></li>
							</ul></li>

						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">SUIT</a></li>

						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">SHOE&BAG</a>
							<ul class="dropdown-menu" style="font-size: 0.8em;">
								<li class="dropdown-header"><a href="#"
									class="dropdown-header"
									style="font-size: 1.7em; text-align: left;">SHOE&BAG</a></li>
								<li class="divider"></li>
								<li><a href="#">SHOE</a></li>
								<li><a href="#">BAG</a></li>
							</ul></li>
						<li><a href="#" class="menu dropdown-toggle"
							data-toggle="dropdown">ACC</a>
							<ul class="dropdown-menu" style="font-size: 0.8em;">
								<li class="dropdown-header"><a href="#"
									class="dropdown-header"
									style="font-size: 1.7em; text-align: left;">ACC</a></li>
								<li class="divider"></li>
								<li><a href="#">CAP</a></li>
								<li><a href="#">BELT</a></li>
								<li><a href="#">TIE</a></li>
								<li><a href="#">SOCKS</a></li>
								<li><a href="#">WATCH</a></li>
								<li><a href="#">ETC</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" onclick="openNav()"><span class="glyphicon glyphicon-align-justify"></span></a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="contents">
			<div class="position">
				<ol class="position_ol">
					<li><a href="../Project20_02/main_login.jsp">HOME</a></li>
					<li>></li>
					<li>BOARD</li>
					<li>></li>
					<li><strong>REVIEW</strong></li>
				</ol>
			</div>
			<br>

			<h2 class="pageName">REVIEW</h2>


			<form name="form1" method="post" enctype="multipart/form-data" >
				<div class="notice_viewtable">
					<table border="3" width="70%" style="margin: auto;">
						<tr>
							<td class="inputText col-xs-3" >날짜</td>
							<td class="inputText col-xs-5">${dto.reg_date}</td>
							<td class="inputText col-xs-2">조회수</td>
							<td class="inputText col-xs-2">${dto.readcount}</td>
						</tr>
						
						<tr>
							<td class="inputText">작성자</td>
							<td colspan="3"><input name="writer" id="writer" value="${dto.writer }" class="inputstyle" ></td>
						</tr>
						
						<tr>
							<td class="inputText">제목</td>
							<td colspan="3">
							<select name="subject" id="subject" class="inputstyle" style="width: 430px; font-size: 16pt;	">
							    <option value="optionAll">ALL</option>
							    <option value="option1">NEW 5%</option>
							    <option value="option2">BEST 30</option>
				    			<option value="option3">OUTER</option>
				    			<option value="option4">TOP</option>
				    			<option value="option5">BOTTOM</option>
				    			<option value="option6">SUIT</option>
				    			<option value="option7">SHOE&BAG</option>
				    			<option value="option8">ACC</option>
						  </select>
							</td>
						</tr>
						
						<tr>
							<td class="inputText" >본문</td>
							<td colspan="3"><textarea rows="8" cols="150" name="content" id="content" class="inputstyle">${dto.content}</textarea> </td>
						</tr>
						
						<tr>
							<td class="inputText">첨부파일</td>
							<td colspan="3">
							<c:if test="${dto.filesize>0 }">
								${dto.filename}(${dto.filesize/1024} KB)
								<input type="checkbox" name="fileDel" class="inputstyle">첨부파일 삭제<br>
								</c:if>
							<input type="file" name="file1" class="inputstyle viewbutton"></td>
						</tr>
						<tr>
							<td class="inputText">비밀번호</td>
							<td colspan="3"><input type="password" name="password1" id="password1"
								class="inputstyle">
							</td>
						</tr>
						
						 <tr>
 						   <td colspan="4" align="center">
						 	 <input type="hidden" name="num" value="${dto.num}">
						 	 <input type="button" value="수정" id="btnUpdate" class="viewbutton">
					     	 <input type="button" value="삭제" id="btnDelete" class="viewbutton">
					     	 <input type="button" value="목록" id="btnList" class="viewbutton">
					 	   </td>  
					 	 </tr>
					</table>
				</div>
				<br>
			</form>


			<hr style="border: 1px solid white; opacity: 0.5;">


			<footer class="container-fluid text-center">
				<div class="footer_div">
					<div class="footer_div1">
						<a href="../Project20_02/main_login.jsp"><img src="../Project20_02/images/logo.png"></a>
						<p style="font-size: 40px;">
							<strong>010-5777-8339</strong><a href="tel:010-5777-8339"
								id="img_a"><span class="glyphicon glyphicon-earphone"
								id="img_g"> </span></a>
						</p>
						<span style="font-size: 13px;"> 문자 메세지 수신불가 / 콜센터,문의게시판 이용<br>10:00
							AM ~ 6:00 PM (Lunch time 12:00 PM ~ 1:00 PM)<br>토,일요일 및 공휴일
							휴무
						</span>
					</div>

					<div class="footer_div1">
						<span style="font-size: 14px;"><strong
							style="font-size: 19px;">Account Info</strong><br>신한
							110-361-802900<br>예금주 : 문찬영(찬'스토리)</span>
					</div>

					<div class="footer_div1">
						<span style="font-size: 14px;"><strong
							style="font-size: 19px;">My Account</strong><br> <a href="#"
							class="footer_div_a">마이페이지</a><br> <a href="#"
							class="footer_div_a">주문내역</a><br> <a href="#"
							class="footer_div_a">회원등급 및 혜택</a><br> </span>
					</div>

					<div class="footer_div1">
						<span style="font-size: 14px;"><strong
							style="font-size: 19px;">Shipping & Returns</strong><br> <a
							href="#" class="footer_div_a">문의게시판</a><br> <a href="#"
							class="footer_div_a">교환반품안내</a><br> <a href="#"
							class="footer_div_a">우체국택배 반품접수</a><br> </span>
					</div>
				</div>
				<br>

				<hr style="border: 1px solid white; opacity: 0.1;">
				<div>
					<a href="http://www.instagram.com"><img
						src="../Project20_02/images/instagram.png" width="50"></a> <a
						href="http://www.facebook.com"><img src="../Project20_02/images/facebook2.png"
						width="50"></a>
				</div>
				<hr style="border: 1px solid white; opacity: 0.1;">



				<div class="footer_end">
					<span><strong>상호</strong> (주)찬스토리 대표 문찬영<br> <strong>경기도
							안신시 상록구 화랑로</strong> 534 (안산파크푸르지오) 103동 2803호 <br> <strong>사업자등록번호</strong>
						142-81-77568<br> <strong>통신판매업신고번호</strong> 제2020-안산상록-0072호<br>
						<strong>개인정보담당자</strong> 문찬영 <a href="mailto:khm932001@naver.com"
						style="text-decoration: none; color: white;"><span
							class="glyphicon glyphicon-envelope"> </span> khm932001@naver.com</a><br>
						<strong>반품주소: </strong> 경기도 안신시 상록구 화랑로 534 (안산파크푸르지오) 103동 2803호
						<br> <strong>입금계좌: </strong> 신한은행 110-361-802900 문찬영</span>
				</div>
				<hr style="border: 1px solid white; opacity: 0.1;">


				<div class="copyright">
					<p>Copyright &copy; All rights reserved.</p>
				</div>
			</footer>
</div>
		</div>
</body>
</html>
