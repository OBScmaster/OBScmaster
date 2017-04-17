/**
 * 
 */

 var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  $(function() {
      $("#upload").on('change', function(){
          readURL(this);
      });
      

    	
    	$.ajax({
    	
    		 type:"post",
    		 url:"roomlist",
    		 success:function(data){
    			 
    			 var roomselect = "<div class='col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>방번호</a>"
 			    	+"<a href='#' class='btn btn-info'>최대인원</a>"
			    	  +"<a href='#' class='btn btn-info'>현재인원</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='roomgroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    		  
    			    		  var full='';
    			    		  if(item.present!=item.maximum){
    			    			full=item.room_no+"호";
    							}else{
    							full=item.room_no+"호　풀방";
    							}
    			    	
    			    		  roomselect+="<div class='list-group-item' present="+item.present+" maximum="+item.maximum+" id="+item.room_no+" rel='popover' data-content='' title="+full+"><table class='text-center'><tr><td width='160px;'>"
    			    		  +item.room_no+"호</td><td width='160px;'>"
    			    		  +item.maximum+"명</td><td width='160px;'>"
    			    		  +item.present+"명</td></tr></table></div>";
    			    		  
    			    	  })
    			    	
    			    	roomselect+="</div></div>";
    			    	
    			    	$("#kk").html(roomselect);
    			    	
    			    	 if(data.length>11){
     			    		$("#roomgroup").css("overflow","scroll");
     			    	};
     			    	
     			    	
			    		$('div[rel=popover').popover({placement: 'left', html: true, trigger:'hover', content: function(){
			    		    var room = $(this).attr('id');
			    					    		    
			    		    var imagePath = '';
			    		    
			    		    if(room<200){
			    		    	imagePath='<img width=250px height=200px src=./resources/image/rooms/for4.jpg />'
			    		    }else if(room<300){
			    		    	imagePath='<img width=250px height=200px src=./resources/image/rooms/for6.JPG />'
			    		    }else if(room<400){
			    		    	imagePath='<img width=250px height=200px src=./resources/image/rooms/for2.JPG />'
			    		    }else if(room<500){
			    		    	imagePath='<img width=250px height=200px src=./resources/image/rooms/for1.jpg />'
			    		    }
			    		    			    			
			    			return imagePath;}});
			    		
     			    	
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
  