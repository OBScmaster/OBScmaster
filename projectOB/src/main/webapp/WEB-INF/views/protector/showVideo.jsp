<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<title>WEBCAM</title>

<script type="text/javascript">

function onloadevent(){
	document.getElementById("loading").style.visibility="hidden"
}


function anotherImg(){
	
	$("#waitImage").attr("src", "");
	$("#loadImage").attr("src", "./resources/image/noimage.JPG");

}
</script>
</head>
<body>

<div onload="onloadevent()">

<img id="loadImage" src="http://${ipaddress}:8080/stream/video.mjpeg" onerror="anotherImg()">

<div id="loading" class="text-center">
<img id="waitImage" src="./resources/image/ajax-loader.gif">
<br>
로딩중입니다
</div>

</div>



</body>
</html>