<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>AdminPatientInput</title>
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
  <script type="text/javascript">
  var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  $(function() {
	  
	  $("#upload").on('change', function(){
          readURL(this);
      });
      
      $.ajax({
 		 
  		type:"get",
  		 url:"patientlist",
  	  success:function(data){
  			 
  			 var patientselect = "<div class='col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>환자번호</a>"
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
  			    		  if(item.phone==null){
  			    			  item.phone="-";    			    			  
  			    		  }
  			    		  if(item.disease==null){
  			    			  item.disease="-";    			    			  
  			    		  }  			    		 
  			    		  if(item.ppt_add==null){
  			    			  item.ppt_add="-";    			    			  
  			    		  }
  			    		  if(item.nurse_no==null){
  			    			  item.nurse_no="-";    			    			  
  			    		  }   		 
  			    	      if(item.address==null){
  			    			  item.address="-";    			    			  
  			    		  }
  			    	      
  			    	    if(item.savedphoto==null){
			    			  item.savedphoto="-";    			    			  
			    		  }
  			    	
  			    		  patientselect+="<div class='list-group-item' previewImg="+item.savedphoto+" phone="+item.phone+" disease="+item.disease+" room_no="+item.room_no+" ins_no="+item.ins_no+" birthdate="+item.birthdate+" nurse_no="+item.nurse_no+" address="+item.address+" name="+item.name+" pt_no="+item.pt_no+" ppt_phone="+item.ppt_phone+" ppt_add="+item.ppt_add+" ppt_name="+item.ppt_name+"><table class='text-center'><tr><td width='160px;'>"
  			    		  +item.pt_no+"</td><td width='160px;'>"
  			    		  +item.name+"</td><td width='160px;'>"
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
  			    		
  			    	   $("#ppt_name").attr("readonly","readonly");
  			    	   $("#phone").attr("readonly","readonly");
  			    	   $("#disease").attr("readonly","readonly");
  			    	   $("#address").attr("readonly","readonly");
  			    	   $("#ppt_phone").attr("readonly","readonly");
  			    	   $("#ppt_add").attr("readonly","readonly");
  			    	
  			    		
  			    		$("#name").val($(this).attr("name"));
  			    		$("#phone").val($(this).attr("phone"));
  			    		$("#ins_no").val($(this).attr("ins_no"));
  			    		$("#address").val($(this).attr("address"));
  			    		$("#birthdate").val($(this).attr("birthdate"));
  			    		$("#disease").val($(this).attr("disease"));
  			    		$("#room_no").val($(this).attr("room_no"));
  			    		$("#nurse_no").val($(this).attr("nurse_no"));
  			    		
  			    		
			    		$("#pt_no").val($(this).attr("pt_no"));
			    		$("#ppt_phone").val($(this).attr("ppt_phone"));
			    		$("#ppt_add").val($(this).attr("ppt_add"));
			    		$("#ppt_name").val($(this).attr("ppt_name"));
			    		
			    		$("#fd").remove();
			    		$("#upload").remove();
			    		
			    		$("#patientUpdate").remove();
			    		
			    		$("#buttt").prepend("<button type='button' class='btn btn-primary' id='patientUpdate'>수정</button>");
			    		 
			    		$("#patientUpdate").click(function(){
			    			  
			    			   $("#patientUpdate").remove();
			    			   $("#buttt").prepend("<input type='submit' class='btn btn-primary' id='fd' value=확인>");
			    			   $("#picdiv").append( "<input type='file' value='' id='upload' name='upload' style='width: 100%;'>");
			    			 
			    			  
			    			   $("#ppt_name").removeAttr("readonly");
			    			   $("#phone").removeAttr("readonly");
			    			   $("#disease").removeAttr("readonly");
			    			   $("#address").removeAttr("readonly");
			    			   $("#ppt_phone").removeAttr("readonly");
			    			   $("#ppt_add").removeAttr("readonly");
			    			  
			    			   $("#upload").on('change', function(){
			    			          readURL(this);
			    			      });
			    			   
			    			   $("#address").click(function(){
			    				   
			    					 new daum.Postcode({
			    				        oncomplete: function(data) {
			    				        	$("#address").val(data.address);
			    				    }
			    				    }).open();
			    				
			    				})
			    				
			    				$("#ppt_add").click(function(){
			    					
			    					 new daum.Postcode({
			    				        oncomplete: function(data) {
			    				        	$("#ppt_add").val(data.address);
			    				    }
			    				    }).open();
			    				
			    				})
			    			   

			    			 })
			    		
			    		
			    		
			    		$("#previewImg").attr("src","");
			    		
			    		if($(this).attr('previewImg')!="-"){
			    			
			    		$("#previewImg").attr("src","./resources/image/patientfile/"+$(this).attr('previewImg'));
			    		
			    		}else{
			    			$("#previewImg").attr("alt","이미지 없음");
			    			
			    		}

						 $("#upload").on('change', function(){
			    		          readURL(this);
			    		 });
			    		
			    		
					});
  		
  						
  		},
  		 error:function(error){console.log(error);}
  		});
      
      
 

      
  		$("#patientUpdateCancel").click(function(){})
    	  
  		
  	    	  
  			
  	    	  
  	      
    		
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
  
  function postal(){
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#address").val(data.address);
	    }
	    }).open();
	    
	}
  
  function postal2(){
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#ppt_add").val(data.address);
	    }
	    }).open();
	    
	}
  
  function dad() {

	$("#name").val();
	$("#room_no").val();
	$("#birthdate").val();
	$("#ins_no").val();
	  
	  
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
            <li class="active">
                 
    <a class="active dropdown dropdown-toggle" data-toggle="dropdown">환자 관리</a>
    <ul class="active dropdown-menu">
      <li><a href="adminPatientInput">환자 등록</a></li>
      <li><a href="adminPatientInfo">환자 정보</a></li>
    </ul>
 

        </li>
        
          <li class="active">
                 
    <a class="active dropdown dropdown-toggle" data-toggle="dropdown">요양사 관리</a>
    <ul class="active dropdown-menu">
      <li><a href="adminNurseInput">요양사 등록</a></li>
      <li><a href="adminNurseInfo">요양사 정보</a></li>
    </ul>
 

        </li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자계정</a></li>
      </ul>
    </div>
  </div>
</nav>


<form action="updatePatient" method="post" enctype="multipart/form-data" id="updateForm" name="updateForm" onsubmit="dad()">
<input type="hidden" id="pt_no" name="pt_no">
<div class="container text-center">    
  <div class="row content">
  
  <table>
  
  <tr>
  
  
 <td rowspan="2" >  
 
      <div class="col-sm-7">   
   	 <div class="panel text-left">
     <input type="button" class="btn btn-primary" readonly="readonly" id="room_noSelect" value="전체 환자 정보">
  	
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
  
  <td class="col-sm-7">
 	<div class="text-left" style="font-weight: bold;">환자</div> 
   <div class="col-sm-15 well"> 
   <table>
   <tr>
   <td rowspan="3" class="col-sm-4">
	  <div class="well" id="picdiv"> 
    <img src='' class='img-circle' id='previewImg' name='previewImg' height='100' width='100'>
   <!--   <input type="file" value="" id="upload" name="upload" style="width: 100%;"> -->
	</div>
   </td>
   
   <td class="col-sm-2">
   
 	 <label class="control-label">이름</label>
     </td>
     
     <td class="col-sm-5">
      <input type="text" class="form-control" id="name" name="name" readonly="readonly">
   </td>
   </tr>
   
   <tr>
   <td  class="col-sm-2">   
     <label class="control-label">생년월일</label>
     </td>
     <td class="col-sm-5">
      <input type="text" class="form-control" id="birthdate" name="birthdate" readonly="readonly">
   
   </td>
   </tr>
   
   <tr>
   <td  class="col-sm-3">
    <label class="control-label">의료보험번호</label>
     </td>
     <td class="col-sm-5">
      <input type="text" class="form-control" id="ins_no" name="ins_no" readonly="readonly">
   </td>
   </tr>
   
     <tr>     
     <td  colspan="4" class="col-sm-5">
  
     <label class="control-label col-sm-3">전화번호</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="phone" name="phone" readonly="readonly">
     </div>
    
     </td>     
   </tr>
   
     <tr>     
     <td  colspan="4" class="col-sm-5">
   <br>
     <label class="control-label col-sm-3">주소</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="address" name="address" readonly="readonly">
     </div>
    
     </td>     
   </tr>
   
    <tr>
    
     <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">병명</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="disease" name="disease" readonly="readonly">
     </div>
    
     </td>     
   </tr>
   
       <tr>
       
       <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">방</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="room_no" name="room_no" readonly="readonly">
     </div>
    
     </td> 
     
   </tr> 
          <tr>
       
       <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">요양사</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="nurse_name" readonly="readonly">
      <input type="hidden" class="form-control" value=0 id="nurse_no" name="nurse_no" readonly="readonly">
     </div>
    
     </td>  
   </tr>     
   </table>
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
      <input type="text" class="form-control" id="ppt_name" name="ppt_name" readonly="readonly">
   </td>
   
     <td>
    <label class="control-label">전화번호</label>
     </td>
     <td class="col-sm-3">
      <input type="text" class="form-control" readonly="readonly" id="ppt_phone" name="ppt_phone">
   </td>
   
     <td>
    <label class="control-label">주소</label>
     </td>
     <td class="col-sm-3">
      <input type="text" readonly="readonly" class="form-control" id="ppt_add" name="ppt_add">
   </td>
  </tr>
  
     
  
  </table>
     
    </div>
    
</td></tr>    
    
    </table>


</div>
</div>

<div class="container-fluid text-center" id="buttt">
<button type="button" class="btn btn-primary" id='patientUpdate'>수정</button>
<button type="button" class="btn btn-primary" id='patientUpdateCancel'>취소</button>
</div>
<br>

 </form>

 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>

</html>