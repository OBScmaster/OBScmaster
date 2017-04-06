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
    		 url:"nurselist",  
    		 contentType:"application/json; charset=utf-8",
    		 dataType:"json",
    		 success:function(data){
    			
    			 
    			 var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>요양사번호</a>"
 			    	+"<a href='#' class='btn btn-info'>이름</a>"
			    	  +"<a href='#' class='btn btn-info'>전화번호</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='patientgroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    		  if(item.name==null){
    			    			  item.name="-";    			    			  
    			    		  }
    			    		  patientselect+="<div class='list-group-item' previewImg="+item.savefile+" phone="+item.phone+" cert_no="+item.cert_no+" nurse_no="+item.nurse_no+" name="+item.name+"><table class='text-center'><tr><td width='190px;'>"
    			    		  +item.nurse_no+"</td><td width='250px;'>"
    			    		  +item.name+"</td><td width='200px;'>"
    			    		  +item.phone+"</td></tr></table></div>";
    			    		  
    			    	  })
    			    	
    			    	patientselect+="</div></div>";
    			    	
    			    	$("#kk").html(patientselect);
    			    	
    			    	 if(data.length>11){
     			    		$("#patientgroup").css("overflow","scroll");
     			    	};
     			    	$(".list-group-item").click(function(){
      			    		
      			    		$(".list-group-item").css("color","black");
      			    		$(this).css("color","red");
      			    		
      			    	   $("#cert_no").attr("readonly","readonly");
      			    	   $("#name").attr("readonly","readonly");
      			    	   $("#phone").attr("readonly","readonly");
      			    	
      			    	 
      			    	
      			    		
      			    		$("#cert_no").val($(this).attr("cert_no"));
      			    		$("#phone").val($(this).attr("phone"));
      			    		$("#name").val($(this).attr("name"));
      			    	
    			    		
    			    		$("#fd").remove();
    			    		$("#upload").remove();
    			    		
    			    		$("#nurseUpdate").remove();
    			    		
    			    		$("#buttt").prepend("<button type='button' class='btn btn-primary' id='nurseUpdate'>수정</button>");
    			    		 
    			    		$("#nurseUpdate").click(function(){
    			    			  
    			    			   $("#nurseUpdate").remove();
    			    			   $("#buttt").prepend("<input type='submit' class='btn btn-primary' id='fd' value=확인>");
    			    			   $("#picdiv").append( "<input type='file' value='' id='upload' name='upload' style='width: 100%;'>");
    			    			 
    			    			  
    			    			  
    			    			   $("#phone").removeAttr("readonly");
    			    			 
    			    		    			    			  
    			    			   $("#upload").on('change', function(){
    			    			          readURL(this);
    			    			      });
    			    	
    			    			 })
    			    		
    			    		
    			    		
    			    		$("#previewImg").attr("src","");
    			    		
    			    		if($(this).attr('previewImg')!="-"){
    			    			
    			    		$("#previewImg").attr("src","./resources/image/nursefile/"+$(this).attr('previewImg'));
    			    		
    			    		}else{
    			    			$("#previewImg").attr("alt","이미지 없음");
    			    			
    			    		}

    						 $("#upload").on('change', function(){
    			    		          readURL(this);
    			    		 });
    			    		
    						//환자목록
    				    		$.ajax({
    		    		    		 
    		    		    		type:"get",
    		    		    		 url:"patientList",
    		    		    		 data:{nurse_no:$(this).attr("nurse_no")},
    		    		    		 success:function(data){
    		    		    			 		    		
    		    		    			
    		    		    			 var patientselect = " <button class='form-control dropdown-toggle' type='button' data-toggle='dropdown' readonly='readonly'>환자목록<span class='caret'></span></button>"
    		    		    			 +"";
    		    		    			    	  
    		    		    			    	  $.each(data,function(index,item){    			    		    			    	
    		    		    			    	
    		    		    			    		  patientselect+="<input type='text' class='form-control' readonly='readonly' value="+item.name+">";
    		    		    			    		  
    		    		    			    	  })
    		    		    			    	
    		    		    			    	patientselect+="";
    		    		    			    	
    		    		    			    	$("#patientList").html(patientselect);
    		    		    			    	
    		    		    			    	 if(data.length>11){
    		    		     			    		$("#patientgroup").css("overflow","scroll");
    		    		     			    	};
    		    									
    		    		    						
    		    		    		},
    		    		    		 error:function(error){
    		    		    			 
    		    		    			 console.log(error);}
    		    		    		});
    						 
    			    	
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
    	  alert("이미지 파일을 선택해 주세요"); 
      	document.getElementById("previewImg").src="";
      	document.getElementById("upload").value="";
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
        <li>
                 
    <a class="active dropdown dropdown-toggle" data-toggle="dropdown">환자 관리</a>
    <ul class="active dropdown-menu">
      <li><a href="adminPatientInput">환자 등록</a></li>
      <li><a href="adminPatientInfo">환자 정보</a></li>
    </ul>
 

        </li>
        
         <li><a href="adminNurseInput">요양사 등록</a></li>
        
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자계정</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="updateNurse" method="post" enctype="multipart/form-data">

<div class="container text-center"> 
   
  <div class="row content">
  
    <div class="col-sm-5 well">
    
     <div class="panel text-left">
      <div class="wel well-lg" id="picdiv">
 
     <img src="" class="img-circle" id="previewImg" name="previewImg" height="100" width="100" alt="등록">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
    

      </div>
      </div>
      
      <br>
      <br>
      
     <div class="form-group">
     <label class="control-label col-sm-3">자격증 번호</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" readonly="readonly" id="cert_no" name="cert_no">
     </div>
     </div>

        
        <br>
        <br>
        
       <div class="form-group">
     <label class="control-label col-sm-3">이름</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" readonly="readonly" id="name" name="name" >
     </div>
     </div>
        
       <br>
       <br>
       
         <div class="form-group">
     <label class="control-label col-sm-3">전화번호</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" readonly="readonly" id="phone" name="phone">
     </div>
     </div>
     
     <br>
       <br>
       
         <div class="form-group" >
     <label class="control-label col-sm-3">환자</label>
     <div class="col-sm-9" id="patientList">
     
     <input type="text" class="form-control" id="pt_name" readonly="readonly">

     </div>
     </div>
     
    
     
    </div>
    
    
   
    
    
   <div class="col-sm-7">   
   
   
    <div class="panel text-left">
  
 	 <button type="button" class="btn btn-primary" id="nurseInfo">간호사 정보</button>
  	 
  	
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

<div class="container-fluid text-center" id="buttt">
<button type="button" class="btn btn-primary" id='nurseUpdate' >수정</button>
<button type="button" class="btn btn-primary" id='nurseInsertCancel'>취소</button>
</div>
<br>

 </form>

 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>