<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<<<<<<< HEAD
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
=======
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Protector Page</title>
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    
    <!-- =========================
     SCRIPTS 
============================== -->


    <script src="./resources/js/jquery.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nicescroll.js"></script>
    <script src="./resources/js/owl.carousel.js"></script>
    <script src="./resources/js/wow.js"></script>
    <script src="./resources/js/script.js"></script>


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
    <link rel="stylesheet" href="./resources/css/preloader.css" type="text/css" media="screen, print"/>

    <!-- Icon Font-->
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/owl.carousel.css">
    <link rel="stylesheet" href="./resources/css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="./resources/css/animate.css">

    <!-- Bootstrap -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">



    <!-- Style -->
    <link href="./resources/css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="./resources/css/responsive.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script type="text/javascript">
	
	$(function(){
		
		$(".col-md-6").click(function(){
			
			alert($(this).attr("id"));
					
		})
		
	})
	
	</script>
	
</head>
<body>

<h2> ${id} 반갑습니다 </h2>

<!-- Preloader -->
<div id="preloader">
<div id="status">&nbsp;</div>
</div>
    <header id="HOME" style="background-position: 50% -125px;">
	        <div class="section_overlay">
	     
	        </div>  
	    </section> 
    </header>
    
    <section class="services" id="SERVICE">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center" id = "사진보기">
                    <div class="single_service wow fadeInUp" data-wow-delay="1s">
                  
                         <img alt="" src="./resources/image/icons/play.png">
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa.</p>
                    </div>
                </div>
                
                <div class="col-md-6 text-center" id = "일과보기">
                    <div class="single_service wow fadeInUp" data-wow-delay="2s">
                      
                        <img alt="" src="./resources/image/icons/matureman.png">
                         <img alt="" src="./resources/image/icons/maturewoman.png">
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa.</p>
                    </div>
                </div>
           
               
            </div>            
        </div>
    </section>


</body>
>>>>>>> branch 'master' of https://github.com/OBScmaster/OBScmaster.git
</html>