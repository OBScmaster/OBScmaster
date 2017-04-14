<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>AdminNurseInput</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
   <script src="./resources/js/admin/nurseInput.js"></script>
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
        <li class="active"><a href="adminLogin">Home</a></li>
            <li>
                 
    <a class="active dropdown dropdown-toggle" data-toggle="dropdown">환자 관리</a>
    <ul class="active dropdown-menu">
      <li><a href="adminPatientInput">환자 등록</a></li>
      <li><a href="adminPatientInfo">환자 정보</a></li>
    </ul>
 

        </li>
        
          <li><a href="adminNurseInfo">요양사 정보</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자계정</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="insertNurse" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">

<div class="container text-center"> 
   
  <div class="row content">
  
    <div class="col-sm-5 well">
    
     <div class="panel text-left">
      <div class="wel well-lg" >
 
     <img src="" class="img-circle" id="previewImg" name="previewImg" height="100" width="100" alt="등록">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
    <input type="file" value="" id="upload" name="upload" style="width: 100%;">

      </div>
      </div>
      
      <br>
      <br>
      
     <div class="form-group">
     <label class="control-label col-sm-3">자격증 번호</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="cert_no" name="cert_no" placeholder="자격증번호를 입력해주세요">
     </div>
     </div>
     
     <br>
     <br>
      
       <div class="form-group">
     <label class="control-label col-sm-3">ID</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="id" name="id" placeholder="ID를 입력해주세요">
     </div>
     </div>
        
        <br>
        <br>
        
        <div class="form-group">
     <label class="control-label col-sm-3">비밀번호</label>
     <div class="col-sm-9">
      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
     </div>
     </div>
        
        <br>
        <br>
        
       <div class="form-group">
     <label class="control-label col-sm-3">이름</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요">
     </div>
     </div>
        
       <br>
       <br>
       
         <div class="form-group">
     <label class="control-label col-sm-3">전화번호</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력해주세요">
     </div>
     </div>
     
     <br>
       <br>
       
         <div class="form-group">
     <label class="control-label col-sm-3">환자</label>
     <div class="col-sm-9" id="moreP">
     
     <input type="text" class="form-control" id="ptname" readonly="readonly">
     <input type="hidden" class="form-control" value=0 id="pt_no" name="pt_no">
    
     
     </div>
     </div>
     
    </div>
    
    
    
   <div class="col-sm-7">   
    <div class="panel text-left">
  
 	 <button type="button" class="btn btn-primary" id="addPatient">환자등록</button>
  	 <button type="button" class="btn btn-primary" id="removePatient">환자삭제</button>
  	
    </div>
    
    <br>
    </div>
    
 <div class="col-md-15" id="kk">   
 

</div>

<div class="list-group text-left" style="height:540px;">


  <a href="#"> </a>
  

</div>

 
</div>
    

</div>

<div class="container-fluid text-center">
<input type="submit" class="btn btn-primary" id='nurseInsert' value="등록">
<button type="button" class="btn btn-primary" id='nurseInsertCancel'>취소</button>
</div>
<br>

 </form>

 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>