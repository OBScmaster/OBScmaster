<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Page</title>
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
		
		$(".col-md-4").click(function(){
			
			alert($(this).attr("id"));
					
		})
		
	})
	
	</script>
	
</head>
<body>


<h1>admin님 환영합니다</h1>


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
                <div class="col-md-4 text-center" id = "사진보기">
                    <div class="single_service wow fadeInUp" data-wow-delay="1s">
                  
                        <h2>ddd</h2>
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa.</p>
                    </div>
                </div>
                
                <div class="col-md-4 text-center" id = "일과보기">
                    <div class="single_service wow fadeInUp" data-wow-delay="2s">
                      
                        <h2>Development</h2>
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa.</p>
                    </div>
                </div>
                <div class="col-md-4 text-center" id = "기타">
                    <div class="single_service wow fadeInUp" data-wow-delay="3s">
                        
                        <h2>Photography</h2>
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa.</p>
                    </div>
                </div>
               
            </div>            
        </div>
    </section>
    
</body>
</html>