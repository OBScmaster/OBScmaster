<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
<title>Log</title>
<script type="text/javascript">


$(function(){
	

	
	var ipaddress = $("#ipaddress").val();
	var today = $("#today").val();
	
setInterval(function(){
	
	$.ajax({
		
		 type:'get',
		 url:'showMyLog',
		 data:{
			 ipaddress:ipaddress,
			 today:today
			 },
		success:function(data){
				
				 if(data.length>1){
					 var logdata="<table class='text-center'>"
						 logdata+="<tr><th width='100'>시간</th><th width='100'>사건</th><th width='50'>종류</th></tr>"
	        			 $.each(data,function(index,item){        			
	        				 logdata+="<tr><td>"+item.timeonlog+"</td><td>"+item.text+"</td><td>"+item.sensortype+"</td></tr>"
	        			
	        			 })
	        			 
	        			 logdata+="</table>"
	        			 
	        			 $("#logDiv").html(logdata);
	        			 
	        			 
	        			$(window).scrollTop($("#logDiv")[0].scrollHeight);
					  
					     
					     $("table tr:last").css('color','red');
	        			 
				 }else{
					 $("#logDiv").html("없음");
				 }
	    	 
				 
   			 
   		 },
		
		 error:function(e){
			
			console.log(e);
		 }
		
		
	})
	
	
},1000)
	
})

</script>
</head>
<body>
<h3>${sessionScope.id.room_no}호의 로그 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ${today}</h3>

<input type="hidden" id="ipaddress" value="${ipaddress}">
<input type="hidden" id="today" value="${today}">
<div class="panel" id="logDiv">


</div>





</body>
</html>