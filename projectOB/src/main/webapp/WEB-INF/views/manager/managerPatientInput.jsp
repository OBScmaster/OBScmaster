<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
  <script src="./resources/js/manager/patientInput.js"></script>
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
        <li class="active"><a href="managerHome">Home</a></li>
    	<li><a href="managerPatientInfo">담당 환자 정보</a></li>
        <li><a href="scheduleInput">일정관리</a></li>
    	</ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.nurseId}</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="nursePatientInput" method="post" enctype="multipart/form-data" onsubmit='return checkForm()'>

<div class="container text-center">    
  <div class="row content">
  
  <table>
  
  <tr><td class="col-sm-7">
 	<div class="text-left" style="font-weight: bold;">환자</div> 
   <div class="col-sm-15 well"> 
   <table>
   <tr>
   <td rowspan="3" class="col-sm-4">
	  <div class="well"> 
     <img src="" class="img-circle" id="previewImg" name="previewImg" height="100" width="100" alt="등록">
     <input type="file" value="" id="upload" name="upload" style="width: 100%;">
	</div>
   </td>
   
   <td class="col-sm-2">
   
 	 <label class="control-label">이름</label>
     </td>
     
     <td class="col-sm-5">
      <input type="text" class="form-control" id="name" name="name" placeholder="환자의 이름을 입력해주세요">
   </td>
   </tr>
   
   <tr>
   <td  class="col-sm-2">   
     <label class="control-label">생년월일</label>
     </td>
     <td class="col-sm-5">
      <input type="text" class="form-control" id="birthdate" name="birthdate" placeholder="생년월일을 입력해주세요">
   
   </td>
   </tr>
   
   <tr>
   <td  class="col-sm-3">
    <label class="control-label">의료보험번호</label>
     </td>
     <td class="col-sm-5">
      <input type="text" class="form-control" id="ins_no" name="ins_no" placeholder="의료보험번호를 입력해주세요">
   </td>
   </tr>
   
     <tr>     
     <td  colspan="4" class="col-sm-5">
  
     <label class="control-label col-sm-3">전화번호</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력해주세요">
     </div>
    
     </td>     
   </tr>
   
     <tr>     
     <td  colspan="4" class="col-sm-5">
   <br>
     <label class="control-label col-sm-3">주소</label>
     <div class="col-sm-9">
      <input type="text" onclick="postal()" class="form-control" id="address" name="address" placeholder="주소를 입력해주세요">
     </div>
    
     </td>     
   </tr>
   
   
    <tr>
    
     <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">병명</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="desease" name="desease" placeholder="병명을 입력해주세요">
     </div>
    
     </td>     
   </tr>
   
       <tr>
       
       <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">방</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="room_no" name="room_no" readonly="readonly">
   <input type="hidden" class="form-control" id="ipaddress" name="ipaddress" value="127.0.0.1">
     </div>
    
     </td> 
     
   </tr> 
          <tr>
       
       <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">요양사</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" value='${sessionScope.nurseId}' id="nurse_name" readonly="readonly">
      <input type="hidden" class="form-control" value='${sessionScope.nurse_no}' id="nurse_no" name="nurse_no" readonly="readonly">
     </div>
    
     </td>  
   </tr>     
   </table>
 </div>
 </td>

 <td rowspan="2" >  
 
      <div class="col-sm-7">   
   	 <div class="panel text-left">
     <input type="button" class="btn btn-primary" readonly="readonly" id="room_noSelect" value="방선택">
  
     </div>
     </div>
      
 <div class="col-md-15" id="kk">
<div class="btn-group btn-group-justified">

  <a href="#" class="btn btn-info">선택해주세요</a>
  
</div>

<div class="list-group text-left" style="height:540px;">


  <a href="#"> </a>
  
 
</div>    

</div>
</td>

</tr>
 <tr><td class="col-sm-7">

     <div class="text-left" style="font-weight: bold;">보호자</div> 
     <div class="col-sm-15 well"> 
  <table>
  
  <tr>
  <td>
    <label class="control-label">이름</label>
     </td>
     <td class="col-sm-3">
      <input type="text" class="form-control" id="ppt_name" name="ppt_name" placeholder="보호자의 이름을 입력해주세요">
   </td>
   
     <td>
    <label class="control-label">전화번호</label>
     </td>
     <td class="col-sm-3">
      <input type="text" class="form-control" id="ppt_phone" name="ppt_phone" placeholder="보호자의 전화번호를 입력해주세요">
   </td>
   
     <td>
    <label class="control-label">주소</label>
     </td>
     <td class="col-sm-3">
      <input type="text" onclick="postal2()" class="form-control" id="ppt_add" name="ppt_add" placeholder="보호자의 주소를 입력해주세요">
   </td>
  </tr>
  
    <tr>  
  <td>
   <br>
    <label class="control-label">ID</label>
     </td>
     <td class="col-sm-3">
      <input type="text" class="form-control" id="ppt_id" name="ppt_id" placeholder="보호자 ID를 입력해주세요">
   </td>
   
     <td>
      <br>
    <label class="control-label">비밀번호</label>
     </td>
     <td class="col-sm-3">
      <input type="text" class="form-control" id="ppt_pw" name="ppt_pw" placeholder="보호자 비밀번호를 입력해주세요">
   </td>
 
  </tr>
  
  
  </table>
     
    </div>
    
</td></tr>    
    
    </table>


</div>
</div>

<div class="container-fluid text-center">
<input type="submit" class="btn btn-primary" id='patientInsert' value="등록">
<button type="button" class="btn btn-primary" id='patientInsertCancel'>취소</button>
</div>
<br>

 </form>

 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>

</html>