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
      
    $("#room_noSelect").click(function(){
    	
    	$.ajax({
    	
    		 type:"post",
    		 url:"roomlist",
    		 success:function(data){
    			 
    			 var roomselect = "<div class='col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>방번호</a>"
 			    	+"<a href='#' class='btn btn-info'>최대인원</a>"
			    	  +"<a href='#' class='btn btn-info'>현재인원</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='roomgroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    	
    			    		  roomselect+="<div class='list-group-item' present="+item.present+" maximum="+item.maximum+" id="+item.room_no+"><table class='text-center'><tr><td width='160px;'>"
    			    		  +item.room_no+"호</td><td width='160px;'>"
    			    		  +item.maximum+"명</td><td width='160px;'>"
    			    		  +item.present+"명</td></tr></table></div>";
    			    		  
    			    	  })
    			    	
    			    	roomselect+="</div></div>";
    			    	
    			    	$("#kk").html(roomselect);
    			    	
    			    	 if(data.length>11){
     			    		$("#roomgroup").css("overflow","scroll");
     			    	};
     			    	
							$(".list-group-item").click(function(){


								if($(this).attr("present")!=$(this).attr("maximum")){
									
									$(".list-group-item").css("color","black");
		    			    		$(this).css("color","red");
		    			    		$("#room_no").val($(this).attr("id"));
		    			    		
									
								}else{
									
									alert($(this).attr("id")+"호실은 정원이 다 찼습니다");
								}
    			    		
    			    	});
    		
    						
    		},
    		 error:function(error){console(error);}
    		})
    	
    })
    
      $("#nurse_noSelect").click(function(){
    	
    	$.ajax({
    	
    		 type:"post",
    		 url:"nurselist",
    		 success:function(data){
    			 
    			 var nurseselect =  "<div class='col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>사번</a>"
    			    	+"<a href='#' class='btn btn-info'>이름</a>"
    			    	  +"<a href='#' class='btn btn-info'>전화번호</a>"
    			    	  +"</div><div class='list-group text-left' style='height:540px;' id='nursegroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    	
    			    		  nurseselect+="<div class='list-group-item' id="+item.nurse_no+" nursename="+item.name+"><table class='text-center'><tr><td width='160px;'>"
    			    		  +item.nurse_no+"</td><td width='160px;'>"
    			    		  +item.name+"</td><td width='160px;'>"
    			    		  +item.phone+"</td></tr></table></div>";
    			    	
    			    	  })
    			    	
    			    	nurseselect+="</div></div>";
    			    	
    			    	$("#kk").html(nurseselect);
    			    	
    			   	 if(data.length>11){
  			    		$("#nursegroup").css("overflow","scroll");
  			    	};
    			    	
    			    	$(".list-group-item").click(function(){
    			    		
    			    		$(".list-group-item").css("color","black");
    			    		$(this).css("color","red");
							$("#nurse_name").val($(this).attr("nursename"));
							$("#nurse_no").val($(this).attr("id"));
    			    	});
    		
    						
    		},
    		 error:function(error){console(error);}
    		})
    		})
    		
    		$("#patientInsertCancel").click(function(){
    			if(confirm("메인메뉴로 돌아가시겠습니까?")){
    				location.href="managerLogin"
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
 
  
  function checkForm(){
	  
		 if(document.getElementById("upload").value.length<1){
			  
			  alert("사진을 선택해 주세요");
			  
			  return false;
		}
	  
	  if(document.getElementById("name").value.length<1){
		  
		  alert("이름을 입력해 주세요");
		  
		  return false;
	  }
	  
 	if(document.getElementById("ins_no").value.length<1){
 		
 		  alert("의료 보험 번호를 입력해 주세요");
		  
		  return false;
	  }
 
	 if(document.getElementById("birthdate").value.length<1){
	  
		  alert("생년월일을 입력해 주세요");
		  
	  return false;
 	}
	 
	 if(document.getElementById("room_no").value.length<1){
		  
		  alert("방을 선택해 주세요");
		  
		  return false;
	}
	 
	 if(document.getElementById("ppt_id").value.length>0&&document.getElementById("ppt_pw").value.length<1){
		  
		  alert("보호자의 비밀번호를 입력해 주세요");
	
		  		  
		  return false;
	}
	 
	 if(document.getElementById("ppt_id").value.length<1&&document.getElementById("ppt_pw").value.length>0){
		  
		  alert("보호자의 아이디를 입력해 주세요");
		  		  
		  return false;
	}
	 
	 if(document.getElementById("ppt_id").value.length<1&&document.getElementById("ppt_pw").value.length<1&&document.getElementById("ppt_phone").value.length<1&&document.getElementById("ppt_name").value.length<1&&document.getElementById("ppt_add").value.length<1){
		  
		  if(confirm("보호자의 정보를 설정하지 않겠습니까?")){
		  return true;
		  }else{		  		  
		  return false;
		  }
		  
	}	 
	 
	 if(document.getElementById("ppt_id").value.length<1&&document.getElementById("ppt_pw").value.length<1){
		  
		  if(confirm("보호자의 아이디를 설정하지 않겠습니까?")){
		  return true;
		  }else{		  		  
		  return false;
		  }
		  
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
           <li><a href="adminPatientInfo">환자 정보</a></li>        
          <li>
                 
    <a class="dropdown dropdown-toggle" data-toggle="dropdown">요양사 관리</a>
    <ul class="dropdown-menu">
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

<form action="insertPatient" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">

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
      <input type="text" class="form-control" id="disease" name="disease" placeholder="병명을 입력해주세요">
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

 <td rowspan="2" >  
 
      <div class="col-sm-7">   
   	 <div class="panel text-left">
     <input type="button" class="btn btn-primary" readonly="readonly" id="room_noSelect" value="방선택">
  	 <input type="button" class="btn btn-primary" readonly="readonly" id="nurse_noSelect" value="요양사선택">
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