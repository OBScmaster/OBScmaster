<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Example of Bootstrap 3 Table with Emphasis Classes</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
    .bs-example{
    	margin: 20px;
    }
</style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
  </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="patientHome">Home</a></li>
        <li><a href="showVideo?pt_no=${id.pt_no}">웹캠</a></li>
        <li><a href="#">로그</a></li>
      </ul>
      
       
     
      <ul class="nav navbar-nav navbar-right">
           <li><a href="#">${today}의 일정</a></li>
       <li><a href="protectorLogout">로그아웃</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${id.name}님 보호자님 환영</a></li>
      </ul>
    </div>
  </div>
</nav>
    
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">식사</h3>
    </div>
 <div>최종 업데이트 시간 ${today}</div>
    <div class="panel-body">
    <c:choose>
    	<c:when test="${mealList != null }">
    		<table class="table table-hover">
    			<thead>
       				<tr>
            			<th>식사</th>
            			<th>시간</th>
            			<th>식단</th>
        			</tr>
    			</thead>
    			<c:forEach var = "items" items="${mealList}">
    					<tbody>
       						<tr>
            					<td>${items.typeEat}</td>
            					<td>${items.mealTime}</td>
            					<td>${items.whatEat}</td>
        					</tr>
    					</tbody>
    				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			아직 등록되지 않았습니다.
		</c:otherwise>
	</c:choose>
    </div>
</div>

<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title">운동</h3>
    </div>
    
    <div class="panel-body">
    <c:choose>
    	<c:when test="${exerciseList != null}">
    		<table class="table table-hover">
    			<thead>
       				<tr>
            			<th>운동</th>
            			<th>시간</th>
        			</tr>
    			</thead>
    				<c:forEach var = "items" items="${exerciseList}">
    					<tbody>
       						<tr>
            					<td>${items.exerciseText}</td>
            					<td>${items.exerciseTime}</td>
        					</tr>
    					</tbody>
    				</c:forEach>	
				</table>
    		</c:when>
			<c:otherwise>
				마다 토우로쿠사레나이
			</c:otherwise>
	</c:choose>	
    </div>
</div>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">청소</h3>
    </div>
    <div class="panel-body">
    	<div class="move-left">
        	<div class="[ form-group ]">
        		<c:if test="${cleaning.cleaningReport != null }">
            		<input type="checkbox" name="fancy-checkbox-success" id="fancy-checkbox-success" autocomplete="off" checked = "checked" disabled="disabled"/>
            	</c:if>
            	<div class="[ btn-group ]">
                	<label for="fancy-checkbox-success" class="[ btn btn-success ]">
                    	<span class="[ glyphicon glyphicon-ok ]"></span>
                    	<span> </span>
                	</label>
                	<label for="fancy-checkbox-success" class="[ btn btn-default active ]">
                    	청소여부
                	</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<label for = "cleaning">
                		<p>청소시간</p>
                	</label>
                	<label for = "cleaning">
	     				<input type="text" class="form-control" id="cleaning" size ="20" readonly="readonly" value = "${cleaning.cleaning}">
                	</label>
            	</div>            	
        	</div>
    	</div>
    </div>
</div>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">세탁</h3>
    </div>
    <div class="panel-body">
    
     <div>최종 업데이트 시간 ${wash.updatedate}</div>
     
    	<div class="move-left">
        	<div class="[ form-group ]">
        		<c:if test="${wash.washReport != null }">
            		<input type="checkbox" name="fancy-checkbox-success" id="fancy-checkbox-success" autocomplete="off" checked = "checked" disabled="disabled"/>
            	</c:if>
            	<div class="[ btn-group ]">
                	<label for="fancy-checkbox-success" class="[ btn btn-success ]">
                    	<span class="[ glyphicon glyphicon-ok ]"></span>
                    	<span> </span>
                	</label>
                	<label for="fancy-checkbox-success" class="[ btn btn-default active ]">
                    	세탁여부
                	</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<label for = "wash">
                		<p>세탁시간</p>
                	</label>
                	<label for = "wash">
	     				<input type="text" class="form-control" id="cleaning" size ="20" readonly="readonly" value = "${wash.wash}">
                	</label>
                	<label for = "wash">
	     				<input type="text" class="form-control" size ="40" readonly="readonly" value = "${wash.washReport}">
                	</label>
            	</div>            	
        	</div>
    	</div>
    </div>
</div>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">샤워</h3>
    </div>
    <div class="panel-body">
    	<div class="move-left">
        	<div class="[ form-group ]">
        		<c:if test="${shower.showerReport != null }">
            		<input type="checkbox" name="fancy-checkbox-success" id="fancy-checkbox-success" autocomplete="off" checked = "checked" disabled="disabled"/>
            	</c:if>
            	<div class="[ btn-group ]">
                	<label for="fancy-checkbox-success" class="[ btn btn-success ]">
                    	<span class="[ glyphicon glyphicon-ok ]"></span>
                    	<span> </span>
                	</label>
                	<label for="fancy-checkbox-success" class="[ btn btn-default active ]">
                    	샤워여부
                	</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<label for = "shower">
                		<p>샤워시간</p>
                	</label>
                	<label for = "shower">
	     				<input type="text" class="form-control" id="cleaning" size ="20" readonly="readonly" value = "${shower.shower}">
                	</label>
                	<label for = "shower">
	     				<input type="text" class="form-control" size ="40" readonly="readonly" value = "${shower.showerReport}">
                	</label>
            	</div>            	
        	</div>
    	</div>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">수면</h3>
    </div>
    <div class="panel-body">
    <c:choose>
    	<c:when test="${bedList != null }">
    		<table class="table table-hover">
    			<thead>
       				<tr>
            			<th>수면시간</th>
            			<th>기상시간</th>
            			<th>내용</th>
        			</tr>
    			</thead>
    			<c:forEach var = "items" items="${bedList}">
    					<tbody>
       						<tr>
            					<td>${items.timeToSleep}</td>
            					<td>${items.timeToGetup}</td>
            					<td>${items.report}</td>
        					</tr>
    					</tbody>
    				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			아직 등록되지 않았습니다.
		</c:otherwise>
	</c:choose>
    </div>
</div>

<div class="panel panel-warning">
    <div class="panel-heading">
        <h3 class="panel-title">의사소견</h3>
    </div>
    <div class="panel-body">
    	<c:choose>
    	<c:when test="${dr_opList != null }">
    		<table class="table table-hover">
    			<thead>
       				<tr>
            			<th>시간</th>
            			<th>내용</th>
        			</tr>
    			</thead>
    			<c:forEach var = "items" items="${dr_opList}">
    					<tbody>
       						<tr>
            					<td>${items.reportTime}</td>
            					<td>${items.report}</td>
        					</tr>
    					</tbody>
    				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			아직 등록되지 않았습니다.
		</c:otherwise>
	</c:choose>
    </div>
</div>

<div class="panel panel-danger">
    <div class="panel-heading">
        <h3 class="panel-title">특이사항</h3>
    </div>
    <div class="panel-body">
    	<c:choose>
    	<c:when test="${specialList != null }">
    		<table class="table table-hover">
    			<thead>
       				<tr>
            			<th>시간</th>
            			<th>내용</th>
        			</tr>
    			</thead>
    			<c:forEach var = "items" items="${specialList}">
    					<tbody>
       						<tr>
            					<td>${items.reportTime}</td>
            					<td>${items.report}</td>
        					</tr>
    					</tbody>
    				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			아직 등록되지 않았습니다.
		</c:otherwise>
	</c:choose>
    </div>
</div>

</body>
</html>    