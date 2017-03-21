

$(document).ready(function () {
	
	 $('#loginSubmit').click(function(){
			 
		 if($(':radio[name="divider"]:checked').length<1){
			 alert("선택해주세요");		
			 return false;
		 }
	    }); 
	
	
	 
	
			 
    $('.forgot-pass').click(function(event) {
      $(".pr-wrap").toggleClass("show-pass-reset");
    }); 
    
    $('.pass-reset-submit').click(function(event) {
      $(".pr-wrap").removeClass("show-pass-reset");
    }); 
	 
    
});