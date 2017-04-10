/**
 * 
 */
 var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  $(function() {
	  
	  $("#upload").on('change', function(){
          readURL(this);
      });
      
      $.ajax({
 		 
  	  type:"get",
  	  url:"patientlist",
  	  contentType:"application/json; charset=utf-8",
  	  dataType:"json",
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
  			    		  if(item.phone==null){
  			    			  item.phone="-";    			    			  
  			    		  }
  			    		  if(item.disease==null){
  			    			  item.disease="-";    			    			  
  			    		  } 
  			    		  
  			    		var add = item.address;
			    	      if(add==null){
			    	    	address="-";    			    			  
			    		  }else{  			    			  
			    			  var address=add.replace(/ /gi,',');
			    			 } 
			    	 	  
  			    		var pptadd = item.ppt_add;
  			    		  if(pptadd==null){
  			    			pptadd="-";    			    			  
  			    		  }else{  			    			  
  			    			var ppt_add=pptadd.replace(/ /gi,',');
  			    		
  			    		}
  			    		  
  			    		  if(item.nurse_no==null){
  			    			  item.nurse_no="-";    			    			  
  			    		  }   
  			    	      
  			    	      if(item.savedphoto==null){
			    			  item.savedphoto="-";    			    			  
			    		  }
  			    
  			    		  patientselect+="<div class='list-group-item' previewImg="+item.savedphoto+" phone="+item.phone+" disease="+item.disease+" room_no="+item.room_no+" ins_no="+item.ins_no+" birthdate="+item.birthdate+" nurse_no="+item.nurse_no+" name="+item.name+" pt_no="+item.pt_no+" ppt_phone="+item.ppt_phone+" ppt_name="+item.ppt_name+">"
  			    		  +"<table class='text-center'><tr><tr><td><input type=hidden id="+item.pt_no+"Address value="+address+"><input type=hidden id="+item.pt_no+"PPTadd value="+ppt_add+"></td></tr><td width='160px;'>"
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
  			    		
   			    		var pt_no = $(this).attr("pt_no")
   			    		
  			    		$(".list-group-item").css("color","black");
  			    		$(this).css("color","red");
  			    		
  			    	   $("#ppt_name").attr("readonly","readonly");
  			    	   $("#phone").attr("readonly","readonly");
  			    	   $("#disease").attr("readonly","readonly");
  			    	   $("#address").attr("readonly","readonly");
  			    	   $("#ppt_phone").attr("readonly","readonly");
  			    	   $("#ppt_add").attr("readonly","readonly");
  			    	
  			    		
  			    		$("#name").val($(this).attr("name"));
  			    		$("#phone").val($(this).attr("phone"));
  			    		$("#ins_no").val($(this).attr("ins_no"));
  			    		
  			    		var add=$("#"+pt_no+"Address").val();
  			    		 var address = add.replace(/,/gi," ");
  			    		$("#address").val(address);
  			    		
  			    		var pptadd=$("#"+pt_no+"PPTadd").val();
  			    	  var ppt_add = pptadd.replace(/,/gi," ");
  			    		
  			    		$("#ppt_add").val(ppt_add);
  			    	
  			    		$("#birthdate").val($(this).attr("birthdate"));
  			    		$("#disease").val($(this).attr("disease"));
  			    		$("#room_no").val($(this).attr("room_no"));
  			    		
  			    		$("#nurse_no").val($(this).attr("nurse_no"));
  			    		
  			    		$.ajax({
  			    			type:"get",
  			    			 url:"nursename",
  			    			data:{nurse_no:$(this).attr("nurse_no")},
  			    		  	  success:function(data){ $("#nurse_name").val(data);},
  			    		  	  error:function(e){console.log(e)}
  			    			
  			    		})
  			    		
			    		$("#pt_no").val(pt_no);
			    		$("#ppt_phone").val($(this).attr("ppt_phone"));
			    	
			    		$("#ppt_name").val($(this).attr("ppt_name"));
			    		
			    		$("#fd").remove();
			    		$("#upload").remove();
			    		
			    		$("#patientUpdate").remove();
			    		$("#room_noSelect").remove();
			    		$("#buttt").prepend("<button type='button' class='btn btn-primary' id='patientUpdate'>수정</button>");
			    		 
			    		$("#patientUpdate").click(function(){
			    			
			    			$("#patientUpdateCancel").click(function(){
			    	  			if(confirm("수정을 취소하시겠습니까")){
			    		  			location.href="adminPatientInfo";
			    					}
			    	  		})
			    			  
			    			   $("#patientUpdate").remove();
			    			
			    			var buttons="<div class='panel text-left' id='selectBtn'>"
			    			+"<input type='button' class='btn btn-primary' readonly='readonly' id='room_Select' value='방 변경'>&nbsp;"
			    			+"<input type='button' class='btn btn-primary' readonly='readonly' id='nurse_Select' value='요양사 변경'></div>"
			    			   
				    			$("#selectBtn").html(buttons);
				    			
				    			$("#buttt").prepend("<input type='submit' class='btn btn-primary' id='fd' value=확인>");
			    			   $("#picdiv").append( "<input type='file' value='' id='upload' name='upload' style='width: 100%;'>");
			    			 
			    			  
			    			   $("#ppt_name").removeAttr("readonly");
			    			   $("#phone").removeAttr("readonly");
			    			   $("#disease").removeAttr("readonly");
			    			   $("#address").removeAttr("readonly");
			    			   $("#ppt_phone").removeAttr("readonly");
			    			   $("#ppt_add").removeAttr("readonly");
			    			  
			    			   $("#upload").on('change', function(){
			    			          readURL(this);
			    			      });
			    			   
			    			   
			    			   $("#address").click(function(){
			    				
			    				if(address==$("#address").val()){
			    				postal();
			    				}   				
			    							    				
			    			   })
			    				
			    				$("#ppt_add").click(function(){
			    				
			    				if(address==$("#ppt_add").val()){
			    				postal2();
			    				}
			    					
			    				})
						    	
						    	roomSelect();
						    		
						    		$("#nurse_Select").click(function(){
						    		nurseSelect();
						    		});
						    	
			    			   

			    			 })
			    		
			    		
			    		
			    		$("#previewImg").attr("src","");
			    		
			    		if($(this).attr('previewImg')!="-"){
			    			
			    		$("#previewImg").attr("src","./resources/image/patientfile/"+$(this).attr('previewImg'));
			    		
			    		}else{
			    			$("#previewImg").attr("alt","이미지 없음");
			    			
			    		}

						 $("#upload").on('change', function(){
			    		          readURL(this);
			    		 });
			    		
						
			    		
					});
   			    	
  		
  						
  		},
  		 error:function(error){console.log(error);}
  		});
      
    
 	 $("#patientUpdate").click(function(){
			if(document.getElementById("name").value.length<1){
				alert("수정할 환자를 선택해 주세요"); 
			 }
			 
		 })
     		
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

	  
	if(document.getElementById("phone").value=="-"){
			 document.getElementById("phone").value="";
	}
	  
	if(document.getElementById("address").value=="-"){
		  document.getElementById("address").value="";
	}
	  
	if(document.getElementById("disease").value=="-"){
		 document.getElementById("disease").value="";
	  }

	 if(document.getElementById("ppt_name").value=="-"){
		 document.getElementById("ppt_name").value="";
	}
	 
	 if(document.getElementById("ppt_phone").value=="-"){
		 document.getElementById("ppt_phone").value="";
	}
	 
	
	 
	 
		 
}
  
  
  function roomSelect(){
	  
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
	  
  }
  
  
  function nurseSelect() {
	  
	  $.ajax({
	    	
		  type:"post",
 		 url:"nurselist",  
 		 contentType:"application/json; charset=utf-8",
 		 dataType:"json",
 		 success:function(data){
 			 
 			 var patientselect = "<div class='col-md-15'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>요양사번호</a>"
			    	+"<a href='#' class='btn btn-info'>이름</a>"
			    	  +"<a href='#' class='btn btn-info'>전화번호</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='patientgroup'>";
 			    	  
 			    	  $.each(data,function(index,item){
 			    		  if(item.name==null){
 			    			  item.name="-";    			    			  
 			    		  }
 			    		  patientselect+="<div class='list-group-item' nurse_no="+item.nurse_no+" name="+item.name+"><table class='text-center'><tr><td width='160px;'>"
 			    		  +item.nurse_no+"</td><td width='160px;'>"
 			    		  +item.name+"</td><td width='160px;'>"
 			    		  +item.phone+"</td></tr></table></div>";
 			    		  
 			    	  }) 
 			    	
 			    	patientselect+="</div></div>";
 			    	
 			    	$("#kk").html(patientselect);
 			    	
 			    	 if(data.length>11){
  			    		$("#patientgroup").css("overflow","scroll");
  			    	};
  			    	
  			    	$(".list-group-item").click(function(){
   			    		
  			    		
   			    		$(".list-group-item").css("color","black");
   			    		$(this).css("color","red");
		    			$("#nurse_name").val($(this).attr("name"));
		    			$("#nurse_no").val($(this).attr("nurse_no"));		
		    			
 			    		
 			    	});
  			    	
  			    	$("#room_Select").click(function(){
			    		roomSelect();
			    	});
  			    	
  			    	$()
 		
 						
 		},
 		 error:function(error){console(error);}
 		})
	
}
	  
	  

  