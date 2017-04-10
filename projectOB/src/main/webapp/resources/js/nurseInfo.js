/**
 * 
 */

  var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  $(function() {
	  
	  $.ajax({  		 
    		type:"post",
    		 url:"nurselist",  
    		 contentType:"application/json; charset=utf-8",
    		 dataType:"json",
    		 success:function(data){
    			 
    			  data.sort(function(a,b) {
    		  			
    		  	        var val1 = a.nurse_no;  	  
    		  	        var val2 = b.nurse_no;
    		  	    
    		  	        return(val1>val2)?-1:(val1<val2)?1:0;
    		  	    });
    			
    			 
    			 var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>요양사번호</a>"
 			    	+"<a href='#' class='btn btn-info'>이름</a>"
			    	  +"<a href='#' class='btn btn-info'>전화번호</a>"
			    	  +"</div><div class='list-group text-left' style='height:540px;' id='patientgroup'>";
    			    	  
    			    	  $.each(data,function(index,item){
    			    		  if(item.name==null){
    			    			  item.name="-";    			    			  
    			    		  }
    			    		  patientselect+="<div class='list-group-item' previewImg="+item.savefile+" phone="+item.phone+" cert_no="+item.cert_no+" nurse_no="+item.nurse_no+" name="+item.name+"><table class='text-center'><tr><td width='190px;'>"
    			    		  +item.nurse_no+"</td><td width='250px;'>"
    			    		  +item.name+"</td><td width='200px;'>"
    			    		  +item.phone+"</td></tr></table></div>";
    			    		  
    			    	  })
    			    	
    			    	patientselect+="</div></div>";
    			    	
    			    	$("#kk").html(patientselect);
    			    	
    			    	 if(data.length>11){
     			    		$("#patientgroup").css("overflow","scroll");
     			    	};
     			    	$(".list-group-item").click(function(){
      			    	
     			    		
     			    		var nurse_no=$(this).attr("nurse_no");
     			    		
      			    		$(".list-group-item").css("color","black");
      			    		$(this).css("color","red");
      			    		
      			    	   $("#cert_no").attr("readonly","readonly");
      			    	   $("#name").attr("readonly","readonly");
      			    	   $("#phone").attr("readonly","readonly");
      			    	
      			    	 $("#nurse_no").val(nurse_no)
      			    		$("#cert_no").val($(this).attr("cert_no"));
      			    		$("#phone").val($(this).attr("phone"));
      			    		$("#name").val($(this).attr("name"));
      			    	
    			    		
    			    		$("#fd").remove();
    			    		$("#upload").remove();
    			    		
    			    		$("#nurseUpdate").remove();
    			    		
    			    		$("#buttt").prepend("<button type='button' class='btn btn-primary' id='nurseUpdate'>수정</button>");
    			    		 
    			    		$("#nurseUpdate").click(function(){
    			    			
    			    		 	$("#nurseUpdateCancel").click(function(){
    			    				if(confirm("수정을 취소하시겠습니까?")){
    			    					location.href="adminNurseInfo"
    			    				 }
    			    			});
    			    		 	
    			    			   $("#nurseUpdate").remove();
    			    			   
    			    			   $("#btnSelect").html("<button type='button' class='btn btn-primary' id='nurseInfo'>배정되지 않은 환자</button>");
    			    			   $("#buttt").prepend("<input type='submit' class='btn btn-primary' id='fd' value=확인>");
    			    			   $("#picdiv").append( "<input type='file' value='' id='upload' name='upload' style='width: 100%;'>");
    			    			   $("#phone").removeAttr("readonly");
    			    			 
    			    		    			    			  
    			    			   $("#upload").on('change', function(){
    			    			          readURL(this);
    			    			      });
    			    			   
    			    			   allPatients(nurse_no);
    			    	
    			    			 })
    			    		
    			    		
    			    		
    			    		$("#previewImg").attr("src","");
    			    		
    			    		if($(this).attr('previewImg')!="-"){
    			    			
    			    		$("#previewImg").attr("src","./resources/image/nursefile/"+$(this).attr('previewImg'));
    			    		
    			    		}else{
    			    			$("#previewImg").attr("alt","이미지 없음");
    			    			
    			    		}

    						 $("#upload").on('change', function(){
    			    		          readURL(this);
    			    		 });
    			    		
    						 
    						myPatientList(nurse_no);
    						 
    			    	
    					});
    		
     			    	
    						
    		},
    		 error:function(error){console.log(error);}
    		});
	  
	  
	  
      $("#upload").on('change', function(){
          readURL(this);
      });
      
      $("#addPatient").click(function(){
    	  alert("Adsfasdf");
      });
      
      $("#nurseUpdate").click(function(){
			if(document.getElementById("name").value.length<1){
				alert("수정할 요양사를 선택해 주세요"); 
			 }			 
		 })
		
	   $("#nurseUpdateCancel").click(function(){
			if(document.getElementById("name").value.length<1){
				if(confirm("메인메뉴로 돌아가시겠습니까?")){
					location.href="adminLogin"
				 }
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
  
  function myPatientList(nurse_no){
	  
	//환자목록
		$.ajax({
  		 
  		type:"get",
  		 url:"patientList",
  		 data:{nurse_no:nurse_no},
  		 success:function(data){
  			 		    		
  			
  			 var patientselect = " <button class='form-control dropdown-toggle' type='button' data-toggle='dropdown'  readonly='readonly'>환자목록<span class='caret' ></span></button>"
  			 +"";
  			    	  
  			    	  $.each(data,function(index,item){    			    		    			    	
  			    	
  			    		  patientselect+="<input type='text' class='form-control' readonly='readonly' value="+item.name+">";
  			    		  
  			    	  })
  			    	
  			    	patientselect+="<div id='addNewPatient'></div>";
  			    	
  			    	$("#patientList").html(patientselect);
  			    	
  			    	 if(data.length>11){
   			    		$("#patientgroup").css("overflow","scroll");
   			    	};
  		},
  		 error:function(error){
  			 
  			 console.log(error);}
  		});
	  
  }
  
  function allPatients(nurse_no){
	  
	  $.ajax({  		 
  		type:"get",
  		 url:"patientlist",  
  		 contentType:"application/json; charset=utf-8",
  		 dataType:"json",
  		 success:function(data){
  			
  			 var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>환자명</a>"
			    	+"<a href='#' class='btn btn-info'>병실</a>"
			    	+"<a href='#' class='btn btn-info'>병명</a>"
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
  			    		  
  			    		  if(item.disease==null){
  			    			  item.disease="겡끼";    			    			  
  			    		  }
  			    		 if(item.nurse_no!=0){  
  			    			 
  			    		 }else{
  			    		  patientselect+="<div class='list-group-item' name="+item.name+" pt_no="+item.pt_no+" room_no="+item.room_no+"><table class='text-center'><tr><td width='190px;'>"
  			    		  +item.name+"</td><td width='250px;'>"
  			    		  +item.room_no+"호</td><td width='200px;'>"
  			    		  +item.disease+"</td></tr></table></div>";
  			    		 }
  			    	  })
  			    	
  			    	patientselect+="</div></div>";
  			    	
  			    	$("#kk").html(patientselect);
  			    	
  			    	 if(data.length>11){
   			    		$("#patientgroup").css("overflow","scroll");
   			    	};
					
   			    	
   			    	
   			    	$(".list-group-item").click(function(){
  			    		
   			    		var name = $(this).attr("name");
   			    		var pt_no = $(this).attr("pt_no");
   			    		
  			    		$(".list-group-item").css("color","black");
  			    		
  			    		
  			    		
  			    		
  			    		
  			    		if(confirm(name+"님을 추가하시겠습니까?")){
  			    			$(this).css("color","red");
  			    			$("#pt_no").val(pt_no);
  			    			$("#addNewPatient").html("<input type='text' class='form-control' readonly='readonly' value="+name+">");
  			    		 	
  			    		}
  			    		
  			  
  			    		 
  			    	});
  		
  						
  		},
  		 error:function(error){console.log(error);}
  		});
	  
  }
  
 
  