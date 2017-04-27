/**
 * 
 */

  var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
  
  var pt_no;
  var pt_name;
  var i=0;
  var remo;
  var remos = new Array();
  var remoCancel;
  
  $(function() {
	  
	  main();
	  
  });
  
  function main(){

	  $.ajax({  		 
  		type:"post",
  		 url:"nurselist",  
  		 contentType:"application/json; charset=utf-8",
  		 dataType:"json",
  		 async : false,
  		 success:function(data){
  			 
  			  data.sort(function(a,b) {
  		  			
  		  	        var val1 = a.nurse_no;  	  
  		  	        var val2 = b.nurse_no;
  		  	    
  		  	        return(val1>val2)?-1:(val1<val2)?1:0;
  		  	    });
  			
  			 var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>요양사번호</a>"
			    	+"<a href='#' class='btn btn-info'>이름</a>"
			    	  +"<a href='#' class='btn btn-info'>전화번호</a>"
			    	  +"</div><div class='list-group text-left' style='height:630px;' id='patientgroup'>";
  			    	  
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
   			    	
   			     listClick();
   			    
   			      
  		},
  		 error:function(error){console.log(error);}
  		});
	  
	  
	  
    $("#upload").on('change', function(){
        readURL(this);
    });
    
   
    
    $("#nurseUpdate").click(function(){
			if(document.getElementById("name").value.length<1){
				alert("수정할 요양사를 선택해 주세요"); 
			 }			 
	  })
	  
	   $("#nurseDelete").click(function(){
		   
			if(document.getElementById("name").value.length<1){
				alert("삭제할 요양사를 선택해 주세요"); 
			 }			 
	  })
		
	   $("#nurseUpdateCancel").click(function(){
			if(document.getElementById("name").value.length<1){
				if(confirm("메인메뉴로 돌아가시겠습니까?")){
					location.href="adminLogin"
				 }
			 }
		 })      
	  
  }
  
  function listClick(){
	  
	  $(".list-group-item").bind('click',function(){
	        	
	    		var nurse_no=$(this).attr("nurse_no");
	    		var nurse_name=$(this).attr("name");
	    		
	    		$(".list-group-item").css("color","black");
	    		$(this).css("color","red");
	    		
	    	    $("#cert_no").attr("readonly","readonly");
	    	    $("#name").attr("readonly","readonly");
	    	    $("#phone").attr("readonly","readonly");
	    	
	    	    $("#nurse_no").val(nurse_no)
	    		$("#cert_no").val($(this).attr("cert_no"));
	    		$("#phone").val($(this).attr("phone"));
	    		$("#name").val(nurse_name);
	    	
	    		
	    		$("#patientList").css("overflow","")
    		
    		$("#fd").remove();
    		$("#upload").remove();
    		
    		$("#nurseUpdate").remove();
    		
    		$("#buttt").prepend("<button type='button' class='btn btn-primary' id='nurseUpdate'>수정</button>");
    		 
    		$("#nurseDelete").unbind().bind("click",function(){
    			
    			if(confirm(nurse_name+"을 삭제하시겠습니까?")){
  					location.href="deleteNurse?nurse_no="+nurse_no;
  				 }    			    			
    		})
    		
    		$("#nurseUpdate").click(function(){
    			
    			$("#nurseDelete").hide();
    			
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
    			   
    			   allPatients();
    			   
    			   $("#upload").on('change', function(){
  			          readURL(this);
  			      });
    			   
    			   $("input[target='target']").on('click', function(){
	   					 
		   				 if(confirm($(this).val()+"님을 제외하시겠습니까?")){
		   					var pt_no = $(this).attr("pt_no");
		   					
		   				    removePatientFromNurse(pt_no);
		   					$(this).remove();
		   				 }
		   				  
		   		       });
    			   
    			 });
    		
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
	  
  }
  
  function listClickUnbind(){
	  
	  $(".list-group-item").unbind();
	  
  }
  
  function addPatient(pt_no, pt_name){

	      remos[i]=remo;
    	  i++;
    	  remo.hide();
    	  $.ajax({
    		  type:"get",
     		 url:"addPatient", 
     		 data:{
     			pt_no:pt_no,
     			pt_name:pt_name
     		 },
     		success:function(data){
     			
     			     			 
     			var patientadd="";
     			 $.each(data,function(index,item){ 
     		    					 
     			   	patientadd +="<input type='text' class='form-control' id='pt_name' value="+item.pt_name+" target='target' pt_no="+item.pt_no+" readonly='readonly'>"
     	     		+"<input type='hidden' class='form-control' id='pt_no' value="+item.pt_no+" name='pt_no'>"
     		
     			 })
     			 
     			patientadd += "<input type='text' class='form-control' id='ptname' readonly='readonly'>";
     			 
     			 $("#moreP").html(patientadd);
     			$("#moreP").children("input.last").prepend("new").css("color","red")
     
     			 
     			
     		},
     		error:function(e){
     			console.log(e);
     		}    		  
    	  }) 
	  
  }

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
  			$("#patientgroup").css("overflow","");
  			 var patientselect = " <button class='form-control dropdown-toggle' type='button' data-toggle='dropdown'  readonly='readonly'>환자목록<span class='caret' ></span></button>"
  			 +"";
  			    	  
  			    	  $.each(data,function(index,item){    			    		    			    	
  			    	
  			    		  patientselect+="<input type='text' class='form-control' readonly='readonly' value="+item.name+" pt_no="+item.pt_no+" target='target'>";
  			    		  
  			    	  })
  			    	
  			    	patientselect+="<div id='moreP'></div>";
  			    	
  			    	$("#patientList").html(patientselect);
  			    	
  			    	 if(data.length>11){
   			    		$("#patientgroup").css("overflow","scroll");
   			    	};
   			    	
   			        if(data.length>7){
			    		$("#patientList").css("overflow","scroll");
			    	};
			    	
  		},
  		 error:function(error){  			 
  			 console.log(error);}
  		});
  }
  
  function allPatients(){
	  var count=0;
	  $.ajax({  		 
  		type:"get",
  		 url:"patientlist",  
  		 contentType:"application/json; charset=utf-8",
  		 dataType:"json",
  		 success:function(data){
  			$("#patientgroup").css("overflow","");
  		   var patientselect = "<div class='col-md-7'><div class='btn-group btn-group-justified'><a href='#' class='btn btn-info'>환자명</a>"
			    	+"<a href='#' class='btn btn-info'>병실</a>"
			    	+"<a href='#' class='btn btn-info'>병명</a>"
			    	+"</div><div class='list-group text-left' style='height:630px;' id='patientgroup'>";
  			    	  
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
  			    		count++;
  			    		
  			    		 }
  			    	  })
  			    	
  			    	patientselect+="</div></div>";
  			    	
  			    	$("#kk").html(patientselect);
  			    	
  			    	 if(count>11){
   			    		$("#patientgroup").css("overflow","scroll");
   			    	};
   			    	
   			    	$(".list-group-item").click(function(){
  			    		
   			    		pt_name = $(this).attr("name");
   			    		pt_no = $(this).attr("pt_no");   			    		
  			    		$(".list-group-item").css("color","black");
  			    		if(confirm(pt_name+"님을 추가하시겠습니까?")){
  			    			$(this).css("color","red");
  			    			remo=$(this);
  			    			addPatient(pt_no,pt_name);
  			    	 }
  			    		 
  			    	});
  		  						
  		},
  		 error:function(error){console.log(error);}
  		});
	  
  }
  
  function removePatientFromNurse(pt_no){
	  
	  $.ajax({  		 
	  		type:"get",
	  		 url:"removePatientFromNurse",
	  		 data:{pt_no:pt_no},
	  		 contentType:"application/json; charset=utf-8",
	  		 dataType:"json",
	  		 success:function(data){
	  			 
	  			 if(data.disease==null){
	  				data.disease="-";
	  			 }
	  			
	  			 var patientselect="<div class='list-group-item' name="+data.name+" pt_no="+data.pt_no+" room_no="+data.room_no+"><table class='text-center'><tr><td width='190px;'>"
		    		  +data.name+"</td><td width='250px;'>"
			    		  +data.room_no+"호</td><td width='200px;'>"
			    		  +data.disease+"</td></tr></table></div>";
	  				 	  			 	  			
	  				$("#patientgroup").append(patientselect);
	  				$("#patientList").append("<input type=hidden id=new"+data.pt_no+" name=delPatient value="+data.pt_no+">")		
	  				  				
	  		 },
	  		 error:function(error){console.log(error);}
	  		});
	  
  }
  
 
  