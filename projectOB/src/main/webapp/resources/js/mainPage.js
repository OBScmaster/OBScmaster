/**
 * 
 */
function test(){
	
	 if($(':radio[name="divider"]:checked').val()=="manager"){
					
		 $('#loginForm').attr("action","managerLogin");
		 
		 if($('#id').val()=="admin"){
				$('#loginForm').attr("action","adminLogin");				
			}
		 
	 }else{
		 
		 $('#loginForm').attr("action","patientLogin");
		 
		 if($('#id').val()=="admin"){
				alert("관리자는 관계자 버튼을 클릭 후 로그인 해 주세요");
			}
	 }
	
}


$(function(){
	
	// Checking for CSS 3D transformation support
	$.support.css3d = supportsCSS3D();
	
	var formContainer = $('#formContainer');
	
	// Listening for clicks on the ribbon links
	$('.flipLink').click(function(e){
		
		// Flipping the forms
		formContainer.toggleClass('flipped');
		
		// If there is no CSS3 3D support, simply
		// hide the login form (exposing the recover one)
		if(!$.support.css3d){
			$('#login').toggle();
		}
		e.preventDefault();
	});
	
	formContainer.find('form').submit(function(e){
		// Preventing form submissions. If you implement
		// a backend, you might want to remove this code
		e.preventDefault();
	});
	
	
	// A helper function that checks for the 
	// support of the 3D CSS3 transformations.
	function supportsCSS3D() {
		var props = [
			'perspectiveProperty', 'WebkitPerspective', 'MozPerspective'
		], testDom = document.createElement('a');
		  
		for(var i=0; i<props.length; i++){
			if(props[i] in testDom.style){
				return true;
			}
		}
		
		return false;
	}
});
