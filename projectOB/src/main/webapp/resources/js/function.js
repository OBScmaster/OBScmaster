 /*		 $.ajax({		
				type:"POST",
				url:"roomregist",
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify({	
				
					room_no:"205",
					maximum:4,
					present:3,
					deleteflag:"1"					
					
				}),
				dataType:"json",
				sucess:function(data){					
					alert(data);				
				},
				error:function(e){					
					console.log(e);				
				}
			});*/

$(document).ready(function () {
	
	 $('#loginSubmit').click(function(){
		 
		 if($(':radio[name="divider"]:checked').length<1){
			 alert("선택해주세요");		
			 return false;
		 }else{
		 
		 alert($(':radio[name="divider"]:checked').val())
	 }		 
	    }); 
	
	
	 
	
			 
    $('.forgot-pass').click(function(event) {
      $(".pr-wrap").toggleClass("show-pass-reset");
    }); 
    
    $('.pass-reset-submit').click(function(event) {
      $(".pr-wrap").removeClass("show-pass-reset");
    }); 
	 
    
});