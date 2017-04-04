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
  <style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
  </style>
  <script type="text/javascript">
  var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  $(function() {
	  
	  $.ajax({  		 
    		type:"get",
    		 url:"patientlist",  
    		 contentType:"application/json; charset=utf-8",
    		 dataType:"json",
    		 success:function(data){
    			
    			 var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>환자번호</a>"
 			    	+"<a href='#' class='btn btn-info'>환자명</a>"
			    	  +"<a href='#' class='btn btn-info'>생년월일</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='patientgroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    		  if(item.ppt_name==null){
    			    			  item.ppt_name="-";    			    			  
    			    		  }
    			    		  if(item.ppt_phone==null){
    			    			  item.ppt_phone="-";    			    			  
    			    		  }
    			    		  if(item.ppt_add==null){
    			    			  item.ppt_add="-";    			    			  
    			    		  }
    			    	
    			    		  patientselect+="<div class='list-group-item' name="+item.name+" pt_no="+item.pt_no+" ppt_phone="+item.ppt_phone+" ppt_add="+item.ppt_add+" ppt_name="+item.ppt_name+"><table class='text-center'><tr><td width='190px;'>"
    			    		  +item.pt_no+"</td><td width='250px;'>"
    			    		  +item.name+"</td><td width='200px;'>"
    			    		  +item.birthdate+"</td></tr></table></div>";
    			    		  
    			    	  })
    			    	
    			    	patientselect+="</div></div>";
    			    	
    			    	$("#kk").html(patientselect);
    			    	
    			    	 if(data.length>11){
     			    		$("#patientgroup").css("overflow","scroll");
     			    	};
							$(".list-group-item").click(function(){
    			    		
    			    		$(".list-group-item").css("color","black");
    			    		$(this).css("color","red");
    			    		
    			    		
    			    		$("#pt_name").val($(this).attr("name"));
    			    		$("#pt_no").val($(this).attr("pt_no"));
    			  
    			    		 
    			    	});
    		
    						
    		},
    		 error:function(error){console.log(error);}
    		});
	  
	  
	  
      $("#upload").on('change', function(){
          readURL(this);
      });
      
      $("#addPatient").click(function(){
    	  alert("Adsfasdf");
      });
    	 
      
     
      
  });

  function readURL(input) {
	  var img = document.getElementById("upload").files;
      
      if (!fileType.test(img[0].type)) {
    	alert("이미지 파일을 업로드 하세요"); 
       return; 
      }
      if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
              $('#previewImg').attr('src', e.target.result);
          }

        reader.readAsDataURL(input.files[0]);
      }
  }
  

 
  
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
        <li class="active"><a href="adminLogin">Home</a></li>
        <li><a href="adminPatientInput">환자등록</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자계정</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="insertNurse" method="post" enctype="multipart/form-data">

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
      <input type="text" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
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
     <div class="col-sm-9">
     <input type="text" class="form-control" id="pt_name" readonly="readonly">
     <input type="hidden" class="form-control" value=0 id="pt_no" name="pt_no">
     </div>
     </div>
     
    </div>
    
    
    
   <div class="col-sm-7">   
    <div class="panel text-left">
  
 	 <button type="button" class="btn btn-primary" id="addPatient">환자등록</button>
  	 <button type="button" class="btn btn-primary" id="cancelAddPatient">환자삭제</button>
  	
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