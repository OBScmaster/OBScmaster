/**
 * 
 */

$(function() {
	
	

	showCameraDivs(100);
	
	
	$("#1").click(function(){
		
		showCameraDivs(100);
		
	})
	
	$("#2").click(function(){
		
		showCameraDivs(200);
		
	})
	
	$("#3").click(function(){
		
		showCameraDivs(300);
		
	})
	
	$("#4").click(function(){
		
		showCameraDivs(400);
		
	})
	
	$("#5").click(function(){
		
		showCameraDivs(500);
		
	})
	
	$("#6").click(function(){
		
		showCameraDivs(600);
		
	})
	
})

function showLog(divArea,part){

	
	var ipaddress;

	if(part==100){
		
		if(divArea==110){
		
			ipaddress="10.10.5.32";
		}else if(divArea==120){
			ipaddress="10.10.5.33";
		}else if(divArea==130){
			ipaddress="10.10.5.34";
		}else if(divArea==140){
			ipaddress="10.10.5.35";
		}else if(divArea==150){
			ipaddress="10.10.5.36";
		}else if(divArea==160){
			ipaddress="10.10.5.37";
		}
		
		
	}else if(part==200){
		
		if(divArea==210){			
			ipaddress="10.10.5.38";
		}else if(divArea==220){
			ipaddress="10.10.5.39";
		}else if(divArea==230){
			ipaddress="10.10.5.40";
		}else if(divArea==240){
			ipaddress="10.10.5.41";
		}else if(divArea==250){
			ipaddress="10.10.5.42";
		}else if(divArea==260){
			ipaddress="10.10.5.43";
		}
		
	}else if(part==300){
		
		if(divArea==310){			
			ipaddress="10.10.5.38";
		}else if(divArea==320){
			ipaddress="10.10.5.39";
		}else if(divArea==330){
			ipaddress="10.10.5.40";
		}else if(divArea==340){
			ipaddress="10.10.5.41";
		}else if(divArea==350){
			ipaddress="10.10.5.42";
		}else if(divArea==360){
			ipaddress="10.10.5.43";
		}
		
	}else if(part==400){
		
		if(divArea==410){			
			ipaddress="10.10.5.38";
		}else if(divArea==420){
			ipaddress="10.10.5.39";
		}else if(divArea==430){
			ipaddress="10.10.5.40";
		}else if(divArea==440){
			ipaddress="10.10.5.41";
		}else if(divArea==450){
			ipaddress="10.10.5.42";
		}else if(divArea==460){
			ipaddress="10.10.5.43";
		}
		
	}else if(part==500){
	
		if(divArea==510){
			ipaddress="10.10.5.44";
			
		}else if(divArea==520){
			
			ipaddress="10.10.5.45";
						
		}else if(divArea==530){
			
			ipaddress="10.10.5.46";
			
		}else if(divArea==540){
			
			ipaddress="10.10.5.47";
			
		}else if(divArea==550){
			
			ipaddress="10.10.5.48";
			
		}else if(divArea==560){		
			
			ipaddress="10.10.5.49";
	}
		
	}else if(part==600){
		
		if(divArea==610){			
			ipaddress="10.10.5.38";
		}else if(divArea==620){
			ipaddress="10.10.5.39";
		}else if(divArea==630){
			ipaddress="10.10.5.40";
		}else if(divArea==640){
			ipaddress="10.10.5.41";
		}else if(divArea==650){
			ipaddress="10.10.5.42";
		}else if(divArea==660){
			ipaddress="10.10.5.43";
		}
		
	}
	
	
	$.ajax({
		
		 type:'get',
		 url:'setCamera',
		
		 success:function(data){
				 
				var camera = ipaddress
					camera+="<img alt='image' src='http://"+ipaddress+":8080/stream/video.mjpeg' onloadeddata="+anotherImg()+">"
					
	         $("#"+divArea+"").html(camera);
	        	
				 
   			 
   		 },
		
		 error:function(e){
			 
			console.log(e);
		 }
		
		
	})

	
	 
	}


function anotherImg(){
	
	$("img").attr("src", "./resources/image/ajax-loader.gif");

}

  function showCameraDivs(part){
	  
	  $('#LogDiv').html("");
	  
	$.ajax({
		
  		 type:'get',
  		 url:'showLogDivs',
  		 
  		 data:{
  			 part:part
  		 },  	
  		 
  			 success:function(data){
  	    		var showDivs="";
  				showDivs+= "<div class='col-sm-4 text-center' id='101' style='height:370px; border:thin; border-style: solid;'>"
  				showDivs+= "<h3>"+(data+1)+"호</h3>"
  				
  					showDivs+="<div id = "+(data+10)+" class='col-md-12' style='height:240px;'></div>" 
  					showLog((data+10),part)
  				showDivs+="</div>"
  				showDivs+="<div class='col-sm-4 text-center' id='102' style='height:370px; border:thin; border-style: solid;'>"
  				showDivs+="<h3>"+(data+2)+"호</h3>"
  				
  					showDivs+="<div id = "+(data+20)+" class='col-md-12' style='height:240px;'></div>" 
  					showLog((data+20),part)  	  			
  				showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='103' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+3)+"호</h3>"
  		    	
  		    		showDivs+="<div id = "+(data+30)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+30),part)
  	  				showDivs+="</div>"
  		    			
  		    if(part==5){
  		    
  		   	showDivs+="<div class='col-sm-4 text-center' id='104' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>출입문</h3>"
  		    	
  		    		showDivs+="<div id = "+(data+40)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+40),part)
  	  				showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='105' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>주차장</h3>"
  		    
  		    		showDivs+="<div id = "+(data+50)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+50),part)
  		    		showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='106' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>식당</h3>"

  		    		showDivs+="<div id = "+(data+60)+" class='col-md-12' style='height:240px;'></div>"
  		    		showLog((data+60),part)
  	  				showDivs+="</div>"	
  		    	
  		    }else{
  		    	
  		    	showDivs+="<div class='col-sm-4 text-center' id='104' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+4)+"호</h3>"
  		    	
  		    		showDivs+="<div id = "+(data+40)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+40),part)
  		    		showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='105' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+5)+"호</h3>"
  		    	
  		    		showDivs+="<div id = "+(data+50)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+50),part)
  		    		showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='106' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+6)+"호</h3>"
  		    	
  		    		showDivs+="<div id = "+(data+60)+" class='col-md-12' style='height:240px;'></div>"
  		    		showLog((data+60),part)
  	  				showDivs+="</div>"
  		    }
      			 $('#LogDiv').html(showDivs);
      			 
      		 },
  		
  		 error:function(e){
  			 
  			console.log(e);
  		 }
  		
  		
  	})
	
}
	