<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>schedule input</title>
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
      
      var nurse_no = $("#nurse_no").val();
     
      $.ajax({
    		 
    		type:"get",
    		 url:"patientList",
    		 data:{nurse_no:nurse_no},
    		 success:function(data){
    	 
    			 var patientselect = "<div class='col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>환자번호</a>"
 			    	+"<a href='#' class='btn btn-info'>환자명</a>"
			    	  +"<a href='#' class='btn btn-info'>생년월일</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='patientgroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    	
    			    		  patientselect+="<div class='list-group-item' id="+item.pt_no+"><table class='text-center'><tr><td width='160px;'>"
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
    			    		/* $("#patient_no").val($(this).attr("id")); */
    			    		
    			    		 $.ajax({
    			        		 
    			    	    		type:"get",
    			    	    		 url:"patientInput",
    			    	    		 data:{pt_no:$(this).attr("id")},
    			    	    		 success:function(data){
    			    	    	 
    			    	    			 var patientselect = "<table>"
    			    	    			 
    			    	    				+"<tr><td>번호</td><td><input type='text' class=form-control readonly='readonly' name=pt_no id='pt_no' value="+data.pt_no+"></td></tr>"
    			    	    			    +"<tr><td>이름</td><td><input type='text' class=form-control readonly='readonly' name='name' id='name' value="+data.name+"></td></tr>"
    			    	    			    
    			    	    			    
    			    	    			    +"</table>";
    			    	    			    
    			    	    			  $("#scheduleDiv").html(patientselect);
    			    	    			 
    			    	    			  if(data.ppt_name==null)
    			    	    				  data.ppt_name="　";
    			    	    			  if(data.ppt_add==null)
    			    	    				  data.ppt_add="　";
    			    	    			  if(data.ppt_id==null)
    			    	    				  data.ppt_id="　";
    			    	    			  if(data.ppt_phone==null)
    			    	    				  data.ppt_phone="　";
    			    	    				  
    			    	    			 var showProtector="<table><tr><td><label class=control-label>이름</label></td><td class=col-sm-3>"
    			    	    			     +"<input type=text value="+data.ppt_name+" readonly=readonly class=form-control id=ppt_name name=ppt_name>"
    			    	    			   +"</td><td><label class=control-label>전화번호</label></td><td class=col-sm-3>"
    			    	    			     +"<input type=text value="+data.ppt_phone+" readonly=readonly class=form-control id=ppt_phone name=ppt_phone>"
    			    	    			   +"</td><td><br><label class=control-label>ID</label></td><td class=col-sm-3>"
    			    	    			     +"<input type=text value="+data.ppt_id+" readonly=readonly class=form-control id=ppt_id name=ppt_id>"
    			    	    			   +"</td></tr><tr><td><label class=control-label>주소</label>"
    			    	    			     +"</td><td colspan=6 class=col-sm-10>"
    			    	    			      +"<input type=text value="+data.ppt_add+" readonly=readonly class=form-control id=ppt_add name=ppt_add>"
											+"</td></tr></table>"
    			    	    			 
    			    	    			  $("#protectorDiv").html(showProtector);
    			    	    						
    			    	    		},
    			    	    		 error:function(error){console.log(error);}
    			    	    		})
    			    		
    			    		
    			    		
    			    		
    			    		
    			    		
    			    	 
    			    	});
    		
    						
    		},
    		 error:function(error){console.log(error);}
    		})
    		
    		
    	
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

<input type="hidden" id="nurse_no" name="nurse_no" value="${nurse.nurse_no}">

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
        <li class="active"><a href="managerLogin">Home</a></li>
        <li><a href="managerPatientInput">환자 등록</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${nurse.id}</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="nursePatientInput" method="post" enctype="multipart/form-data">

<div class="container text-center">    
  <div class="row content">
  
  <table>
  
  <tr>
  
  <td rowspan="2" >  
 
      <div class="col-sm-7">   
   	 <div class="panel text-left">
     <input type="button" class="btn btn-primary" readonly="readonly" id="patientSelect" value="환자를 선택해주세요">
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
 	<div class="text-left" style="font-weight: bold;">스케쥴입력</div> 
   <div class="col-sm-15 well" id="scheduleDiv"> 
   <table>
   <tr>
   <td rowspan="3" class="col-sm-4">
	  <div class="well"> 
     <img src="" class="img-circle" id="previewImg" name="previewImg" height="100" width="100" alt="등록">
     <input type="file" value="" id="upload" name="upload" style="width: 100%;">
	</div>
   </td>
   
   <td class="col-sm-2">
   
 	 <label class="control-label">환자명</label>
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
     </div>
    
     </td> 
     
   </tr> 
          <tr>
       
       <td  colspan="4" class="col-sm-5">
  <br>
     <label class="control-label col-sm-3">요양사</label>
     <div class="col-sm-9">
      <input type="text" class="form-control" id="nurse_name" readonly="readonly">
      <input type="hidden" class="form-control" id="nurse_no" name="nurse_no" readonly="readonly">
     </div>
    
     </td>  
   </tr>     
   </table>
 </div>
 </td>

 

</tr>


 <tr><td class="col-sm-7">

     <div class="text-left" style="font-weight: bold;">보호자</div> 
     <div class="col-sm-15 well" id="protectorDiv"> 
  <table>
  
  <tr>
  <td>
    <label class="control-label">이름</label>
     </td>
     <td class="col-sm-3">
      <input type="text" readonly="readonly" class="form-control" id="ppt_name" name="ppt_name">
   </td>
   
     <td>
    <label class="control-label">전화번호</label>
     </td>
     <td class="col-sm-3">
      <input type="text" readonly="readonly" class="form-control" id="ppt_phone" name="ppt_phone">
   </td>
   
     <td>
   <br>
    <label class="control-label">ID</label>
     </td>
     <td class="col-sm-3">
      <input type="text" readonly="readonly" class="form-control" id="ppt_id" name="ppt_id">
   </td>
   
  </tr>
  
    <tr>  

 <td>
    <label class="control-label">주소</label>
     </td>
     <td colspan="6" class="col-sm-10">
      <input type="text" readonly="readonly" class="form-control" id="ppt_add" name="ppt_add">
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