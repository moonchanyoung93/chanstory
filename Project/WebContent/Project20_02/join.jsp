<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Chan'S tory</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Gaegu:400,700&display=swap&subset=korean" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../include/header.jsp" %>
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

	/* 주소검색 */
	function find_postNumber() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	/* 회원가입*/

	$(function() {

		$("#btnJoin").click(function() {
							if ($("input:radio[name='personal_corporate']").is(
									":checked") == false) {
								alert("회원구분을 체크하세요.");
								return false;
							}
							if (document.getElementById("userid2").value.length == 0) {
								alert("아이디를 입력하세요.");
								return false;
							}
							if (document.getElementById("password2").value.length == 0) {
								alert("비밀번호를 입력하세요.");
								return false;
							}
							if (document.getElementById("passwordCheck").value.length == 0) {
								alert("비밀번호를 확인해주세요.");
								return false;
							}
							if (document.getElementById("name").value.length == 0) {
								alert("이름을 입력하세요.");
								return false;
							}
							if (document.getElementById("address").value.length == 0
									|| document.getElementById("detailAddress").value.length == 0
									|| document.getElementById("extraAddress").value.length == 0) {
								alert("주소를 자세히 입력하세요.");
								return false;
							}
							if (document.getElementById("phone").value.length == 0
									|| document.getElementById("phone1").value.length == 0
									|| document.getElementById("phone1").value.length == 0) {
								alert("휴대전화를 입력하세요.");
								return false;
							}
							if (document.getElementById("email").value.length == 0) {
								alert("이메일을 입력하세요.");
								return false;
							}
							if (document.getElementById("return_name").value.length == 0
									|| document.getElementById("return_bank").value.length == 0
									|| document
											.getElementById("return_account").value.length == 0) {
								alert("환불정보를 자세히 입력하세요.");
								return false;
							}

							var password = document.getElementById("password2").value;
							var passwordCheck = document
									.getElementById("passwordCheck").value;
							if ($("input:checkbox[name='agree']")
									.is(":checked") == true
									&& password == passwordCheck) {
								var personal_corporate = $(
										'input[name="personal_corporate"]:checked')
										.val();
								var userid2 = $("#userid2").val();
								var password2 = $("#password2").val();
								var name = $("#name").val();
								var address = $("#postcode").val()
										+ $("#address").val()
										+ $("#detailAddress").val()
										+ $("#extraAddress").val();
								var tel = document.getElementById("tel").value
										+ $("#tel1").val() + $("#tel2").val();
								var phone = document.getElementById("phone").value
										+ $("#phone1").val()
										+ $("#phone2").val();
								var email = $("#email").val();
								var birthday = $("#birthday").val();
								var region = document.getElementById("region").value;
								var return_name = $("#return_name").val();
								var return_bank = $("#return_bank").val();
								var return_account = $("#return_account").val();

								var param = {
									"personal_corporate" : personal_corporate,
									"userid2" : userid2,
									"password2" : password2,
									"name" : name,
									"address" : postcode + address
											+ detailAddress + extraAddress,
									"tel" : tel + tel1 + tel2,
									"phone" : phone + phone1 + phone2,
									"email" : email,
									"birthday" : birthday,
									"region" : region,
									"return_name" : return_name,
									"return_bank" : return_bank,
									"return_account" : return_account
								}

								$.ajax({
									type : "post",
									url : "/Project/chanstory_servlet/join.do",
									data : param,
									success : function() {
										alert("회원가입이 완료되었습니다.")
										goMain();

										//location.reload();

									}
								});

							} else if ($("input:checkbox[name='agree']").is(
									":checked") == true
									&& password != passwordCheck) {
								alert("비밀번호를 확인해주시기 바랍니다.");
							} else {
								alert("약관을 읽고 이용 동의에 체크해 주시기 바랍니다.");

							}
						});
	});
	function goMain() {
		  window.location.href="../Project20_02/main.jsp";
		
	}
	//비밀번호 확인
	function pwdCheck() {
		var password = document.getElementById("password2").value;
		var passwordCheck = document.getElementById("passwordCheck").value;

		if (passwordCheck == "") {
			document.getElementById("passwordCheckText").innerHTML = "";
		} else if (password != passwordCheck) {
			document.getElementById("passwordCheckText").innerHTML = "<font color=red size=2pt> 비밀번호가 일치하지 않습니다.</font>";
		} else {
			document.getElementById("passwordCheckText").innerHTML = "<font color=aqua size=2pt> 비밀번호가 일치합니다.</font>";
		}
	}

	/*아이디 조건 체크 */
	function useridCheck() {
		var userid_check = document.getElementById("userid2").value;

		if (userid_check == "") {
			document.getElementById("useridCheckText").innerHTML = "<font color=white size=2pt>(영문소문자/숫자, 4~16자) </font>";
		} else if (userid_check.length<4 || userid_check.length>16) {
			document.getElementById("useridCheckText").innerHTML = "<font color=red size=2pt>사용 불가능한 아이디입니다.</font>";
		} else {
			document.getElementById("useridCheckText").innerHTML = "<font color=aqua size=2pt>사용 가능한 아이디입니다.</font>";
		}
	}
	/*비밀번호 조건 체크 */
	function pwdCheck2() {
		var password = document.getElementById("password2").value;
		var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,12}$/.test(password); //영문,숫자

		var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,12}$/
				.test(password); //영문,특수문자

		var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,12}$/.test(password); //특수문자, 숫자

		if (!(check1 || check2 || check3)) {
			document.getElementById("passwordCheckText2").innerHTML = "<font color=white size=2pt>사용할 수 없은 조합입니다.</font>";
		} else {
			document.getElementById("passwordCheckText2").innerHTML = "<font color=white size=2pt>사용 가능한 조합입니다.</font>";
		}

	}
	
	  </script>
	  
	  <c:if test="${param.message=='error' }">
	  	<script>
	  		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	  	</script>
	  </c:if>
	  <c:if test="${param.message =='logout' }">
	  	<script>
	  		alert("로그아웃 되었습니다.");
	  	</script>
	  </c:if>
	  
