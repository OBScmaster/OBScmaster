<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ page session="true"%>
<html>
 <head>
    <meta charset="utf-8">
    <title>Responsive Calendar Widget that will make your day</title>
    <meta name="distributor" content="Global" />
    <meta itemprop="contentRating" content="General" />
    <meta name="robots" content="All" />
    <meta name="revisit-after" content="7 days" />
    <meta name="description" content="The source of truly unique and awesome jquery plugins." />
    <meta name="keywords" content="slider, carousel, responsive, swipe, one to one movement, touch devices, jquery, plugin, bootstrap compatible, html5, css3" />
    <meta name="author" content="w3widgets.com">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
    <!-- Bootstrap -->
     <link rel="stylesheet" 
     href="./resources/css/bootstrap.min.css">
 
    <!-- Respomsive slider -->
    <link href="./resources/css/responsive-calendar.css" rel="stylesheet">
    <script src="./resources/js/jquery.js"></script>
    <script src= "./resources/js/jquery-3.1.1.js"></script>    
    <script src="./resources/js/responsive-calendar.js"></script>
    <script type="text/javascript">
    $( document ).ready( function() {     
    	
    	var pt_no = $("#pt_no").val();
   
    	
    	$("#web-camera").click(function(){
    		window.open("showVideo?pt_no="+pt_no,"","width=500,height=300");
    	})
    	
    	$(".responsive-calendar").responsiveCalendar({
    	    weekends: false,
    	    onDayClick: function(events) {    	    	  
    	    	  $('.active').removeClass('active');
    	    	  var year = $(this).data('year')
    	    	  var month = $(this).data('month')
    	    	  var day = $(this).data('day');
    	    	  var dayLink = $('[data-day=' + day + '][data-month=' + month + '][data-year=' + year + ']')
    	    	  dayLink.parent().addClass('active');    	    	  
    	    	  if(month<10){
      	    		  month="0"+month
      	    	  }
    	    	  if(day<10){
    	    		  day="0"+day
      	    	  }
    	    	  var daycheck = year + "/" + month + "/" + day;    	    	
    	    	  location.href="dailyschedule?today="+daycheck+"&pt_no="+pt_no;
    	    	}
    		});
    	
    	
    	$.ajax({
    		
    		 type:"get",
    		 url:"showLog",
    		 data:{
    			 pt_no:pt_no
    			 },
    		 
    		 success:function(data){
    			
    			 var logdata="<table class='table text-center'><tr><td>시간</td><td>일</td><td>등급</td></tr>"
    			 
    			 $.each(data,function(index,item){
    				
    				 logdata+="<tr><td>"+item.timeonlog+"</td><td>"+item.text+"</td><td>"+item.grade+"</td></tr>"
    				 
    			 })
    			 
    			 logdata+="</table>"
    			 
    			 $("#log").html(logdata);
    			 
    			 if(data.length>9){
    				 $("#log").css("overflow","scroll")
    			 }
    			 
    		 },
    		
    		 error:function(e){
    			 
    			console.log(e);
    		 }
    		
    		
    	})
    	});
    </script>
  </head>
  <body>
   <input type="hidden" id="pt_no" name="pt_no" value="${id.pt_no}">
  
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
        <li class="active"><a href="patientLogin">Home</a></li>
        <li><a href="showVideo?pt_no=${id.pt_no}">웹캠</a></li>
        <li><a href="#">로그</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${id.name}보호자님 환영</a></li>
      </ul>
    </div>
  </div>
</nav>
  
    <div class="container">
      <!-- Responsive calendar - START -->
    	<div class="responsive-calendar col-md-8">
        	<div class="controls">
           	 <a class="pull-left" data-go="prev"><div class="btn btn-primary">Prev</div></a>
            	<h4><span data-head-year></span> <span data-head-month></span></h4>
            	<a class="pull-right" data-go="next"><div class="btn btn-primary">Next</div></a>
        	</div><hr/>
        	<div class="day-headers">
        	  <div class="day header">Mon</div>
        	  <div class="day header">Tue</div>
        	  <div class="day header">Wed</div>
        	  <div class="day header">Thu</div>
	          <div class="day header">Fri</div>
	          <div class="day header">Sat</div>
         	 <div class="day header">Sun</div>
      	  </div>
      	  <div class="days" data-group="days">         
        </div>
     	</div>
      <!-- Responsive calendar - END -->
   
    
    <div id = "wrapper" class="col-md-4" style='height:300px;'>
    	<div id = "web-camera">
    		Web-Camera
    		<img alt="" src="./resources/image/icons/play.png">
   		</div>
   		
   	</div>
   	
   <div id = "log" class="col-md-4" style='height:300px;'>
   		LOG
   	</div>
   	
   	 </div>
   	 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
    
  </body>
</html>

