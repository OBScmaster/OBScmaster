<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>ManagerPatientInput</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    .form-group input[type="checkbox"] {
    display: none;
}

.form-group input[type="checkbox"] + .btn-group > label span {
    width: 20px;
}

.form-group input[type="checkbox"] + .btn-group > label span:first-child {
    display: none;
}
.form-group input[type="checkbox"] + .btn-group > label span:last-child {
    display: inline-block;   
}

.form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
    display: inline-block;
}
.form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
    display: none;   
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	$( ".datepicker" ).datepicker({
		dateFormat: "yy/mm/dd"
	});
	
	
	$(".list-group-item").on("click", function() {
		var pt_no = $(this).attr("id");
		var today = $(".datepicker").val();
		
		alert(pt_no);
		alert(today);
		
				var html = "";
				html += "<div class='text-left' style='font-weight: bold;'>환자</div> ";
				html += "<div class='container col-md-12'>";
				html += "<h2>환자 스케쥴 입력</h2>";
				html += "<ul class='nav nav-tabs'>";
				html += "<li class='active'>";
				html += "<li><a data-toggle='tab' href='#menu1'>식사</a></li>";
				html += "<li><a data-toggle='tab' href='#menu2'>운동</a></li>";
				html += "<li><a data-toggle='tab' href='#menu3'>청소</a></li>";
				html += "<li><a data-toggle='tab' href='#menu4'>세탁</a></li>";
				html += "<li><a data-toggle='tab' href='#menu5'>샤워</a></li>";
				html += "<li><a data-toggle='tab' href='#menu6'>수면</a></li>";
				html += "<li><a data-toggle='tab' href='#menu7'>의사소견</a></li>";
				html += "<li><a data-toggle='tab' href='#menu8'>특이사항</a></li>";
				html += "</ul>";
				html += "<div class='tab-content'>";
				html += "<div id='menu1' class='tab-pane fade in active'>";
					$.ajax({
						type : "post",
						url : "showMeal",
						data : {
							pt_no : pt_no,
							today : today
						},
						success : function(data) {
							console.log(data);
							var html1 = "";
							html1 += "<div class='panel panel-primary'>";
							html1 += "<div class='panel-heading'>";
							html1 += "<h3 class='panel-title'>식사</h3>";
							html1 += "</div>";
							html1 += "<div class='panel-body' id = 'mealTable'>";
							html1 += "<table class='table table-hover'>";
							html1 += "<thead>";
							html1 += "<tr>";
							html1 += "<th>식사</th>";
							html1 += "<th>시간</th>";
							html1 += "<th>식단</th>";
							html1 += "</tr>";
							html1 += "</thead>";
							if(data.length > 0){
							$.each(data, function(index,item) {
								html1 += "<tbody>";
								html1 += "<tr>";
								html1 += "<td>" + item.TYPEEAT + "</td>";
								html1 += "<td>" + item.MEALTIME + "</td>";
								html1 += "<td>" + item.WHATEAT + "</td>";
								html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateMeal("+pt_no+",&#34;"+item.TYPEEAT+"&#34;,&#34;"+item.MEALTIME+"&#34;,&#34;"+item.WHATEAT+"&#34;,&#34;"+item.INSERTDATE+"&#34;)'></td>";
								html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delMeal("+pt_no+",&#34;"+item.MEALTIME+"&#34;)'></td>";
								html1 += "</tr>";
								})//each
								html1 += "<tr>";
								html1 += "<td>식사<select class='form-control' id = 'mealType'>";
								html1 += "<option>아침</option>";
								html1 += "<option>점심</option>";
								html1 += "<option>저녁</option>";
								html1 += "<option>간식</option>";
								html1 += "</select>";
								html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
								html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
								html1 += "<td>";
								html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
								html1 += "</td>";
								html1 += "</tr>";
								} else{
									html1 += "<tbody>";
									html1 += "<tr>";
									html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
									html1 += "</tr>";
									html1 += "<tr>";
									html1 += "<td>식사<select class='form-control' id = 'mealType'>";
									html1 += "<option>아침</option>";
									html1 += "<option>점심</option>";
									html1 += "<option>저녁</option>";
									html1 += "<option>간식</option>";
									html1 += "</select>";
									html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
									html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
									html1 += "</tr>";
									html1 += "<tr>";
									html1 += "<td></td>";
									html1 += "<td></td>";
									html1 += "<td>";
									html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
									html1 += "</td>";
									html1 += "</tr>";
								}
							html1 += "</tbody>";
							html1 += "</table>";
							html1 += "</div>";
							html1 += "</div>";
							$("#menu1").html(html1);
						},
						error : function(e) {
							console.log(e);
						}
					})
			    html += "</div><div id='menu2' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showExercise",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html2 = "";
						html2 += "<div class='panel panel-success'>";
						html2 += "<div class='panel-heading'>";
						html2 += "<h3 class='panel-title'>운동</h3>";
						html2 += "</div>";
						html2 += "<div class='panel-body' id = 'exerciseTable'>";
						html2 += "<table class='table table-hover'>";
						html2 += "<thead>";
						html2 += "<tr>";
						html2 += "<th>운동</th>";
						html2 += "<th>시간</th>";
						html2 += "</tr>";
						html2 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html2 += "<tbody>";
							html2 += "<tr>";
							html2 += "<td>" + item.EXERCISETEXT + "</td>";
							html2 += "<td>" + item.EXERCISETIME + "</td>";
							html2 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateExercise("+pt_no+",&#34;"+item.EXERCISETEXT+"&#34;,&#34;"+item.EXERCISETIME+"&#34;)'></td>";
							html2 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delExercise("+pt_no+",&#34;"+item.EXERCISE_NO+"&#34;)'></td>";
							html2 += "</tr>";
							})//each
							html2 += "<tr>";
							html2 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
							html2 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
							html2 += "<td>";
							html2 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
							html2 += "</td>";
							html2 += "</tr>";
							} else{
								html2 += "<tbody>";
								html2 += "<tr>";
								html2 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html2 += "</tr>";
								html2 += "<tr>";
								html2 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
								html2 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseTime'></td>";
								html2 += "<td>";
								html2 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
								html2 += "</td>";
								html2 += "</tr>";
							}
						html2 += "</tbody>";
						html2 += "</table>";
						html2 += "</div>";
						html2 += "</div>";
						$("#menu2").html(html2);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div><div id='menu3' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showDailyCleaning",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html3 = "";
						html3 += "<div class='panel panel-info'>";
						html3 += "<div class='panel-heading'>";
						html3 += "<h3 class='panel-title'>청소</h3>";
						html3 += "</div>";
						html3 += "<div class='panel-body' id = 'dailycleaningTable'>";
						html3 += "<table class='table table-hover'>";
						html3 += "<thead>";
						html3 += "<tr>";
						html3 += "<th>청소시간</th>";
						html3 += "<th>내용</th>";
						html3 += "</tr>";
						html3 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html3 += "<tbody>";
							html3 += "<tr>";
							html3 += "<td>" + item.CLEANING + "</td>";
							html3 += "<td>" + item.CLEANINGREPORT + "</td>";
							html3 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailycleaning("+pt_no+",&#34;"+item.CLEANING+"&#34;,&#34;"+item.CLEANINGREPORT+"&#34;)'></td>";
							html3 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyCleaning("+pt_no+",&#34;"+item.DAILYCLEANING_NO+"&#34;)'></td>";
							html3 += "</tr>";
							})//each
							html3 += "<tr>";
							html3 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
							html3 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
							html3 += "<td>";
							html3 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
							html3 += "</td>";
							html3 += "</tr>";
							} else{
								html3 += "<tbody>";
								html3 += "<tr>";
								html3 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html3 += "</tr>";
								html3 += "<tr>";
								html3 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
								html3 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
								html3 += "<td>";
								html3 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
								html3 += "</td>";
								html3 += "</tr>";
							}
						html3 += "</tbody>";
						html3 += "</table>";
						html3 += "</div>";
						html3 += "</div>";
						$("#menu3").html(html3);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "<div id='menu4' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showDailyWash",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html4 = "";
						html4 += "<div class='panel panel-info'>";
						html4 += "<div class='panel-heading'>";
						html4 += "<h3 class='panel-title'>세탁</h3>";
						html4 += "</div>";
						html4 += "<div class='panel-body' id = 'dailyWashTable'>";
						html4 += "<table class='table table-hover'>";
						html4 += "<thead>";
						html4 += "<tr>";
						html4 += "<th>세탁시간</th>";
						html4 += "<th>내용</th>";
						html4 += "</tr>";
						html4 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html4 += "<tbody>";
							html4 += "<tr>";
							html4 += "<td>" + item.WASH + "</td>";
							html4 += "<td>" + item.WASHREPORT + "</td>";
							html4 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyWash("+pt_no+",&#34;"+item.WASH+"&#34;,&#34;"+item.WASHREPORT+"&#34;)'></td>";
							html4 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyWash("+pt_no+",&#34;"+item.DAILYWASH_NO+"&#34;)'></td>";
							html4 += "</tr>";
							})//each
							html4 += "<tr>";
							html4 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
							html4 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
							html4 += "<td>";
							html4 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
							html4 += "</td>";
							html4 += "</tr>";
							} else{
								html4 += "<tbody>";
								html4 += "<tr>";
								html4 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html4 += "</tr>";
								html4 += "<tr>";
								html4 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
								html4 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
								html4 += "<td>";
								html4 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
								html4 += "</td>";
								html4 += "</tr>";
							}
						html4 += "</tbody>";
						html4 += "</table>";
						html4 += "</div>";
						html4 += "</div>";
						$("#menu4").html(html4);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "<div id='menu5' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showDailyShower",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html5 = "";
						html5 += "<div class='panel panel-info'>";
						html5 += "<div class='panel-heading'>";
						html5 += "<h3 class='panel-title'>샤워</h3>";
						html5 += "</div>";
						html5 += "<div class='panel-body' id = 'dailyShowerTable'>";
						html5 += "<table class='table table-hover'>";
						html5 += "<thead>";
						html5 += "<tr>";
						html5 += "<th>샤워시간</th>";
						html5 += "<th>내용</th>";
						html5 += "</tr>";
						html5 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html5 += "<tbody>";
							html5 += "<tr>";
							html5 += "<td>" + item.SHOWER + "</td>";
							html5 += "<td>" + item.SHOWERREPORT + "</td>";
							html5 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyShower("+pt_no+",&#34;"+item.SHOWER+"&#34;,&#34;"+item.SHOWERREPORT+"&#34;)'></td>";
							html5 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyShower("+pt_no+",&#34;"+item.DAILYSHOWER_NO+"&#34;)'></td>";
							html5 += "</tr>";
							})//each
							html5 += "<tr>";
							html5 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
							html5 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
							html5 += "<td>";
							html5 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
							html5 += "</td>";
							html5 += "</tr>";
							} else{
								html5 += "<tbody>";
								html5 += "<tr>";
								html5 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html5 += "</tr>";
								html5 += "<tr>";
								html5 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
								html5 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
								html5 += "<td>";
								html5 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
								html5 += "</td>";
								html5 += "</tr>";
							}
						html5 += "</tbody>";
						html5 += "</table>";
						html5 += "</div>";
						html5 += "</div>";
						$("#menu5").html(html5);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "<div id='menu6' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showBedTime",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html6 = "";
						html6 += "<div class='panel panel-primary'>";
						html6 += "<div class='panel-heading'>";
						html6 += "<h3 class='panel-title'>식사</h3>";
						html6 += "</div>";
						html6 += "<div class='panel-body' id = 'BedTimeTable'>";
						html6 += "<table class='table table-hover'>";
						html6 += "<thead>";
						html6 += "<tr>";
						html6 += "<th>수면시간</th>";
						html6 += "<th>기상시간</th>";
						html6 += "<th>내용</th>";
						html6 += "</tr>";
						html6 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html6 += "<tbody>";
							html6 += "<tr>";
							html6 += "<td>" + item.TIMETOSLEEP + "</td>";
							html6 += "<td>" + item.TIMETOGETUP + "</td>";
							html6 += "<td>" + item.REPORT + "</td>";
							html6 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateBedTime("+pt_no+",&#34;"+item.TIMETOSLEEP+"&#34;,&#34;"+item.TIMETOGETUP+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
							html6 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delBedTime("+pt_no+",&#34;"+item.BEDTIME_NO+"&#34;)'></td>";
							html6 += "</tr>";
							})//each
							html6 += "<tr>";
							html6 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
							html6 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
							html6 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
							html6 += "<td>";
							html6 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
							html6 += "</td>";
							html6 += "</tr>";
							} else{
								html6 += "<tbody>";
								html6 += "<tr>";
								html6 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html6 += "</tr>";
								html6 += "<tr>";
								html6 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
								html6 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
								html6 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
								html6 += "</tr>";
								html6 += "<tr>";
								html6 += "<td></td>";
								html6 += "<td></td>";
								html6 += "<td>";
								html6 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
								html6 += "</td>";
								html6 += "</tr>";
							}
						html6 += "</tbody>";
						html6 += "</table>";
						html6 += "</div>";
						html6 += "</div>";
						$("#menu6").html(html6);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "<div id='menu7' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showDr_op",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html7 = "";
						html7 += "<div class='panel panel-warning'>";
						html7 += "<div class='panel-heading'>";
						html7 += "<h3 class='panel-title'>의사소견</h3>";
						html7 += "</div>";
						html7 += "<div class='panel-body' id = 'dr_opTable'>";
						html7 += "<table class='table table-hover'>";
						html7 += "<thead>";
						html7 += "<tr>";
						html7 += "<th>시간</th>";
						html7 += "<th>내용</th>";
						html7 += "</tr>";
						html7 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html7 += "<tbody>";
							html7 += "<tr>";
							html7 += "<td>" + item.REPORTTIME + "</td>";
							html7 += "<td>" + item.REPORT + "</td>";
							html7 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDr_op("+pt_no+",&#34;"+item.REPORTTIME+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
							html7 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDr_op("+pt_no+",&#34;"+item.DR_OP_NO+"&#34;)'></td>";
							html7 += "</tr>";
							})//each
							html7 += "<tr>";
							html7 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
							html7 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
							html7 += "<td>";
							html7 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
							html7 += "</td>";
							html7 += "</tr>";
							} else{
								html7 += "<tbody>";
								html7 += "<tr>";
								html7 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html7 += "</tr>";
								html7 += "<tr>";
								html7 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
								html7 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
								html7 += "<td>";
								html7 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
								html7 += "</td>";
								html7 += "</tr>";
							}
						html7 += "</tbody>";
						html7 += "</table>";
						html7 += "</div>";
						html7 += "</div>";
						$("#menu7").html(html7);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "<div id='menu8' class='tab-pane fade'>";
			    $.ajax({
					type : "post",
					url : "showSpecial",
					data : {
						pt_no : pt_no,
						today : today
					},
					success : function(data) {
						console.log(data);
						var html8 = "";
						html8 += "<div class='panel panel-danger'>";
						html8 += "<div class='panel-heading'>";
						html8 += "<h3 class='panel-title'>특이사항</h3>";
						html8 += "</div>";
						html8 += "<div class='panel-body' id = 'specialTable'>";
						html8 += "<table class='table table-hover'>";
						html8 += "<thead>";
						html8 += "<tr>";
						html8 += "<th>시간</th>";
						html8 += "<th>내용</th>";
						html8 += "</tr>";
						html8 += "</thead>";
						if(data.length > 0){
						$.each(data, function(index,item) {
							html8 += "<tbody>";
							html8 += "<tr>";
							html8 += "<td>" + item.SREPORTTIME + "</td>";
							html8 += "<td>" + item.SREPORT + "</td>";
							html8 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateSpecial("+pt_no+",&#34;"+item.SREPORTTIME+"&#34;,&#34;"+item.SREPORT+"&#34;)'></td>";
							html8 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delSpecial("+pt_no+",&#34;"+item.SPECIAL_NO+"&#34;)'></td>";
							html8 += "</tr>";
							})//each
							html8 += "<tr>";
							html8 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
							html8 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
							html8 += "<td>";
							html8 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
							html8 += "</td>";
							html8 += "</tr>";
							} else{
								html8 += "<tbody>";
								html8 += "<tr>";
								html8 += "<td colspan='3'>아직등록되지않았습니다.</td>";
								html8 += "</tr>";
								html8 += "<tr>";
								html8 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
								html8 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
								html8 += "<td>";
								html8 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
								html8 += "</td>";
								html8 += "</tr>";
							}
						html8 += "</tbody>";
						html8 += "</table>";
						html8 += "</div>";
						html8 += "</div>";
						$("#menu8").html(html8);
					},
					error : function(e) {
						console.log(e);
					}
				})
			    html += "</div>";
			    html += "</div>";
			    html += "</div>";
			    
			    $("#tab").html(html);
			
		})
	})