<style>
body {
	background-color: #302b30;
	font-family: 'Gaegu', cursive;
	width: 88%;
	margin: auto;
	color: white;
}
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
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
	width: 10%;
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

.btnLogin {
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

.btnLoginN {
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

.btnLoginK {
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

.btnLoginF {
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

.btnFind_id {
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

.btnFind_password {
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

.th2>input, select {
	background-color: #302b30;
}

.join_btn {
	color: black;
	text-align: center;
}

.join_btn>button:hover {
	background-color: black;
	color: white;
}

.terms, .terms2 {
	border: 1px solid;
	max-height: 250px;
	overflow: auto;
	background: #433d43;
	padding: 30px;
}

ul {
	list-style: none;
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
	<!-- Log In -->
<form action="${path}/chansession_servlet/login.do">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<div style="margin: auto; width: 80%; ">
		<input name="userid" id="userid" placeholder="ID" style="width: 200px;"><br><br>
		<input type="password" name="password" id="password" placeholder="PASSWORD" style="width: 200px;"><br><br>
		<div style=" width: 80%; ">
			<input type="submit" class="btnLogin" value="Log In">
		</div >
		<hr style="color: white; border: 0.4px solid; opacity: 0.2; width: 95%; margin: 20px 2px;">
		<div style="width: 95%; margin: 20px 2px; ">	
		<button type="button" class="btnLoginN"><img src="images/naver.png" width="30" height="30" style="margin-right:  18px;">네이버 로그인</button>
		<button type="button" class="btnLoginK"><img src="images/kakao.png" width="60" height="30" style="margin-left:   -20px;">카카오 로그인</button>
		<button type="button" class="btnLoginF"><img src="images/facebook.png" width="30" height="20" style="margin-right:  15px;">페이스북 로그인</button>
		</div>
		<hr style="color: white; border: 0.4px solid; opacity: 0.2; width: 95%; margin: 20px 2px;">
	
		<div style="width: 95%; ">
		<button type="button" class="btnFind_id">아이디 찾기</button>
		<button type="button" class="btnFind_password">비밀번호 찾기</button><br> <br> 
		<button type="button" class="btnJoin" onclick="goJoin()">회원 가입</button>
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
						<li><a href="#" class="menu-upper" onclick="openNav()">LOGIN</a></li>
						<li><a href="#" class="menu-upper">JOIN US</a></li>
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
				<a href="../Project20_02/main.jsp"><img src="../Project20_02/images/logo.png" width="30%"
					class="logo_img"></a><br>
				<br>
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
						<li><a href="../Project20_02/main.jsp" class="menu">HOME</a></li>
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
						<li><a href="#" onclick="openNav()"><span
								class="glyphicon glyphicon-user"></span> Login</a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container contents">
			<h1>Sing Up</h1>
			<br>
			<br>
			<div>
				<h3>약관</h3>
				<div class="terms">
					<h4>제1조 목적</h4>
					<p>이 약관은 주식회사 찬스토리(전자상거래 사업자)가 운영하는 찬스토리프리 (이하 “몰”)에서 제공하는 인터넷
						관련 서비스(이하 “서비스)를 이용함에 있어 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
						PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.</p>

					<h4>제2조 정의</h4>
					<ul>
						<li>1. “몰”이란 주식회사 찬스토리 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게
							제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러
							사이버몰을 운영하는 사업자의 의미로도 사용합니다.</li>
						<li>2. “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을
							말합니다.</li>
						<li>3. ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수
							있는 자를 말합니다.</li>
						<li>4. ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</li>
					</ul>

					<h4>제3조 약관 등의 명시와 설명 및 개정</h4>
					<ul>
						<li>1. “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수
							있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자
							등을 이용자가 쉽게 알 수 있도록 주식회사 찬스토리 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의
							내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
						<li>2. “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건
							등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을
							구하여야 합니다.</li>
						<li>3. “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서
							및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」,
							「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
						<li>4. “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에
							그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는
							최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게
							비교하여 이용자가 알기 쉽도록 표시합니다.</li>
						<li>5. “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그
							이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가
							개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를
							받은 경우에는 개정약관 조항이 적용됩니다.</li>
						<li>6. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한
							법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는
							상관례에 따릅니다.</li>
					</ul>

					<h4>제4조 서비스의 제공 및 변경</h4>
					<ul>
						<li>1 . “몰”은 다음과 같은 업무를 수행합니다
							<ul>
								<li>- 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
								<li>- 구매계약이 체결된 재화 또는 용역의 배송</li>
								<li>- 기타 “몰”이 정하는 업무</li>
							</ul>
						</li>
						<li>2. “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해
							제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를
							명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
						<li>3. “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의
							변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</li>
						<li>4. 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는
							과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
					</ul>

					<h4>제5조 서비스의 중단</h4>
					<ul>
						<li>1. “몰”은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한
							경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
						<li>2. “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은
							손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
						<li>3. 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는
							경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게
							보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서
							통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li>
					</ul>

					<h4>제6조 회원가입</h4>
					<ul>
						<li>1. 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를
							함으로서 회원가입을 신청합니다.</li>
						<li>2. “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한
							회원으로 등록합니다.
							<ul>
								<li>- 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만
									제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li>
								<li>- 등록 내용에 허위, 기재누락, 오기가 있는 경우</li>
								<li>- 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li>
							</ul>
						</li>
						<li>3. 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
						<li>4. 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보
							수정 등의 방법으로 그 변경사항을 알려야 합니다.</li>
					</ul>

					<h4>제7조 회원 탈퇴 및 자격 상실 등</h4>
					<ul>
						<li>1. 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</li>
						<li>2. 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
							<ul>
								<li>- 가입 신청 시에 허위 내용을 등록한 경우</li>
								<li>- “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를
									기일에 지급하지 않는 경우</li>
								<li>- 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li>
								<li>- “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
							</ul>
						</li>
						<li>3. “몰”이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그
							사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.</li>
						<li>4. “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고,
							회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li>
					</ul>

					<h4>제8조 회원에 대한 통지</h4>
					<ul>
						<li>1. “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할
							수 있습니다.</li>
						<li>2. “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에
							갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
					</ul>

					<h4>제9조 구매신청</h4>
					<ul>
						<li>1. “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은
							이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
							<ul>
								<li>- 재화 등의 검색 및 선택</li>
								<li>- 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
								<li>- 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인</li>
								<li>- 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭)</li>
								<li>- 재화 등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</li>
								<li>- 결제방법의 선택</li>
							</ul>
						</li>
						<li>2. “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의
							동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목,
							제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만
							「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에
							달리 정함이 있는 경우에는 그에 따릅니다.</li>
					</ul>

					<h4>제10조 계약의 성립</h4>
					<ul>
						<li>1. “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다.
							다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을
							취소할 수 있다는 내용을 고지하여야 합니다.
							<ul>
								<li>- 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
								<li>- 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
								<li>- 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</li>
							</ul>
						</li>
						<li>2. “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로
							봅니다.</li>
						<li>3. “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정
							취소 등에 관한 정보 등을 포함하여야 합니다.</li>
					</ul>

					<h4>제11조 지급방법</h4>
					<h5>“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수
						있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수
						없습니다.</h5>
					<ul>
						<li>- 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</li>
						<li>- 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
						<li>- 온라인무통장입금</li>
						<li>- 전자화폐에 의한 결제</li>
						<li>- 수령 시 대금지급</li>
						<li>- 마일리지 등 “몰”이 지급한 포인트에 의한 결제</li>
						<li>- “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</li>
						<li>- 기타 전자적 지급 방법에 의한 대금 지급 등</li>
					</ul>

					<h4>제12조 수신확인통지·구매신청 변경 및 취소</h4>
					<ul>
						<li>1. “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li>
						<li>2. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시
							구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라
							처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li>
					</ul>

					<h4>제13조 재화 등의 공급</h4>
					<ul>
						<li>1. “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한
							날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이
							이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를
							취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
						<li>2. “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을
							명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만
							“몰”이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
					</ul>

					<h4>제14조 환급</h4>
					<h5>“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이
						그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나
						환급에 필요한 조치를 취합니다.</h5>

					<h4>제15조 청약철회 등</h4>
					<ul>
						<li>1. “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한
							법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진
							경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수
							있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법
							규정에 따릅니다.</li>
						<li>2. 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수
							없습니다.
							<ul>
								<li>- 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기
									위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li>
								<li>- 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
								<li>- 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</li>
								<li>- 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
							</ul>
						</li>
						<li>3. 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알
							수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.</li>
						<li>4. 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나
							계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던
							날부터 30일 이내에 청약철회 등을 할 수 있습니다.</li>
					</ul>

					<h4>제16조 청약철회 등의 효과</h4>
					<ul>
						<li>1. “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을
							환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의
							소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</li>
						<li>2. “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의
							대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록
							요청합니다.</li>
						<li>3. 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은
							이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과
							다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.</li>
						<li>4. 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가
							부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</li>
					</ul>

					<h4>제17조 개인정보보호</h4>
					<ul>
						<li>1. “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를
							수집합니다.</li>
						<li>2. “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상
							의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지
							아니합니다.</li>
						<li>3. “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를
							받습니다.</li>
						<li>4. “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는
							제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련
							법령에 달리 정함이 있는 경우에는 예외로 합니다.</li>
						<li>5. “몰”이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의
							신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공
							관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」
							제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
						<li>6. 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수
							있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는
							“몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
						<li>7. “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며
							신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한
							이용자의 손해에 대하여 모든 책임을 집니다.</li>
						<li>8. “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한
							때에는 당해 개인정보를 지체 없이 파기합니다.</li>
						<li>9. “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한
							개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌
							개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지
							않습니다.</li>
					</ul>

					<h4>제18조 “몰" 의 의무</h4>
					<ul>
						<li>1. “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에
							따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.</li>
						<li>2. “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보
							포함)보호를 위한 보안 시스템을 갖추어야 합니다.</li>
						<li>3. “몰”이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한
							표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
						<li>4. “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
					</ul>

					<h4>제19조 회원의 ID 및 비밀번호에 대한 의무</h4>
					<ul>
						<li>1. 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</li>
						<li>2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
						<li>3. 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로
							“몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.</li>
					</ul>

					<h4>제20조 이용자의 의무</h4>
					<h5>이용자는 다음 행위를 하여서는 안 됩니다.</h5>
					<ul>
						<li>- 신청 또는 변경시 허위 내용의 등록</li>
						<li>- 타인의 정보 도용</li>
						<li>- “몰”에 게시된 정보의 변경</li>
						<li>- “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
						<li>- “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
						<li>- “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
						<li>- 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는
							행위</li>
					</ul>

					<h4>제21조 연결“몰”과 피연결“몰” 간의 관계</h4>
					<ul>
						<li>1. 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이
							포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고
							합니다.</li>
						<li>2. 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서
							보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에
							대한 보증 책임을 지지 않습니다.</li>
					</ul>

					<h4>제22조 저작권의 귀속 및 이용제한</h4>
					<ul>
						<li>1. “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.</li>
						<li>2. 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전
							승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는
							안됩니다.</li>
						<li>3. “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</li>
					</ul>

					<h4>제23조 분쟁해결</h4>
					<ul>
						<li>1. “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여
							피해보상처리기구를 설치·운영합니다.</li>
						<li>2. “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한
							처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</li>
						<li>3. “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는
							공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
					</ul>

					<h4>제24조 재판권 및 준거법</h4>
					<ul>
						<li>1. “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고,
							주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가
							분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</li>
						<li>2. “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</li>
					</ul>

					<h4>본 약관은 2020년02월01일부터 적용됩니다.</h4>







				</div>

				<h3>개인정보 수집 및 이용</h3>
				<div class="terms2">
					<h4>필수정보</h4>
					<h5>- 이름, 아이디, 비밀번호, 생일, 성별, 이메일, 주소, 연락처, 휴대폰 (목적: 회원제 서비스 이용
						및 본인 확인 / 보유기간: 회원 탈퇴 후 5일까지)</h5>
					<h4>선택정보</h4>
					<h5>휴대폰, 이메일, 쿠키정보 (목적: 마케팅 활용(이벤트, 맞춤형 광고) / 보유기간: 회원 탈퇴 후
						5일까지)</h5>
				</div>
				<div class="terms_agree">
					<h3>화원 가입을 위해 약관 및 개인정보 수집에 관한 내용을 확인 후 동의해주시기 바랍니다.</h3>

					<input type="checkbox" value="agree" name="agree">동의
				</div>
			</div>
			<br>
			<br>
			<hr style="border: 1px solid white; opacity: 0.2;">

			<!-- 회원정보 -->
			<div class="member_info">
				<h3>기본정보</h3>
				<table border="2" class="member_info_table table">
					<tr>
						<th class="th1">회원구분 <span style="color: red;">*</span></th>
						<th class="th2"><input type="radio" name="personal_corporate"
							value="개인회원">개인회원 <input type="radio"
							name="personal_corporate" value="법인회원">법인회원</th>
					</tr>

					<tr>
						<th>아이디 <span style="color: red;">*</span></th>
						<th class="th2"><input type="text" id="userid2" size="50px"
							onkeyup="useridCheck()"> <span id="useridCheckText">(영문소문자/숫자,
								4~16자) </span></th>
					</tr>

					<tr>
						<th>비밀번호 <span style="color: red;">*</span></th>
						<th class="th2"><input type="password" id="password2"
							size="50px" onkeyup="pwdCheck2()"><span
							id="passwordCheckText2">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,
								10자~16자)</span></th>
					</tr>

					<tr>
						<th>비밀번호 확인<span style="color: red;">*</span></th>
						<th class="th2"><input type="password" name="password"
							id="passwordCheck" size="50px" onkeyup="pwdCheck()"> <span
							id="passwordCheckText"></span></th>
					</tr>

					<tr>
						<th>이름<span style="color: red;">*</span></th>
						<th class="th2"><input type="text" id="name" size="50px"></th>
					</tr>

					<tr>
						<th>주소<span style="color: red;">*</span></th>
						<th class="th2"><input type="text" id="postcode"
							placeholder="우편번호" size="50px"> <input type="button"
							onclick="find_postNumber()" value="주소 검색"><br> <input
							type="text" id="address" placeholder="주소" size="50px"><br>
							<input type="text" id="detailAddress" placeholder="상세주소"
							size="50px"> <input type="text" id="extraAddress"
							placeholder="참고항목" size="50px"></th>
					</tr>

					<tr>
						<th>일반전화</th>
						<th class="th2"><select id="tel" name="일반전화">
								<option value="02" selected="selected">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input size="20px" id="tel1"> - <input size="20px"
							id="tel2"></th>
					</tr>

					<tr>
						<th>휴대전화<span style="color: red;">*</span></th>
						<th class="th2"><select id="phone" name="휴대전화">
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input id="phone1"> - <input id="phone2"></th>
					</tr>

					<tr>
						<th>이메일<span style="color: red;">*</span></th>
						<th class="th2"><input type="text" id="email" size="50px"></th>
					</tr>

				</table>

				<h3>추가정보</h3>
				<table border="2" class="table">
					<tr>
						<th>생년월일</th>
						<th class="th2"><input type="date" id="birthday"
							value="birth"></th>
					</tr>

					<tr>
						<th>지역</th>
						<th class="th2"><select id="region" name="지역"
							style="width: 80px;">
								<option value="선택">선택</option>
								<option value="경기">경기</option>
								<option value="서울">서울</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="충남">충남</option>
								<option value="충북">충북</option>
								<option value="대전">대전</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="대구">대구</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="광주">광주</option>
								<option value="제주">제주</option>
								<option value="해외">해외</option>
						</select></th>
					</tr>

					<tr>
						<th>환불계좌 정보<span style="color: red;">*</span></th>
						<th class="th2">-예금주 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							id="return_name"><br> -은행명
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select id="return_bank"
							name="은행">
								<option value="선택">선택</option>
								<option value="산업은행">산업은행</option>
								<option value="기업은행">기업은행</option>
								<option value="국민은행">국민은행</option>
								<option value="외환은행">외환은행</option>
								<option value="수협중앙회">수협중앙회</option>
								<option value="농협중앙회">농협중앙회</option>
								<option value="농협">농협</option>
								<option value="우리은행">우리은행</option>
								<option value="KB증권">KB증권</option>
								<option value="SC제일은행">SC제일은행</option>
								<option value="대우증권">대우증권</option>
								<option value="신한은행">신한은행</option>
								<option value="메리츠증권">메리츠증권</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="OK저축은행">OK저축은행</option>
								<option value="대구은행">대구은행</option>
								<option value="부산은행">부산은행</option>
								<option value="광주은행">광주은행</option>
								<option value="제주은행">제주은행</option>
								<option value="전북은행">전북은행</option>
								<option value="경남은행">경남은행</option>
								<option value="씨티은행">씨티은행</option>
								<option value="우체국">우체국</option>
								<option value="KEB하나은행">KEB하나은행</option>
								<option value="새마을금고">새마을금고</option>
								<option value="신용협동조합">신용협동조합</option>
						</select><br> -계좌번호 &nbsp;&nbsp; <input id="return_account">
							('-'와 숫자만 입력해주세요.) <br></th>
				</table>
				<br>
				<div class="join_btn">
					<button class="btn btn-light" id="btnJoin">회원가입</button>
					<a href="../Project20_02/main.jsp"><button class="btn">취소</button></a>
				</div>
				<br>


			</div>

		</div>


		<hr style="border: 1px solid white; opacity: 0.5;">


		<footer class="container-fluid text-center">
			<div class="footer_div">
				<div class="footer_div1">
					<a href="../Project20_02/main.jsp"><img src="../Project20_02/images/logo.png"></a>
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
					<strong>반품주소: </strong> 경기도 안신시 상록구 화랑로 534 (안산파크푸르지오) 103동 2803호 <br>
					<strong>입금계좌: </strong> 신한은행 110-361-802900 문찬영</span>
			</div>
			<hr style="border: 1px solid white; opacity: 0.1;">


			<div class="copyright">
				<p>Copyright &copy; All rights reserved.</p>
			</div>

		</footer>
	</div>
</body>
</html>