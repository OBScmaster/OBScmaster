<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>ManagerPatientInput</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
</style>
<script type="text/javascript">
  
</script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
  </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="managerLogin">Home</a></li>
        <li><a href="managerPatientInput">환자 등록</a></li>
        <li><a href="managerPatientInfo">담당 환자 정보</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.nurseId}</a></li>
      </ul>
    </div>
  </div>
</nav>

<form>

<div class="container text-center">    
  <div class="row content">
  
  <table>
  	 <tr>
 		<td class="col-sm-7">
 			<div class="text-left" style="font-weight: bold;">환자</div> 
				<div class="container col-md-12">
  					<h2>Dynamic Tabs</h2>
  					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
					    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
					    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
					    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
					</ul>

  				<div class="tab-content">
    				<div id="home" class="tab-pane fade in active">
      					<h3>HOME</h3>
     					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
    			</div>
			    <div id="menu1" class="tab-pane fade">
			      <h3>Menu 1</h3>
			      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			    </div>
			    <div id="menu2" class="tab-pane fade">
			      <h3>Menu 2</h3>
			      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			    </div>
			    <div id="menu3" class="tab-pane fade">
			      <h3>Menu 3</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
  			</div>
		</div>   			
 	</td>

 		<td rowspan="2" >
 			<div class="col-sm-15">  
	 			<div class="panel text-left">  
		      		<div class = 'col-md-15'>
		      			<div class='btn-group btn-group-justified'>
		      				<a href='#' class='btn btn-info'>이름</a>
		      				<a href='#' class='btn btn-info'>호실</a>
		      				<a href='#' class='btn btn-info'>생년월일</a>
		      				<a href='#' class='btn btn-info'>수정</a>
		      			</div>
		      			
		      			<div class='list-group text-left' style='height:540px;'>
		      				<c:if test="${patientList != null }">
		      					<table class='text-center'>
				      				<c:forEach var = "item" items="${patientList}">
				      					<tr class='list-group-item'>
				      						<td width='160px;'>${item.name }</td>
				      						<td width='160px;'>${item.room_no }</td>
				      						<td width='160px;'>${item.birthdate }</td>
				      						<td width='160px;'><button type="button" class="btn btn-primary">수정</button></td>
				      					</tr>
				      				</c:forEach>
				      			</table>
		      				</c:if>
		      			</div>
		      		</div>
		      	</div>
			</div>
		</td>
	</tr>
</table>
</div>
</div>

</form>

<footer class="container-fluid text-center">
	<p>Footer Text</p>
</footer>

</body>

</html>