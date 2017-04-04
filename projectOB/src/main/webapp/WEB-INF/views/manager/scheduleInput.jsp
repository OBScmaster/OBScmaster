<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>schedule input</title>
  <meta charset="utf-8">
    <meta name="distributor" content="Global" />
    <meta itemprop="contentRating" content="General" />
    <meta name="robots" content="All" />
    <meta name="revisit-after" content="7 days" />
    <meta name="description" content="The source of truly unique and awesome jquery plugins." />
    <meta name="keywords" content="slider, carousel, responsive, swipe, one to one movement, touch devices, jquery, plugin, bootstrap compatible, html5, css3" />
    <meta name="author" content="w3widgets.com">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="./resources/css/datepicker.css">
  <script src="./resources/js/jquery.min.js"></script>
 <script src="./resources/js/jquery-ui.js"></script> 
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
 
  $(function() {
	  $( "#today" ).datepicker({
	        dateFormat: "yy/mm/dd"	    
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
    			    		  if(item.ppt_name==null){
    			    			  item.ppt_name="-";    			    			  
    			    		  }
    			    		  if(item.ppt_phone==null){
    			    			  item.ppt_phone="-";    			    			  
    			    		  }
    			    		  if(item.ppt_add==null){
    			    			  item.ppt_add="-";    			    			  
    			    		  }
    			    	
    			    		  patientselect+="<div class='list-group-item' name="+item.name+" pt_no="+item.pt_no+" ppt_phone="+item.ppt_phone+" ppt_add="+item.ppt_add+" ppt_name="+item.ppt_name+"><table class='text-center'><tr><td width='160px;'>"
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
    			    		
    			    		
    			    		$("#name").val($(this).attr("name"));
    			    		$("#pt_no").val($(this).attr("pt_no"));
    			    		$("#ppt_phone").val($(this).attr("ppt_phone"));
    			    		$("#ppt_add").val($(this).attr("ppt_add"));
    			    		$("#ppt_name").val($(this).attr("ppt_name"));
    			    		 
    			    	});
    		
    						
    		},
    		 error:function(error){console.log(error);}
    		});
    
     
     $("#dateSelect").click(function(){
    	 
    	 
    	 
    	 alert($("#datepicker").val())
    	 var dates =  "<div class='wrapper col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>선택해주세요</a>"
		    	   	  +"</div>";
    	 
  	    dates+="</div>";
      	 
      	 $("#kk").html(dates);
      	 
  	  
  
  	
  	 
   });
  });
  
  
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
   
    <div class="col-sm-15 well" id="scheduleDiv"> 
  
   <table>
   
    <tr>
    
     <td class="col-sm-3">

    <label class="control-label">환자번호</label>
    </td>
    <td class="col-sm-3">
    
    <input type="text" readonly="readonly" class="form-control" id="pt_no" name="pt_no">
   </td>
     
     <td class="col-sm-3">

    <label class="control-label">이름</label>
    </td>
    <td class="col-sm-3">
    
    <input type="text" readonly="readonly" class="form-control" id="name" name="name">

    </tr>
   
   </table>
 
 </div>
  
  
  <table>
  
  <tr>
  
  <td rowspan="2" >  
 
      <div class="col-sm-7">   
   	 <div class="panel text-left">
     <input type="button" class="btn btn-primary" readonly="readonly" id="patientSelect" value="환자 선택">
	 <input type="button" class="btn btn-primary" readonly="readonly" id="today" name="today" value="날짜 선택">
  	 </div>
     </div>
      
 <div class="col-md-15" id="kk">


</div>
</td>
  
  
  <td class="col-sm-7">
 	<div class="text-left" style="font-weight: bold;">스케쥴입력</div> 
   <div class="col-sm-15 well" id="scheduleDiv"> 
   
   <table>
   
    <tr>
    
     <td class="col-sm-4">

    <label class="control-label">환자번호</label>
    </td>
    <td class="col-sm-10">
    
    <input type="text" readonly="readonly" class="form-control" id="pt_no" name="pt_no">
   </td>
   
  <td rowspan="10">
  
    
   	 
   	 <div class="col-sm-7"> 
   	 
     <input type="button" class="btn btn-primary" readonly="readonly" id="patientSelect" value="환자 선택">
     </div>	 


     <div class="col-sm-7"> 
     <br>
	 <input type="button" class="btn btn-primary" readonly="readonly" id="today" name="today" value="날짜 선택">
     </div>


     <div class="col-sm-7"> <br>
	 <input type="button" class="btn btn-primary" readonly="readonly" id="today" name="today" value="날짜 선택">
     </div>
  
  
   
   </tr>
    
    <tr>
    
     <td class="col-sm-4">

    <label class="control-label">이름</label>
    </td>
    <td class="col-sm-10">
    
    <input type="text" readonly="readonly" class="form-control" id="name" name="name">
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
      <input type="text" readonly="readonly" class="form-control" id="ppt_name" name="ppt_name">
   </td>
   
     <td>
    <label class="control-label">전화번호</label>
     </td>
     <td class="col-sm-3">
      <input type="text" readonly="readonly" class="form-control" id="ppt_phone" name="ppt_phone">
   </td>
   
   
  </tr>
  
    <tr>  
  <td>
    <br>
    <label class="control-label">주소</label>
     </td>
     
     <td colspan="5" class="col-sm-10">
     <br>
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