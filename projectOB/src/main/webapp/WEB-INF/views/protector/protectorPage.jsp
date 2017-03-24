<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
 <head>
    <meta charset="utf-8">
    <script src= "./resources/js/jquery-3.1.1.js"></script>
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
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <!-- Respomsive slider -->
    <link href="./resources/css/responsive-calendar.css" rel="stylesheet">
    <script src="./resources/js/jquery.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/responsive-calendar.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
    	  var today = new Date();
    	  var dd = today.getDate();
    	  var mm = today.getMonth()+1; //January is 0!
    	  var yyyy = today.getFullYear();
    	  if(dd<10) {
    	      dd='0'+dd
    	  } 
    	  if(mm<10) {
    	      mm='0'+mm
    	  } 
    	  
        $(".responsive-calendar").responsiveCalendar({
          time: yyyy + '-' + mm,
          events: {
            "2013-04-30": {"number": 5, "url": "http://w3widgets.com/responsive-slider"},
            "2013-04-26": {"number": 1, "url": "http://w3widgets.com"}, 
            "2013-05-03":{"number": 1}, 
            "2013-06-12": {}}
        });
      });
    </script>
  </head>
  <body>
    <div class="container">
      <!-- Responsive calendar - START -->
    	<div class="responsive-calendar">
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
      
    </div>
  </body>
</html>