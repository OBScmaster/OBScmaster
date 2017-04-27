<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
<title>Log</title>
</head>
<body>
<h3>${sessionScope.id.room_no}호의 로그 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ${today}</h3>
<div class="panel">
<c:choose>
<c:when test="${myLoglist!=null}">
<table class="text-center">
<tr><th width="100">시간</th><th width="100">사건</th><th width="50">종류</th></tr>
<c:forEach var="log" items="${myLoglist}">
<tr><td>${log.timeonlog}</td><td>${log.text}</td><td>${log.sensortype}</td></tr>
</c:forEach>
</table>
</c:when>
<c:otherwise>
없습니다
</c:otherwise>
</c:choose>
</div>





</body>
</html>