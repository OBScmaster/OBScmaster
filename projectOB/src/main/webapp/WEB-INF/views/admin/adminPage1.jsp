<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agency - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="./resources/adminPage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./resources/adminPage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="./resources/adminPage/css/agency.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">${sessionScope.id } Welcome!!</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="adminLogout">Logout</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#team">Team</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Welcome To Our Hospital!</div>
                <div class="intro-heading">It's Nice To Meet You</div>
                <a href="#services" class="page-scroll btn btn-xl">About us</a>
            </div>
        </div>
    </header>

    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    <h3 class="section-subheading text-muted">We provide these services</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <a href = "#"><img alt="" src="./resources/image/icons/play.png"></a>
                    <h4 class="service-heading">Web-Camera</h4>
                    <p class="text-muted"></p>
                </div>
                <div class="col-md-4">
                    <a href="adminNurseInput"><img alt="" src="./resources/image/icons/Nurse.png"></a>
                    <h4 class="service-heading">요양사등록</h4>
                    <p class="text-muted"></p>
                </div>
                <div class="col-md-4">
                    <a href="adminPatientInput"><img alt="" src="./resources/image/icons/matureman.png"></a>
                    <a><img alt="" src="./resources/image/icons/maturewoman.png"></a>
                    <h4 class="service-heading">환자등록</h4>
                    <p class="text-muted"></p>
                </div>
            </div>
            
                  <div class="row text-center">
           
                <div class="col-md-6">
                    <a href="adminNurseInfo"><img alt="" src="./resources/image/icons/Nurse.png"></a>
                    <h4 class="service-heading">요양사관리</h4>
                    <p class="text-muted"></p>
                </div>
                <div class="col-md-6">
                    <a href="adminPatientInfo"><img alt="" src="./resources/image/icons/matureman.png"></a>
                    <a><img alt="" src="./resources/image/icons/maturewoman.png"></a>
                    <h4 class="service-heading">환자관리</h4>
                    <p class="text-muted"></p>
                </div>
            </div>
            
        </div>
    </section>

    <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="./resources/adminPage/img/team/1.jpg" class="img-responsive img-circle" alt="">
                        <h4>박재만</h4>
                        <p class="text-muted">Leader</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="./resources/adminPage/img/team/2.jpg" class="img-responsive img-circle" alt="">
                        <h4>경민호</h4>
                        <p class="text-muted">Developer</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="./resources/adminPage/img/team/2.jpg" class="img-responsive img-circle" alt="">
                        <h4>김동준</h4>
                        <p class="text-muted">Developer</p>
                    </div>
                </div>
                 <div class="col-sm-3">
                    <div class="team-member">
                        <img src="./resources/adminPage/img/team/3.jpg" class="img-responsive img-circle" alt="">
                        <h4>백민선</h4>
                        <p class="text-muted">Developer</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">감사용</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

    <!-- jQuery -->
    <script src="./resources/adminPage/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./resources/adminPage/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <!-- Contact Form JavaScript -->
    <script src="./resources/adminPage/js/jqBootstrapValidation.js"></script>
    <script src="./resources/adminPage/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="./resources/adminPage/js/agency.min.js"></script>

</body>

</html>