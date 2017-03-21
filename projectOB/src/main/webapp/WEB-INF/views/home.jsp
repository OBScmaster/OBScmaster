<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="./resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
 $(function(){	
	$("#login").click(function(){
		alert($("#id").val()+"  "+$("#password").val());
	})
	
	$(".form").css("backgroundColor","blue");
	
})
</script>
<style type="text/css">



</style>

</head>

<body>

<div>
<img alt="" src="./resources/image/mainPic.jpg">
</div>


<div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-center">
            <div class="form-group">
              <input type="text" placeholder="ID" id="id" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" id="password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success" id="login">Sign in</button>
            <br>
              <div class="form-group">
              <input type="radio" id="select1" name="select" class="form-control" value="보호자"> 보호자
            </div>
            <div class="form-group">
              <input type="radio" id="select2" name="select" class="form-control" value="관계자"> 관계자
            </div>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
      


</body>
</html>
