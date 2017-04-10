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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	$( ".datepicker" ).datepicker({
		dateFormat: "yy/mm/dd"
	});
	

	
	$(".list-group-item").on("click", function() {
		var pt_no = $(this).attr("id");
		var today = $(".datepicker").val();
		
		alert(pt_no);
		alert(today);
		
				var html = "";
				html += "<div class='text-left' style='font-weight: bold;'>환자</div> ";
				html += "<div class='container col-md-12'>";
				html += "<h2>환자 스케쥴 입력</h2>";
				html += "<ul class='nav nav-tabs'>";
				html += "<li class='active'>";
				html += "<li><a data-toggle='tab' href='#menu1'>식사</a></li>";
				html += "<li><a data-toggle='tab' href='#menu2'>운동</a></li>";
				html += "<li><a data-toggle='tab' href='#menu3'>청소</a></li>";
				html += "<li><a data-toggle='tab' href='#menu4'>세탁</a></li>";
				html += "<li><a data-toggle='tab' href='#menu5'>샤워</a></li>";
				html += "<li><a data-toggle='tab' href='#menu6'>수면</a></li>";
				html += "<li><a data-toggle='tab' href='#menu7'>의사소견</a></li>";
				html += "<li><a data-toggle='tab' href='#menu8'>특이사항</a></li>";
				html += "</ul>";
				html += "<div class='tab-content'>";
				html += "<div id='menu1' class='tab-pane fade in active'>";
					$.ajax({
						type : "post",
						url : "showMeal",
						data : {
							pt_no : pt_no,
							today : today
						},
						success : function(data) {
							console.log(data);
							var html1 = "";
							html1 += "<div class='panel panel-primary'>";
							html1 += "<div class='panel-heading'>";
							html1 += "<h3 class='panel-title'>식사</h3>";
							html1 += "</div>";
							html1 += "<div class='panel-body'>";
							html1 += "<table class='table table-hover'>";
							html1 += "<thead>";
							html1 += "<tr>";
							html1 += "<th>식사</th>";
							html1 += "<th>시간</th>";
							html1 += "<th>식단</th>";
							html1 += "</tr>";
							html1 += "</thead>";
							$.each(data, function(index,item) {
								if(item != ""){
								html1 += "<tbody>";
								html1 += "<tr>";
								html1 += "<td>" + item.TYPEEAT + "</td>";
								html1 += "<td>" + item.MEALTIME + "</td>";
								html1 += "<td>" + item.WHATEAT + "</td>";
								html1 += "</tr>";
								html1 += "</tbody>";
								} else{
									html1 += "<tbody>";
									html1 += "<tr>";
									html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
									html1 += "</tr>";
									html1 += "</tbody>";
								}
							})
							html1 += "</table>";
							html1 += "</div>";
							html1 += "</div>";
							$("#menu1").html(html1);
						},
						error : function(e) {
							console.log(e);
						}
					})
			    html += "</div><div id='menu2' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showExercise",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html2 = "";
						html2 += "<div class='panel panel-success'>";
						html2 += "<div class='panel-heading'>";
						html2 += "<h3 class='panel-title'>운동</h3>";
						html2 += "</div>";
						html2 += "<div class='panel-body'>";
						html2 += "<table class='table table-hover'>";
						html2 += "<thead>";
						html2 += "<tr>";
						html2 += "<th>운동</th>";
						html2 += "<th>시간</th>";
						html2 += "</tr>";
						html2 += "</thead>";
						$.each(data, function(index,item) {
							if(item.EXERCISETEXT != null){
							html2 += "<tbody>";
							html2 += "<tr>";
							html2 += "<td>" + item.EXERCISETEXT + "</td>";
							html2 += "<td>" + item.EXERCISETIME + "</td>";
							html2 += "</tr>";
							html2 += "</tbody>";
							} else{
								html2 += "<tbody>";
								html2 += "<tr>";
								html2 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html2 += "</tr>";
								html2 += "</tbody>";
							}
						})
						html2 += "</table>";
						html2 += "</div>";
						html2 += "</div>";
						$("#menu2").html(html2);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div><div id='menu3' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showCleaning",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html3 = "";
						html3 += "<div class='panel panel-info'>";
						html3 += "<div class='panel-heading'>";
						html3 += "<h3 class='panel-title'>청소</h3>";
						html3 += "</div>";
						html3 += "<div class='panel-body'>";
						html3 += "<table class='table table-hover'>";
						html3 += "<thead>";
						html3 += "<tr>";
						html3 += "<th>청소시간</th>";
						html3 += "<th>내용</th>";
						html3 += "</tr>";
						html3 += "</thead>";
						$.each(data, function(index,item) {
							if(item.length != 0){
							html3 += "<tbody>";
							html3 += "<tr>";
							html3 += "<td>" + item.CLEANING + "</td>";
							html3 += "<td>" + item.CLEANINGREPORT + "</td>";
							html3 += "</tr>";
							html3 += "</tbody>";
							} else{
								html3 += "<tbody>";
								html3 += "<tr>";
								html3 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html3 += "</tr>";
								html3 += "</tbody>";
							}
						})
						html3 += "</table>";
						html3 += "</div>";
						html3 += "</div>";
						$("#menu3").html(html3);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "<div id='menu4' class='tab-pane fade'>";
				html += "<h3>Menu 4</h3>";  
			    html += "<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>";  
			    html += "</div>";
			    html += "<div id='menu5' class='tab-pane fade'>";
				html += "<h3>Menu 5</h3>";  
			    html += "<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>";  
			    html += "</div>";
			    html += "<div id='menu6' class='tab-pane fade'>";
				html += "<h3>Menu 6</h3>";  
			    html += "<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>";  
			    html += "</div>";
			    html += "<div id='menu7' class='tab-pane fade'>";
				html += "<h3>Menu 7</h3>";  
			    html += "<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>";  
			    html += "</div>";
			    html += "<div id='menu8' class='tab-pane fade'>";
				html += "<h3>Menu 8</h3>";  
			    html += "<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>";  
			    html += "</div>";
			    html += "</div>";
			    html += "</div>";
			    
			    $("#tab").html(html);
			
		})
	})

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
 		<td class="col-sm-7" id="tabStart">
 		 <div class="col-md-12" id="tab">
 			<div class="text-left" style="font-weight: bold;">환자</div> 
				<div class="container col-md-12">
  					<h2>환자 스케쥴 입력</h2>
  					<ul class="nav nav-tabs">
						<li class="active">
					    <li><a data-toggle="tab" href="#menu1">식사</a></li>
					    <li><a data-toggle="tab" href="#menu2">운동</a></li>
					    <li><a data-toggle="tab" href="#menu3">청소</a></li>
					    <li><a data-toggle="tab" href="#menu4">세탁</a></li>
					    <li><a data-toggle="tab" href="#menu5">샤워</a></li>
					    <li><a data-toggle="tab" href="#menu6">수면</a></li>
					    <li><a data-toggle="tab" href="#menu7">의사소견</a></li>
					    <li><a data-toggle="tab" href="#menu8">특이사항</a></li>
					</ul>

  				<div class="tab-content">
    				
			    <div id="menu1" class="tab-pane fade in active">
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
			    
			    <div id="menu4" class="tab-pane fade">
			      <h3>Menu 4</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu5" class="tab-pane fade">
			      <h3>Menu 5</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu6" class="tab-pane fade">
			      <h3>Menu 6</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu7" class="tab-pane fade">
			      <h3>Menu 7</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu8" class="tab-pane fade">
			      <h3>Menu 8</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
  			
  				</div>
			</div>
			</div>   			
 		</td>
 		
 		<td rowspan="2" >
 			<div class="col-sm-15">
			<p>Date: <input type="text" class="datepicker"></p>
	 			<div class="panel text-left">  
		      		<div class = 'col-md-15'>
		      			<div class='btn-group btn-group-justified'>
		      				<a href='#' class='btn btn-info'>환자번호</a>
		      				<a href='#' class='btn btn-info'>이름</a>
		      				<a href='#' class='btn btn-info'>호실</a>
		      				<a href='#' class='btn btn-info'>생년월일</a>
		      			</div>
		      			
		      			<div class='list-group text-left' style='height:540px;'>
		      				<c:if test="${patientList != null }">
		      					<table class='text-center'>
				      				<c:forEach var = "item" items="${patientList}">
				      					<tr class='list-group-item' id="${item.pt_no}">
				      						<td width='160px;'>${item.pt_no }</td> 
				      						<td width='160px;'>${item.name }</td>
				      						<td width='160px;'>${item.room_no }</td>
				      						<td width='160px;'>${item.birthdate }</td>
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