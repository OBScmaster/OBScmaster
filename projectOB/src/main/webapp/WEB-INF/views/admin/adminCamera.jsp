<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>AdminCamera</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
  <script src="./resources/js/admin/camera.js"></script>
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
            <li><a href="adminLog">로그 정보</a></li>
      </ul>
      
      
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자계정</a></li>
      </ul>
    </div>
  </div>
</nav>

 <div class="container" >
 
   <div class="col-sm-12">   
   	 <div class="panel text-center">

     <input type="button" class="btn btn-primary" readonly="readonly" id="1" value="1층">
  	 <input type="button" class="btn btn-primary" readonly="readonly" id="2" value="2층">
     <input type="button" class="btn btn-primary" readonly="readonly" id="3" value="3층">
  	 <input type="button" class="btn btn-primary" readonly="readonly" id="4" value="4층">
  	 <input type="button" class="btn btn-primary" readonly="readonly" id="5" value="5층">
  	 <input type="button" class="btn btn-primary" readonly="readonly" id="6" value="6층">
     
     
     </div>
     </div>
 
 
 
 
<div id="LogDiv"></div>




</div>

<footer class="container-flpuid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>