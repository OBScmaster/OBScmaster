<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
<title>Home</title>	
<script src= "./resources/js/jquery-3.1.1.js"></script>
<link rel = "stylesheet" type = "text/css" href = "./resources/css/styleMain.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src = "./resources/js/bootstrap.min.js"></script>
<script src = "./resources/js/function.js"></script>
<script type="text/javascript">

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
alert("비번틀림");
</script>
</c:if>

<c:if test="${whywhywhy!=null}">
<script type="text/javascript">
alert("모르겠네");
</script>
</c:if>



<body background="./resources/image/nature.jpg">

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="pr-wrap">
                <div class="pass-reset">
                    <label>
                        Enter the email you signed up with</label>
                    <input type="email" placeholder="Email" />
                    <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" />
                </div>
            </div>
            <div class="wrap">
                <p class="form-title">
                    Sign In</p>
                <form action="" id="loginForm" class="login" method="post" onsubmit="test()" >
                
                <input type="text" placeholder="Username" id="id" class="id" name="id"/>
                <input type="password" placeholder="Password" id="password" class="password" name="password" />
                <input type="submit" id="loginSubmit" value="Sign In" class="btn btn-success btn-sm" />
                <div class="remember-forgot">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="checkbox">
                                <label>
                                    <input type="radio" name="divider" value="manager" checked="checked"/>병원관계자
                                  	&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="divider" value="protector"/>보호자
                                </label>
                            </div>
                        </div>
                     
                        <div class="col-md-6 forgot-pass-content">
                            <a href="javascription:void(0)" class="forgot-pass">Forgot Password</a>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
