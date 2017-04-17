<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainPage</title>
<script src= "./resources/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="./resources/css/animate.css">
<link rel="stylesheet" type="text/css" href="./resources/css/mainPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
<script type="text/javascript">

$(document).ready(function () {
	$('#logo').addClass('animated fadeInDown');
	$("input:text:visible:first").focus();
});
$('#username').focus(function() {
	$('label[for="username"]').addClass('selected');
});
$('#username').blur(function() {
	$('label[for="username"]').removeClass('selected');
});
$('#password').focus(function() {
	$('label[for="password"]').addClass('selected');
});
$('#password').blur(function() {
	$('label[for="password"]').removeClass('selected');
});

function test(){
	
	 if($(':radio[name="divider"]:checked').val()=="manager"){
					
		 $('#loginForm').attr("action","managerLogin");
		 
		 if($('#id').val()=="admin"){
				$('#loginForm').attr("action","adminLogin");				
			}
		 
	 }else{
		 
		 $('#loginForm').attr("action","patientLogin");
		 
		 if($('#id').val()=="admin"){
				alert("관리자는 관계자 버튼을 클릭 후 로그인 해 주세요");
			}
	 }
	
}

</script>
</head>

<c:if test="${PWnotMatch!=null}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
	</script>
</c:if>

<c:if test="${whywhywhy!=null}">
	<script type="text/javascript">
		alert("해당하는 아이디나 비밀번호가 없습니다");
	</script>
</c:if>

<body>

	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">DAILY <span>UI</span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<form action="" id="loginForm" class="login" method="post" onsubmit="test()" >
			<label for="username">Username</label>
			<br/>
			<input type="text" id="id" class="id" name="id">
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" class="password" name="password">
			<br/>
			<input type="radio" name="divider" value="manager" checked="checked"/>병원관계자
            &nbsp;&nbsp;&nbsp;
            <input type="radio" name="divider" value="protector"/>보호자
            <br/>
			<button type="submit">Sign In</button>
			<br/>
			</form>
			<a href="#"><p class="small">Forgot your password?</p></a>
		</div>
	</div>

</body>
</html>