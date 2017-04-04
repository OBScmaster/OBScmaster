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
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">식사</h3>
    </div>
    <div class="panel-body">
    	<c:if test="${mealList.today != null}">
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
            					<td>${items.TYPEEAT}</td>
            					<td>${items.MEALTIME}</td>
            					<td>${items.WHATEAT}</td>
        					</tr>
    					</tbody>
    				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${mealList.today == null}">
		마다 토우로쿠사레나이
		</c:if>
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
            					<td>${items.EXERCISETEXT}</td>
            					<td>${items.EXERCISETIME}</td>
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
            	<input type="checkbox" name="fancy-checkbox-success" id="fancy-checkbox-success" autocomplete="off" checked = "checked" disabled="disabled"/>
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
	     				<input type="text" class="form-control" id="cleaning" size ="50" readonly="readonly">
                	</label>
            	</div>            	
        	</div>
    	</div>
    </div>
</div>

<div class="panel panel-warning">
    <div class="panel-heading">
        <h3 class="panel-title">400 Bad Request</h3>
    </div>
    <div class="panel-body">The request cannot be fulfilled due to bad syntax.</div>
</div>

<div class="panel panel-danger">
    <div class="panel-heading">
        <h3 class="panel-title">503 Service Unavailable</h3>
    </div>
    <div class="panel-body">The server is temporarily unable to handle the request.</div>
</div>

</body>
</html>    