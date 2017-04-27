<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WEBCAM</title>
<script type="text/javascript">
function anotherImg(){
	
	
	
	$("img").attr("src", "./resources/image/ajax-loader.gif");

}
</script>
</head>
<body>

<img alt="image" src="http://${ipaddress}:8080/stream/video.mjpeg" onloadeddata="anotherImg()">

</body>
</html>