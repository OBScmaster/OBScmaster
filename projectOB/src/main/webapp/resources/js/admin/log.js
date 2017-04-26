/**
 * 
 */
$(function() {

	showDivs(1);
	
	$("#1").click(function(){
		
		showDivs(1);
		
	})
	
	$("#2").click(function(){
		
		showDivs(3);
		
	})
	
	$("#3").click(function(){
		
		showDivs(5);
		
	})
	
})

function showLog(divArea,part){
	
	var ipaddress;
	
	if(part==1){
		
		if(divArea==11){
			ipaddress="10.10.5.32";
		}else if(divArea==21){
			ipaddress="10.10.5.33";
		}else if(divArea==31){
			ipaddress="10.10.5.34";
		}else if(divArea==41){
			ipaddress="10.10.5.35";
		}else if(divArea==51){
			ipaddress="10.10.5.36";
		}else if(divArea==61){
			ipaddress="10.10.5.37";
		}
		
		
	}else if(part==3){
		
		if(divArea==13){			
			ipaddress="10.10.5.38";
		}else if(divArea==23){
			ipaddress="10.10.5.39";
		}else if(divArea==33){
			ipaddress="10.10.5.40";
		}else if(divArea==43){
			ipaddress="10.10.5.41";
		}else if(divArea==53){
			ipaddress="10.10.5.42";
		}else if(divArea==63){
			ipaddress="10.10.5.43";
		}
		
	}else if(part==5){
		
		if(divArea==15){
			ipaddress="10.10.5.44";
		}else if(divArea==25){
			ipaddress="10.10.5.45";
		}else if(divArea==35){
			ipaddress="10.10.5.46";
		}else if(divArea==45){
			ipaddress="10.10.5.47";
		}else if(divArea==55){
			ipaddress="10.10.5.48";
		}else if(divArea==65){
			ipaddress="10.10.5.49";
		}
		
	}
	
		setInterval(function() { 	
	    	$.ajax({
	    		
	    		 type:'get',
	    		 url:'showLog',
	    		 data:{
	    			 ipaddress:ipaddress
	    			 },
	    		 
	    			 success:function(data){
	    				 
	    				 if(data.length>1){
	    					 var logdata="<table class='divArea table text-center'>"
	    	        			 
	    	        			 $.each(data,function(index,item){        			
	    	        				 logdata+="<tr><td>"+item.timeonlog+"</td><td>"+item.text+"</td><td>"+item.sensortype+"</td></tr>"
	    	        			})
	    	        			 
	    	        			 logdata+="</table>"
	    	        			 
	    	        			 $("#"+divArea+"").html(logdata);
	    	        			 
	    	        			 if(data.length>9){
	    	        				$("#"+divArea+"").css('overflow','scroll');
	    	        				$("#"+divArea+"").scrollTop($("#"+divArea+"")[0].scrollHeight);
	    	        				$('.divArea tr:last').css('color','red');
	    	        			 } 
	    	        			 
	    				 }else{
	    					 $("#"+divArea+"").html("없음");
	    				 }
	    	    	 
	    				 
	        			 
	        		 },
	    		
	    		 error:function(e){
	    			 
	    			console.log(e);
	    		 }
	    		
	    		
	    	})
	    	
	}, 1000);
		
	}


  function showDivs(part){
	  
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
  				showDivs+= "<h3>"+(data+1)+"층 중앙복도</h3>"
  				showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  					showDivs+="<div id = "+(data+10)+" class='col-md-12' style='height:240px;'></div>" 
  					showLog((data+10),part)
  				showDivs+="</div>"
  				showDivs+="<div class='col-sm-4 text-center' id='102' style='height:370px; border:thin; border-style: solid;'>"
  				showDivs+="<h3>"+(data+1)+"층 왼쪽복도</h3>"
  				showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  					showDivs+="<div id = "+(data+20)+" class='col-md-12' style='height:240px;'></div>" 
  					showLog((data+20),part)  	  			
  				showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='103' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+1)+"층 오른쪽복도</h3>"
  		    	showDivs+=	"<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  		    		showDivs+="<div id = "+(data+30)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+30),part)
  	  				showDivs+="</div>"
  		    			
  		    if(part==5){
  		    
  		   	showDivs+="<div class='col-sm-4 text-center' id='104' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>출입문</h3>"
  		    	showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  		    		showDivs+="<div id = "+(data+40)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+40),part)
  	  				showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='105' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>주차장</h3>"
  		    	showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  		    		showDivs+="<div id = "+(data+50)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+50),part)
  		    		showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='106' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>식당</h3>"
  		    	showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  		    		showDivs+="<div id = "+(data+60)+" class='col-md-12' style='height:240px;'></div>"
  		    		showLog((data+60),part)
  	  				showDivs+="</div>"	
  		    	
  		    }else{
  		    	
  		    	showDivs+="<div class='col-sm-4 text-center' id='104' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+2)+"층 중앙복도</h3>"
  		    	showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  		    		showDivs+="<div id = "+(data+40)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+40),part)
  		    		showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='105' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+2)+"층 왼쪽복도</h3>"
  		    	showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
  		    		showDivs+="<div id = "+(data+50)+" class='col-md-12' style='height:240px;'></div>" 
  		    		showLog((data+50),part)
  		    		showDivs+="</div>"
  		    	showDivs+="<div class='col-sm-4 text-center' id='106' style='height:370px; border:thin; border-style: solid;'>"
  		    	showDivs+="<h3>"+(data+2)+"층 오른쪽복도</h3>"
  		    	showDivs+="<table class='table text-center'><tr><td>시간</td><td>사건</td><td>종류</td></tr></table>"
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
	