function enrollMeal(pt_no) {
	var today = $(".datepicker").val();
	var mealType = document.getElementById("mealType").value;
	var mealTime = document.getElementById("mealTime").value;
	var whatEat = document.getElementById("whatEat").value;
	
	$.ajax({
		type : "post",
		url : "enrollMeal",
		data: {
			pt_no : pt_no,
			today : today,
			typeEat : mealType,
			mealTime : mealTime,
			whatEat : whatEat
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>식사</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'mealTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>식사</th>";
			html1 += "<th>시간</th>";
			html1 += "<th>식단</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TYPEEAT + "</td>";
				html1 += "<td>" + item.MEALTIME + "</td>";
				html1 += "<td>" + item.WHATEAT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateMeal("+pt_no+",&#34;"+item.TYPEEAT+"&#34;,&#34;"+item.MEALTIME+"&#34;,&#34;"+item.WHATEAT+"&#34;,&#34;"+item.INSERTDATE+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delMeal("+pt_no+",&#34;"+item.MEALTIME+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>식사<select class='form-control' id = 'mealType'>";
				html1 += "<option>아침</option>";
				html1 += "<option>점심</option>";
				html1 += "<option>저녁</option>";
				html1 += "<option>간식</option>";
				html1 += "</select>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
				html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>식사<select class='form-control' id = 'mealType'>";
					html1 += "<option>아침</option>";
					html1 += "<option>점심</option>";
					html1 += "<option>저녁</option>";
					html1 += "<option>간식</option>";
					html1 += "</select>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
					html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu1").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delMeal(pt_no,mealTime) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delMeal",
		data: {
			pt_no : pt_no,
			today : today,
			mealTime : mealTime
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>식사</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'mealTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>식사</th>";
			html1 += "<th>시간</th>";
			html1 += "<th>식단</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TYPEEAT + "</td>";
				html1 += "<td>" + item.MEALTIME + "</td>";
				html1 += "<td>" + item.WHATEAT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateMeal("+pt_no+",&#34;"+item.TYPEEAT+"&#34;,&#34;"+item.MEALTIME+"&#34;,&#34;"+item.WHATEAT+"&#34;,&#34;"+item.INSERTDATE+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delMeal("+pt_no+",&#34;"+item.MEALTIME+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>식사<select class='form-control' id = 'mealType'>";
				html1 += "<option>아침</option>";
				html1 += "<option>점심</option>";
				html1 += "<option>저녁</option>";
				html1 += "<option>간식</option>";
				html1 += "</select>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
				html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>식사<select class='form-control' id = 'mealType'>";
					html1 += "<option>아침</option>";
					html1 += "<option>점심</option>";
					html1 += "<option>저녁</option>";
					html1 += "<option>간식</option>";
					html1 += "</select>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
					html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu1").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateMeal(pt_no,typeEat,mealTime,whatEat,insertDate){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateMeal",
		data: {
			pt_no : pt_no,
			today : today,
			typeEat : typeEat,
			mealTime : mealTime,
			whatEat : whatEat
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>식사</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'mealTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>식사</th>";
			html1 += "<th>시간</th>";
			html1 += "<th>식단</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TYPEEAT + "</td>";
				html1 += "<td>" + item.MEALTIME + "</td>";
				html1 += "<td>" + item.WHATEAT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				if(item.TYPEEAT == "아침"){
				html1 += "<td>식사<select class='form-control' id = 'updateMealType'>";
				html1 += "<option selected='selected'>아침</option>";
				html1 += "<option>점심</option>";
				html1 += "<option>저녁</option>";
				html1 += "<option>간식</option>";
				html1 += "</select>";
				} else if(item.TYPEEAT == "점심"){
						html1 += "<td>식사<select class='form-control' id = 'updateMealType'>";
						html1 += "<option>아침</option>";
						html1 += "<option selected='selected'>점심</option>";
						html1 += "<option>저녁</option>";
						html1 += "<option>간식</option>";
						html1 += "</select>";
				} else if(item.TYPEEAT == "저녁"){
					html1 += "<td>식사<select class='form-control' id = 'updateMealType'>";
					html1 += "<option>아침</option>";
					html1 += "<option>점심</option>";
					html1 += "<option selected='selected'>저녁</option>";
					html1 += "<option>간식</option>";
					html1 += "</select>";
				} else if(item.TYPEEAT == "간식"){
					html1 += "<td>식사<select class='form-control' id = 'updateMealType'>";
					html1 += "<option>아침</option>";
					html1 += "<option>점심</option>";
					html1 += "<option>저녁</option>";
					html1 += "<option selected='selected'>간식</option>";
					html1 += "</select>";
				}
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'updateMealTime'></td>";
				html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'updateWhatEat'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateMeal("+pt_no+",&#34;"+item.MEAL_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu1").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateMeal(pt_no,meal_No) {
	var today = $(".datepicker").val();
	var typeEat = document.getElementById("updateMealType").value;
	var mealTime = document.getElementById("updateMealTime").value;
	var whatEat = document.getElementById("updateWhatEat").value;
	
	$.ajax({
		type : "post",
		url : "updateMeal",
		data: {
			pt_no : pt_no,
			today : today,
			typeEat : typeEat,
			mealTime : mealTime,
			whatEat : whatEat,
			meal_No : meal_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>식사</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'mealTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>식사</th>";
			html1 += "<th>시간</th>";
			html1 += "<th>식단</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TYPEEAT + "</td>";
				html1 += "<td>" + item.MEALTIME + "</td>";
				html1 += "<td>" + item.WHATEAT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateMeal("+pt_no+",&#34;"+item.TYPEEAT+"&#34;,&#34;"+item.MEALTIME+"&#34;,&#34;"+item.WHATEAT+"&#34;,&#34;"+item.INSERTDATE+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delMeal("+pt_no+",&#34;"+item.MEALTIME+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>식사<select class='form-control' id = 'mealType'>";
				html1 += "<option>아침</option>";
				html1 += "<option>점심</option>";
				html1 += "<option>저녁</option>";
				html1 += "<option>간식</option>";
				html1 += "</select>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
				html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>식사<select class='form-control' id = 'mealType'>";
					html1 += "<option>아침</option>";
					html1 += "<option>점심</option>";
					html1 += "<option>저녁</option>";
					html1 += "<option>간식</option>";
					html1 += "</select>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'mealTime' id = 'mealTime'></td>";
					html1 += "<td>식단<input type = 'text' class='form-control' name = 'whatEat' id = 'whatEat'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollMeal("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu1").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollExercise(pt_no) {
	var today = $(".datepicker").val();
	var exerciseText = document.getElementById("exerciseText").value;
	var exerciseTime = document.getElementById("exerciseTime").value;
	
	$.ajax({
		type : "post",
		url : "enrollExercise",
		data: {
			pt_no : pt_no,
			today : today,
			exerciseText : exerciseText,
			exerciseTime : exerciseTime
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-success'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>운동</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'exerciseTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>운동</th>";
			html1 += "<th>시간</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.EXERCISETEXT + "</td>";
				html1 += "<td>" + item.EXERCISETIME + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateExercise("+pt_no+",&#34;"+item.EXERCISETEXT+"&#34;,&#34;"+item.EXERCISETIME+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delExercise("+pt_no+",&#34;"+item.EXERCISE_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu2").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delExercise(pt_no,exercise_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delExercise",
		data: {
			pt_no : pt_no,
			today : today,
			exercise_No : exercise_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-success'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>운동</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'exerciseTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>운동</th>";
			html1 += "<th>시간</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.EXERCISETEXT + "</td>";
				html1 += "<td>" + item.EXERCISETIME + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateExercise("+pt_no+",&#34;"+item.EXERCISETEXT+"&#34;,&#34;"+item.EXERCISETIME+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delExercise("+pt_no+",&#34;"+item.EXERCISE_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu2").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateExercise(pt_no,exerciseText,exerciseTime){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateExercise",
		data: {
			pt_no : pt_no,
			today : today,
			exerciseText : exerciseText,
			exerciseTime : exerciseTime
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-success'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>운동</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'exerciseTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>운동</th>";
			html1 += "<th>시간</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.EXERCISETEXT + "</td>";
				html1 += "<td>" + item.EXERCISETIME + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'updateExerciseText'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'updateExerciseTime'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateExercise("+pt_no+",&#34;"+item.EXERCISE_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu2").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateExercise(pt_no,exercise_No) {
	var today = $(".datepicker").val();
	var exerciseText = document.getElementById("updateExerciseText").value;
	var exerciseTime = document.getElementById("updateExerciseTime").value;
	
	$.ajax({
		type : "post",
		url : "updateExercise",
		data: {
			pt_no : pt_no,
			today : today,
			exerciseText : exerciseText,
			exerciseTime : exerciseTime,
			exercise_No : exercise_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-success'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>운동</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'exerciseTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>운동</th>";
			html1 += "<th>시간</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.EXERCISETEXT + "</td>";
				html1 += "<td>" + item.EXERCISETIME + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateExercise("+pt_no+",&#34;"+item.EXERCISETEXT+"&#34;,&#34;"+item.EXERCISETIME+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delExercise("+pt_no+",&#34;"+item.EXERCISE_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td></td>";
				html1 += "<td></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'exerciseText'></td>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'exerciseTime'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollExercise("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu2").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollDailyCleaning(pt_no) {
	var today = $(".datepicker").val();
	var cleaning = document.getElementById("cleaning").value;
	var cleaningReport = document.getElementById("cleaningReport").value;
	
	$.ajax({
		type : "post",
		url : "enrollDailyCleaning",
		data: {
			pt_no : pt_no,
			today : today,
			cleaning : cleaning,
			cleaningReport : cleaningReport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>청소</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyCleaningTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "<th></th>";
			html1 += "<th></th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.CLEANING + "</td>";
				html1 += "<td>" + item.CLEANINGREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailycleaning("+pt_no+",&#34;"+item.CLEANING+"&#34;,&#34;"+item.CLEANINGREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyCleaning("+pt_no+",&#34;"+item.DAILYCLEANING_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu3").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delDailyCleaning(pt_no,dailycleaning_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delDailyCleaning",
		data: {
			pt_no : pt_no,
			today : today,
			dailycleaning_No : dailycleaning_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>청소</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyCleaningTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.CLEANING + "</td>";
				html1 += "<td>" + item.CLEANINGREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailycleaning("+pt_no+",&#34;"+item.CLEANING+"&#34;,&#34;"+item.CLEANINGREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyCleaning("+pt_no+",&#34;"+item.DAILYCLEANING_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu3").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateDailycleaning(pt_no,cleaning,cleaningReport){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateDailycleaning",
		data: {
			pt_no : pt_no,
			today : today,
			cleaning : cleaning,
			cleaningReport : cleaningReport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>청소</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailycleaningTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.CLEANING + "</td>";
				html1 += "<td>" + item.CLEANINGREPORT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'exerciseText' id = 'updateCleaning'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'exerciseTime' id = 'updateCleaningReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateDailyCleaning("+pt_no+",&#34;"+item.DAILYCLEANING_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu3").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateDailyCleaning(pt_no,dailycleaning_No) {
	var today = $(".datepicker").val();
	var cleaning = document.getElementById("updateCleaning").value;
	var cleaningReport = document.getElementById("updateCleaningReport").value;
	
	$.ajax({
		type : "post",
		url : "updateDailyCleaning",
		data: {
			pt_no : pt_no,
			today : today,
			cleaning : cleaning,
			cleaningReport : cleaningReport,
			dailycleaning_No : dailycleaning_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>청소</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailycleaningTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.CLEANING + "</td>";
				html1 += "<td>" + item.CLEANINGREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailycleaning("+pt_no+",&#34;"+item.CLEANING+"&#34;,&#34;"+item.CLEANINGREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyCleaning("+pt_no+",&#34;"+item.DAILYCLEANING_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'cleaning' id = 'cleaning'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'cleaningReport' id = 'cleaningReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyCleaning("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu3").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollDailyWash(pt_no) {
	var today = $(".datepicker").val();
	var wash = document.getElementById("wash").value;
	var washReport = document.getElementById("washReport").value;
	
	$.ajax({
		type : "post",
		url : "enrollDailyWash",
		data: {
			pt_no : pt_no,
			today : today,
			wash : wash,
			washReport : washReport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>세탁</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyWashTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "<th></th>";
			html1 += "<th></th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.WASH + "</td>";
				html1 += "<td>" + item.WASHREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyWash("+pt_no+",&#34;"+item.WASH+"&#34;,&#34;"+item.WASHREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyWash("+pt_no+",&#34;"+item.DAILYWASH_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu4").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delDailyWash(pt_no,dailywash_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delDailyWash",
		data: {
			pt_no : pt_no,
			today : today,
			dailywash_No : dailywash_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>세탁</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyWashTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.WASH + "</td>";
				html1 += "<td>" + item.WASHREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyWash("+pt_no+",&#34;"+item.WASH+"&#34;,&#34;"+item.WASHREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyWash("+pt_no+",&#34;"+item.DAILYWASH_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu4").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateDailyWash(pt_no,wash,washReport){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateDailyWash",
		data: {
			pt_no : pt_no,
			today : today,
			wash : wash,
			washReport : washReport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>세탁</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyWashTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.WASH + "</td>";
				html1 += "<td>" + item.WASHREPORT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'updateWash' id = 'updateWash'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'updateWashReport' id = 'updateWashReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateDailyWash("+pt_no+",&#34;"+item.DAILYWASH_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu4").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateDailyWash(pt_no,dailywash_No) {
	var today = $(".datepicker").val();
	var wash = document.getElementById("updateWash").value;
	var washReport = document.getElementById("updateWashReport").value;
	
	$.ajax({
		type : "post",
		url : "updateDailyWash",
		data: {
			pt_no : pt_no,
			today : today,
			wash : wash,
			washReport : washReport,
			dailywash_No : dailywash_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>세탁</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyWashTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.WASH + "</td>";
				html1 += "<td>" + item.WASHREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyWash("+pt_no+",&#34;"+item.WASH+"&#34;,&#34;"+item.WASHREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyWash("+pt_no+",&#34;"+item.DAILYWASH_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'wash' id = 'wash'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'washReport' id = 'washReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu4").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollDailyShower(pt_no) {
	var today = $(".datepicker").val();
	var shower = document.getElementById("shower").value;
	var showerReport = document.getElementById("showerReport").value;
	
	$.ajax({
		type : "post",
		url : "enrollDailyShower",
		data: {
			pt_no : pt_no,
			today : today,
			shower : shower,
			showerReport : showerReport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>샤워</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyShowerTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "<th></th>";
			html1 += "<th></th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SHOWER + "</td>";
				html1 += "<td>" + item.SHOWERREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyShower("+pt_no+",&#34;"+item.SHOWER+"&#34;,&#34;"+item.SHOWERREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyShower("+pt_no+",&#34;"+item.DAILYSHOWER_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu5").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delDailyShower(pt_no,dailyshower_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delDailyShower",
		data: {
			pt_no : pt_no,
			today : today,
			dailyshower_No : dailyshower_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>샤워</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyShowerTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SHOWER + "</td>";
				html1 += "<td>" + item.SHOWERREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyShower("+pt_no+",&#34;"+item.SHOWER+"&#34;,&#34;"+item.SHOWERREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyShower("+pt_no+",&#34;"+item.DAILYSHOWER_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu5").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateDailyShower(pt_no,shower,showerReport){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateDailyShower",
		data: {
			pt_no : pt_no,
			today : today,
			shower : shower,
			showerReport : showerReport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>샤워</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyShowerTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SHOWER + "</td>";
				html1 += "<td>" + item.SHOWERREPORT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>운동<input type = 'text' class='form-control' name = 'updateShower' id = 'updateShower'></td>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'updateShowerReport' id = 'updateShowerReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateDailyShower("+pt_no+",&#34;"+item.DAILYSHOWER_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu5").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateDailyShower(pt_no,dailyshower_No) {
	var today = $(".datepicker").val();
	var shower = document.getElementById("updateShower").value;
	var showerReport = document.getElementById("updateShowerReport").value;
	
	$.ajax({
		type : "post",
		url : "updateDailyShower",
		data: {
			pt_no : pt_no,
			today : today,
			shower : shower,
			showerReport : showerReport,
			dailyshower_No : dailyshower_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-info'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>샤워</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dailyShowerTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SHOWER + "</td>";
				html1 += "<td>" + item.SHOWERREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDailyShower("+pt_no+",&#34;"+item.SHOWER+"&#34;,&#34;"+item.SHOWERREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDailyShower("+pt_no+",&#34;"+item.DAILYSHOWER_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDailyWash("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'shower' id = 'shower'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'showerReport' id = 'showerReport'></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDailyShower("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu5").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollBedTime(pt_no) {
	var today = $(".datepicker").val();
	var timeToSleep = document.getElementById("timeToSleep").value;
	var timeToGetup = document.getElementById("timeToGetup").value;
	var report = document.getElementById("report").value;
	
	$.ajax({
		type : "post",
		url : "enrollBedTime",
		data: {
			pt_no : pt_no,
			today : today,
			timeToSleep : timeToSleep,
			timeToGetup : timeToGetup,
			report : report
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>수면시간</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'bedTimeTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>수면시간</th>";
			html1 += "<th>기상시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TIMETOSLEEP + "</td>";
				html1 += "<td>" + item.TIMETOGETUP + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateBedTime("+pt_no+",&#34;"+item.TIMETOSLEEP+"&#34;,&#34;"+item.TIMETOGETUP+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delBedTime("+pt_no+",&#34;"+item.BEDTIME_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
				html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
					html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu6").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delBedTime(pt_no,bedtime_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delBedTime",
		data: {
			pt_no : pt_no,
			today : today,
			bedtime_No : bedtime_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>수면시간</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'bedTimeTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>수면식사</th>";
			html1 += "<th>기상시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TIMETOSLEEP + "</td>";
				html1 += "<td>" + item.TIMETOGETUP + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateBedTime("+pt_no+",&#34;"+item.TIMETOSLEEP+"&#34;,&#34;"+item.TIMETOGETUP+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delBedTime("+pt_no+",&#34;"+item.BEDTIME_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
				html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
					html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu6").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateBedTime(pt_no,timeToSleep,timeToGetup,report){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateBedTime",
		data: {
			pt_no : pt_no,
			today : today,
			timeToSleep : timeToSleep,
			timeToGetup : timeToGetup,
			report : report
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>수면시간</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'mealTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>수면시간</th>";
			html1 += "<th>기상시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TIMETOSLEEP + "</td>";
				html1 += "<td>" + item.TIMETOGETUP + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'updateTimeToSleep' id = 'updateTimeToSleep'></td>";
				html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'updateTimeToGetup' id = 'updateTimeToGetup'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'updateReport' id = 'updateReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateBedTime("+pt_no+",&#34;"+item.BEDTIME_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu6").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateBedTime(pt_no,bedtime_No) {
	var today = $(".datepicker").val();
	var timeToSleep = document.getElementById("updateTimeToSleep").value;
	var timeToGetup = document.getElementById("updateTimeToGetup").value;
	var report = document.getElementById("updateReport").value;
	
	$.ajax({
		type : "post",
		url : "updateBedTime",
		data: {
			pt_no : pt_no,
			today : today,
			timeToSleep : timeToSleep,
			timeToGetup : timeToGetup,
			report : report,
			bedtime_No : bedtime_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-primary'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>수면시간</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'bedTimeTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>수면식사</th>";
			html1 += "<th>식사시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.TIMETOSLEEP + "</td>";
				html1 += "<td>" + item.TIMETOGETUP + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateBedTime("+pt_no+",&#34;"+item.TIMETOSLEEP+"&#34;,&#34;"+item.TIMETOGETUP+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delBedTime("+pt_no+",&#34;"+item.BEDTIME_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
				html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>수면시간<input type = 'text' class='form-control' name = 'timeToSleep' id = 'timeToSleep'></td>";
					html1 += "<td>기상시간<input type = 'text' class='form-control' name = 'timeToGetup' id = 'timeToGetup'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'report' id = 'report'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollBedTime("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu6").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollDr_op(pt_no) {
	var today = $(".datepicker").val();
	var reportTime = document.getElementById("reportTime").value;
	var report = document.getElementById("dreport").value;
	
	alert(report);
	
	$.ajax({
		type : "post",
		url : "enrollDr_op",
		data: {
			pt_no : pt_no,
			today : today,
			reportTime : reportTime,
			report : report
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-warning'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>의사소견</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'dr_opTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.REPORTTIME + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDr_op("+pt_no+",&#34;"+item.REPORTTIME+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDr_op("+pt_no+",&#34;"+item.DR_OP_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu7").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delDr_op(pt_no, dr_op_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delDr_op",
		data: {
			pt_no : pt_no,
			today : today,
			dr_op_No : dr_op_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-warning'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>의사소견</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'exerciseTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.REPORTTIME + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDr_op("+pt_no+",&#34;"+item.REPORTTIME+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDr_op("+pt_no+",&#34;"+item.DR_OP_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu7").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateDr_op(pt_no,reportTime,report){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateDr_op",
		data: {
			pt_no : pt_no,
			today : today,
			reportTime : reportTime,
			report : report
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-warning'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>의사소견</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'mealTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.REPORTTIME + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'updateReportTime' id = 'updateReportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'updateDreport' id = 'updateDreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateDr_op("+pt_no+",&#34;"+item.DR_OP_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu7").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateDr_op(pt_no,dr_op_No) {
	var today = $(".datepicker").val();
	var reportTime = document.getElementById("updateReportTime").value;
	var report = document.getElementById("updateDreport").value;
	
	$.ajax({
		type : "post",
		url : "updateDr_op",
		data: {
			pt_no : pt_no,
			today : today,
			reportTime : reportTime,
			report : report,
			dr_op_No : dr_op_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-warning'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>의사소견</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'bedTimeTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.REPORTTIME + "</td>";
				html1 += "<td>" + item.REPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateDr_op("+pt_no+",&#34;"+item.REPORTTIME+"&#34;,&#34;"+item.REPORT+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delDr_op("+pt_no+",&#34;"+item.DR_OP_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'reportTime' id = 'reportTime'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'dreport' id = 'dreport'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollDr_op("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu8").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function enrollSpecial(pt_no) {
	var today = $(".datepicker").val();
	var sreportTime = document.getElementById("sreportTime").value;
	var sreport = document.getElementById("sreport").value;
	
	$.ajax({
		type : "post",
		url : "enrollSpecial",
		data: {
			pt_no : pt_no,
			today : today,
			sreportTime : sreportTime,
			sreport : sreport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-danger'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>특이사항</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'specialTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SREPORTTIME + "</td>";
				html1 += "<td>" + item.SREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateSpecial("+pt_no+",&#34;"+item.SREPORTTIME+"&#34;,&#34;"+item.SREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delSpecial("+pt_no+",&#34;"+item.SPECIAL_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu8").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function delSpecial(pt_no, special_No) {
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "delSpecial",
		data: {
			pt_no : pt_no,
			today : today,
			special_No : special_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-danger'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>특이사항</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'specialTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SREPORTTIME + "</td>";
				html1 += "<td>" + item.SREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateSpecial("+pt_no+",&#34;"+item.SREPORTTIME+"&#34;,&#34;"+item.SREPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delSpecial("+pt_no+",&#34;"+item.SPECIAL_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu8").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}

function showUpdateSpecial(pt_no,sreportTime,sreport){
	var today = $(".datepicker").val();
	
	$.ajax({
		type : "post",
		url : "showUpdateSpecial",
		data: {
			pt_no : pt_no,
			today : today,
			sreportTime : sreportTime,
			sreport : sreport
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-danger'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>특이사항</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'specialTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SREPORTTIME + "</td>";
				html1 += "<td>" + item.SREPORT + "</td>";
				html1 += "</tr>";
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'updatesReportTime' id = 'updatesReportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'updatesReport' id = 'updatesReport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '확인' class='btn btn-primary' onclick = 'updateSpecial("+pt_no+",&#34;"+item.SPECIAL_NO+"&#34;)'>";
				html1 += "</td>";
				html1 += "</tr>";
				})//each
				} else{
					alert("뭔가 잘못됐어! 집으로 돌아가자");
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu8").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})
}

function updateSpecial(pt_no,special_No) {
	var today = $(".datepicker").val();
	var sreportTime = document.getElementById("updatesReportTime").value;
	var sreport = document.getElementById("updatesReport").value;
	
	$.ajax({
		type : "post",
		url : "updateSpecial",
		data: {
			pt_no : pt_no,
			today : today,
			sreportTime : sreportTime,
			sreport : sreport,
			special_No : special_No
		},//data
		success : function(data) {
			var html1 = "";
			html1 += "<div class='panel panel-danger'>";
			html1 += "<div class='panel-heading'>";
			html1 += "<h3 class='panel-title'>특이사항</h3>";
			html1 += "</div>";
			html1 += "<div class='panel-body' id = 'specialTable'>";
			html1 += "<table class='table table-hover'>";
			html1 += "<thead>";
			html1 += "<tr>";
			html1 += "<th>시간</th>";
			html1 += "<th>내용</th>";
			html1 += "</tr>";
			html1 += "</thead>";
			if(data.length > 0){
			$.each(data, function(index,item) {
				html1 += "<tbody>";
				html1 += "<tr>";
				html1 += "<td>" + item.SREPORTTIME + "</td>";
				html1 += "<td>" + item.SREPORT + "</td>";
				html1 += "<td><input type='button' value = '수정' class='btn btn-primary' onclick = 'showUpdateSpecial("+pt_no+",&#34;"+item.REPORTTIME+"&#34;,&#34;"+item.REPORT+"&#34;,&#34;"+item.REPORT+"&#34;)'></td>";
				html1 += "<td><input type='button' value = '삭제' class='btn btn-primary' onclick = 'delSpecial("+pt_no+",&#34;"+item.DR_OP_NO+"&#34;)'></td>";
				html1 += "</tr>";
				})//each
				html1 += "<tr>";
				html1 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
				html1 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
				html1 += "<td>";
				html1 += "<input type='button' value = '추가' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
				html1 += "</td>";
				html1 += "</tr>";
				} else{
					html1 += "<tbody>";
					html1 += "<tr>";
					html1 += "<td colspan='3'>아직등록되지않았습니다.</td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td>시간<input type = 'text' class='form-control' name = 'sreportTime' id = 'sreportTime'></td>";
					html1 += "<td>내용<input type = 'text' class='form-control' name = 'sreport' id = 'sreport'></td>";
					html1 += "</tr>";
					html1 += "<tr>";
					html1 += "<td></td>";
					html1 += "<td></td>";
					html1 += "<td>";
					html1 += "<input type='button' value = '등록' class='btn btn-primary' onclick = 'enrollSpecial("+pt_no+")'>";
					html1 += "</td>";
					html1 += "</tr>";
				}
			html1 += "</tbody>";
			html1 += "</table>";
			html1 += "</div>";
			html1 += "</div>";
			$("#menu8").html(html1);
		},
		error : function(e) {
			console.log(e);
		}
	})	
}
</script>
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
        <li class="active"><a href="managerLogin">Home</a></li>
        <li><a href="managerPatientInput">환자 등록</a></li>
        <li><a href="managerPatientInfo">담당 환자 정보</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.nurseId}</a></li>
      </ul>
    </div>
  </div>
</nav>

<form>

<div class="container text-center">    
  <div class="row content">
  
  <table>
  	 <tr>
 		<td class="col-sm-7" id="tabStart">
 		 <div class="col-md-12" id="tab">
 			<div class="text-left" style="font-weight: bold;">환자</div> 
				<div class="container col-md-12">
  					<h2>환자 스케쥴 입력</h2>
  					<ul class="nav nav-tabs">
						<li class="active">
					    <li><a data-toggle="tab" href="#menu1">식사</a></li>
					    <li><a data-toggle="tab" href="#menu2">운동</a></li>
					    <li><a data-toggle="tab" href="#menu3">청소</a></li>
					    <li><a data-toggle="tab" href="#menu4">세탁</a></li>
					    <li><a data-toggle="tab" href="#menu5">샤워</a></li>
					    <li><a data-toggle="tab" href="#menu6">수면</a></li>
					    <li><a data-toggle="tab" href="#menu7">의사소견</a></li>
					    <li><a data-toggle="tab" href="#menu8">특이사항</a></li>
					</ul>

  				<div class="tab-content">
    				
			    <div id="menu1" class="tab-pane fade in active">
			      <h3>Menu 1</h3>
			      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			    </div>
			    
			    <div id="menu2" class="tab-pane fade">
			      <h3>Menu 2</h3>
			      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			    </div>
			    
			    <div id="menu3" class="tab-pane fade">
			      <h3>Menu 3</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu4" class="tab-pane fade">
			      <h3>Menu 4</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu5" class="tab-pane fade">
			      <h3>Menu 5</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu6" class="tab-pane fade">
			      <h3>Menu 6</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu7" class="tab-pane fade">
			      <h3>Menu 7</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    
			    <div id="menu8" class="tab-pane fade">
			      <h3>Menu 8</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
  			
  				</div>
			</div>
			</div>   			
 		</td>
 		
 		<td rowspan="2" >
 			<div class="col-sm-15">
			<p>Date: <input type="text" class="datepicker"></p>
	 			<div class="panel text-left">  
		      		<div class = 'col-md-15'>
		      			<div class='btn-group btn-group-justified'>
		      				<a href='#' class='btn btn-info'>환자번호</a>
		      				<a href='#' class='btn btn-info'>이름</a>
		      				<a href='#' class='btn btn-info'>호실</a>
		      				<a href='#' class='btn btn-info'>생년월일</a>
		      			</div>
		      			
		      			<div class='list-group text-left' style='height:540px;'>
		      				<c:if test="${patientList != null }">
		      					<table class='text-center'>
				      				<c:forEach var = "item" items="${patientList}">
				      					<tr class='list-group-item' id="${item.pt_no}">
				      						<td width='160px;'>${item.pt_no }</td> 
				      						<td width='160px;'>${item.name }</td>
				      						<td width='160px;'>${item.room_no }</td>
				      						<td width='160px;'>${item.birthdate }</td>
				      					</tr>
				      				</c:forEach>
				      			</table>
		      				</c:if>
		      			</div>
		      		</div>
		      	</div>
			</div>
		</td>
	</tr>
</table>
</div>
</div>

</form>

<footer class="container-fluid text-center">
	<p>Footer Text</p>
</footer>

</body>

</html>