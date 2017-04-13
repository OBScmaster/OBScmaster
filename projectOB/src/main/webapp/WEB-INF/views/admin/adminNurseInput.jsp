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
  var pt_no;
  var pt_name;
  var i=0;
  var remo;
  var remos = new Array();
  var remoCancel;
  
  var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  $(function() {
	  
	  patientlist();
	  
      $("#upload").on('change', function(){
          readURL(this);
      });
      
      $("#addPatient").click(function(){
    	  remos[i]=remo;
    	  i++;
    	  remo.hide();
    	  $.ajax({
    		  type:"get",
     		 url:"addPatient", 
     		 data:{
     			pt_no:pt_no,
     			pt_name:pt_name
     		 },
     		success:function(data){
     			
     			var patientadd="";
     			 $.each(data,function(index,item){ 
     		    					 
     			   	patientadd +="<input type='text' class='form-control' id='pt_name' value="+item.pt_name+" readonly='readonly'>"
     	     		+"<input type='hidden' class='form-control' id='pt_no' value="+item.pt_no+" name='pt_no'>"
     		
     			 })
     			 
     			patientadd += "<input type='text' class='form-control' id='ptname' readonly='readonly'>";
     			 
     			 $("#moreP").html(patientadd);
     			 $("#moreP .form-control").click(function(){
     				remoCancel=$(this);
     		      });
     		
     			  
     		},
     		error:function(e){}    		  
    	  })   	  
    	    	   
    	  
      });  
      
    	
      
        $("#removePatient").click(function(){
        
        	remoCancel=remos[remos.length-1];      
        	remoCancel.show();        
        	remos.pop();
        	
        		$.ajax({
          		  type:"get",
           		 url:"removePatient", 
           		
           		success:function(data){
           			
           			var patientadd="";
           			 $.each(data,function(index,item){
           			   	patientadd +="<input type='text' class='form-control' id='pt_name' value="+item.pt_name+" readonly='readonly'>"
           	     			+"<input type='hidden' class='form-control' id='pt_no' value="+item.pt_no+" name='pt_no'>"
           				 
           			 })
           			 patientadd += "<input type='text' class='form-control' id='ptname' readonly='readonly'>";
           			  $("#moreP").html(patientadd);
           		},
           		error:function(e){}    		  
          	  })  
          	
        
        		  
        
      });
      
  	$("#nurseInsertCancel").click(function(){
			if(confirm("메인메뉴로 돌아가시겠습니까?")){
				location.href="adminLogin"
			 }
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
  
  function patientlist(){
	  
	  $.ajax({  		 
  		type:"get",
  		 url:"patientlist",  
  		 contentType:"application/json; charset=utf-8",
  		 dataType:"json",
  		 success:function(data){
  			 

 			  data.sort(function(a,b) {
 		  			
 		  	        var val1 = a.pt_no;  	  
 		  	        var val2 = b.pt_no;
 		  	    
 		  	        return(val1>val2)?-1:(val1<val2)?1:0;
 		  	    });
  			
  			 var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>환자명</a>"
			    	+"<a href='#' class='btn btn-info'>생년월일</a>"
			    	  +"<a href='#' class='btn btn-info'>병명</a>"
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
  			    		  
  			    		  if(item.disease==null){
  			    			  item.disease="겡끼";    			    			  
  			    		  }
  			    	
  			    		  patientselect+="<div class='list-group-item' name="+item.name+" pt_no="+item.pt_no+" ppt_phone="+item.ppt_phone+" ppt_add="+item.ppt_add+" ppt_name="+item.ppt_name+"><table class='text-center'><tr><td width='190px;'>"
  			    		  +item.name+"</td><td width='250px;'>"
  			    		  +item.birthdate+"</td><td width='200px;'>"
  			    		  +item.disease+"</td></tr></table></div>";
  			    		  
  			    	  })
  			    	
  			    	patientselect+="</div></div>";
  			    	
  			    	$("#kk").html(patientselect);
  			    	
  			    	 if(data.length>11){
   			    		$("#patientgroup").css("overflow","scroll");
   			    	};
   			    	
   			    	
						$(".list-group-item").click(function(){
						
  			    		$(".list-group-item").css("color","black");
  			    		$(this).css("color","red");    			    		
  			    		pt_name=$(this).attr("name")	    		
  			    		pt_no=$(this).attr("pt_no")
  			    		$("#ptname").val(pt_name);
  			    		remo=$(this);
  			    		
  			    	});
  		
  						
  		},
  		 error:function(error){console.log(error);}
  		});
	  
  }
  
 function checkForm(){
	  

	 
	 if(document.getElementById("upload").value.length<1){
		  
		  alert("사진을 선택해 주세요");
		  
		  return false;
	}
	  
	  if(document.getElementById("name").value.length<1){
		  
		  alert("이름을 입력해 주세요");
		  
		  return false;
	  }
	  
 	if(document.getElementById("cert_no").value.length<1){
 		
 		  alert("자격증 번호를 입력해 주세요");
		  
		  return false;
	  }
 
	 if(document.getElementById("id").value.length<1){
	  
		  alert("요양사의 아이디를 입력해 주세요");
		  
	  return false;
 	}
	 
	 if(document.getElementById("password").value.length<1){
		  
		  alert("요양사의 비밀번호를 입력해 주세요");
		  
		  return false;
	}
	  
	 return true;
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