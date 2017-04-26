<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>AdminLog</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/admin/log.js"></script>
  <style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
  </style>
 
  <script type="text/javascript"></script>
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
        <li class="active"><a href="adminHome">Home</a></li>
   
   <li><a class="active dropdown dropdown-toggle" data-toggle="dropdown">환자 관리</a>
    <ul class="active dropdown-menu">
      <li><a href="adminPatientInput">환자 등록</a></li>
      <li><a href="adminPatientInfo">환자 정보</a></li>
     </ul>
 

      </li> 
      
  <li><a class="active dropdown dropdown-toggle" data-toggle="dropdown">요양사 관리</a>   
       <ul class="active dropdown-menu">    
         <li><a href="adminNurseInput">요양사 등록</a></li>
          <li><a href="adminNurseInfo">요양사 정보</a></li>          
       </ul>
        </li>   
            <li><a href="adminCamera">카메라</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자계정</a></li>
      </ul>
    </div>
  </div>
</nav>

 <div class="container" >

 <div class="col-md-12" id="kk">
 
<div class="btn-group btn-group-justified">

  <a href="#" id="1" class="btn btn-info">2, 3층</a>
  <a href="#" id="2" class="btn btn-info">4, 5층</a>
  <a href="#" id="3" class="btn btn-info">6층, 그외</a>
  
</div>
 
</div>   
 
 
 
<div id="LogDiv"></div>




</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>